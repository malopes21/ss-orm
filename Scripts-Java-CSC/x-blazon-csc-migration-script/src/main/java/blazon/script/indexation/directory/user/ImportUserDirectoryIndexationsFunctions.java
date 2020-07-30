package blazon.script.indexation.directory.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.json.JSONObject;

import blazon.script.indexation.common.ImportAttributeSchemaService;
import blazon.script.indexation.directory.user.builder.ImportUserToIndexationBuilder;
import blazon.script.util.ConnectionFactory;

class ImportUserDirectoryIndexationsFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportUserDirectoryIndexationsFunctions.class.getName());

	static List<Map<String, Object>> read(int limit, int offset) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * \n" + 
				"from User r \n" + 
				"join Entry e on e.id = r.id \n" + 
				"where 1 = 1 \n" +
				"limit %s offset %s ";

		sql = String.format(sql, limit, offset);
		statement = conn.prepareStatement(sql);
		rs = statement.executeQuery();

		while (rs.next()) {

			Map<String, Object> row = new HashMap<>();
			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}

			rows.add(row);
		}

		conn.commit();

		return rows;
	}

	public static void save(List<Map<String, Object>> rows) throws Exception {

		Connection sourceConn = ConnectionFactory.getSourceConnection();
		
		Map<String, Map<String, Object>> schema = ImportAttributeSchemaService.getAttributeSchema(sourceConn, "USER", null);

		for (Map<String, Object> row : rows) {

			try {
				
				ImportAttributeSchemaService.addAdditionalFields(sourceConn, row);
				
				ImportAttributeSchemaService.addCreatedByInfo(sourceConn, row);
				
				JSONObject entryJson = ImportUserToIndexationBuilder.createEntry(schema, row);
				
				System.out.println(entryJson.toString());
				
				saveTargetRole(entryJson);

			} catch (Exception e) {

				LOGGER.log(Level.ERROR, String.format("Erro ao importar user com id %s", row.get("id")));
				throw e;
			}
		}

		sourceConn.commit();
		sourceConn.close();
	}


	public static void saveTargetRole(JSONObject entryJson) throws Exception {
		
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPut postRequest = new HttpPut(
			"http://localhost:9200/entries/entries/"+entryJson.getString("key"));

		StringEntity input = new StringEntity(entryJson.toString(), "UTF-8");
		
		input.setContentType("application/json");
		postRequest.setEntity(input);

		HttpResponse response = httpClient.execute(postRequest);

		if (response.getStatusLine().getStatusCode() != 200 && response.getStatusLine().getStatusCode() != 201) {
			throw new RuntimeException("Failed : HTTP error code : "
				+ response.getStatusLine().getStatusCode());
		}
		
		LOGGER.log(Level.INFO, String.format("Comando HTTP POST emitido para importar user com id %s", entryJson.getLong("identifier")));
	}
	
}
