package blazon.script.directory.resource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import blazon.script.util.ConnectionFactory;

class ImportResourcesFunctions {
	
	private final static Logger LOGGER = Logger.getLogger(ImportResourcesService.class.getName());
	
	static List<Map<String, Object>> read(int limit, int offset) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from Resource r \n" + 
				"order by r.id \n" + 
				"limit %s offset %s ";

		sql = String.format(sql, limit, offset);
		statement = conn.prepareStatement(sql);
		rs = statement.executeQuery();
		
		while(rs.next()) {
			
			Map<String, Object> row = new HashMap<>();
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
			
			rows.add(row);
		}
		
		conn.commit();
		
		return rows;
	}
	

	public static void save(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();
		
		for(Map<String, Object> row: rows) {
			
			saveResource(targetConn, row);
			ImportResourceOwnersFunctions.importOwners(targetConn, row);
		}
		
		targetConn.commit();
		sourceConn.commit();
		
		targetConn.close();
		sourceConn.close();
	}


	private static void saveResource(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		
		String sql = "INSERT INTO Resource \n" + 
				"(id, \n" + 
				"certifiable, \n" + 
				"creationDate, \n" + 
				"description, \n" + 
				"directoryIndexationSynchronized, \n" + 
				"logoImageId, \n" + 
				"name, \n" + 
				"passwordVaultEnabled, \n" + 
				"provisioningEnabled, \n" + 
				"risk, \n" + 
				"selfServiceSynchronized, \n" + 
				"syncPassword, \n" + 
				"tags, \n" + 
				"type, \n" + 
				"uri, \n" + 
				"visibleToSelfService, \n" + 
				"accessClassification_id, \n" + 
				"category_id, \n" + 
				"creator_id) " + 
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		statement = conn.prepareStatement(sql);
		
		statement.setLong(1, (Long) row.get("id"));
		statement.setBoolean(2, (Boolean) row.get("certifiable"));
		statement.setDate(3, (java.sql.Date) row.get("creationDate"));
		statement.setString(4, (String) row.get("description"));
		if(row.get("directoryIndexationSynchronized") != null) { statement.setBoolean(5, (Boolean) row.get("directoryIndexationSynchronized"));} else { statement.setBoolean(5, false);}
		statement.setString(6, (String) row.get("logoImageId"));
		statement.setString(7, (String) row.get("name"));
		statement.setBoolean(8, (Boolean) row.get("passwordVaultEnabled"));
		statement.setBoolean(9, (Boolean) row.get("provisioningEnabled"));
		statement.setString(10, (String) row.get("risk"));
		if(row.get("selfServiceSynchronized") != null) { statement.setBoolean(11, (Boolean) row.get("selfServiceSynchronized"));} else { statement.setBoolean(11, false);} 
		statement.setBoolean(12, (Boolean) row.get("syncPassword"));
		statement.setString(13, (String) row.get("tags"));
		if(row.get("type") != null) { statement.setString(14, (String) row.get("creator_id")); } else { statement.setString(14, "REGULAR");}
		statement.setString(15, (String) row.get("uri"));
		statement.setBoolean(16, (Boolean) row.get("visibleToSelfService"));
		if(row.get("accessClassification_id") != null) { statement.setBoolean(17, (Boolean) row.get("accessClassification_id"));} else { statement.setObject(17, null); }
		if(row.get("category_id") != null) {statement.setLong(18, (Long) row.get("category_id"));} else { statement.setObject(18, null);}
		if(row.get("creator_id") != null) {statement.setLong(19, (Long) row.get("creator_id"));} else { statement.setObject(19, null);}
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		LOGGER.log(Level.INFO, "Enviando comando SQL para importar resource com id " + row.get("id"));
	}

}
