package blazon.script.directory.schema;

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

class ImportSchemaFunctions {
	
	private final static Logger LOGGER = Logger.getLogger(ImportSchemaFunctions.class.getName());
	
	static List<Map<String, Object>> read(int limit, int offset) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from EntryAttribute ea \n" + 
				"order by id \n" + 
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
			
			saveAttribute(targetConn, row);
		}
		
		targetConn.commit();
		sourceConn.commit();
		
		targetConn.close();
		sourceConn.close();
	}


	private static void saveAttribute(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		
		String sql = "INSERT INTO EntryAttribute \n" + 
				"(id,\n" + 
				" defaultValue,\n" + 
				" defaultt,\n" + 
				" description,\n" + 
				" displayType,\n" + 
				" encrypt,\n" + 
				" label,\n" + 
				" listValueScript,\n" + 
				" managedBySystem,\n" + 
				" name,\n" + 
				" position,\n" + 
				" required,\n" + 
				" schemaa,\n" + 
				" searchable,\n" + 
				" showAtRegistration,\n" + 
				" validationScript,\n" + 
				" visible,\n" + 
				" writable,\n" + 
				" category_id,\n" + 
				" resource_id)\n" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		statement = conn.prepareStatement(sql);
		
		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("defaultValue") != null) {
			statement.setString(2, (String) row.get("defaultValue"));
		} else {
			statement.setObject(2, null);
		}
		if (row.get("defaultt") != null) {
			statement.setBoolean(3, (Boolean) row.get("defaultt"));
		} else {
			statement.setObject(3, null);
		}
		if (row.get("description") != null) {
			statement.setString(4, (String) row.get("description"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("displayType") != null) {
			statement.setString(5, (String) row.get("displayType"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("encrypt") != null) {
			statement.setBoolean(6, (Boolean) row.get("encrypt"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("label") != null) {
			statement.setString(7, (String) row.get("label"));
		} else {
			statement.setObject(7, null);
		}
		if (row.get("listValueScript") != null) {
			statement.setString(8, (String) row.get("listValueScript"));
		} else {
			statement.setObject(8, null);
		}
		if (row.get("managedBySystem") != null) {
			statement.setBoolean(9, (Boolean) row.get("managedBySystem"));
		} else {
			statement.setObject(9, null);
		}
		if (row.get("name") != null) {
			statement.setString(10, (String) row.get("name"));
		} else {
			statement.setObject(10, null);
		}
		if (row.get("position") != null) {
			statement.setInt(11, (Integer) row.get("position"));
		} else {
			statement.setObject(11, null);
		}
		if (row.get("required") != null) {
			statement.setBoolean(12, (Boolean) row.get("required"));
		} else {
			statement.setObject(12, null);
		}
		if (row.get("schemaa") != null) {
			statement.setString(13, (String) row.get("schemaa"));
		} else {
			statement.setObject(13, null);
		}
		if (row.get("searchable") != null) {
			statement.setBoolean(14, (Boolean) row.get("searchable"));
		} else {
			statement.setObject(14, null);
		}
		if (row.get("showAtRegistration") != null) {
			statement.setBoolean(15, (Boolean) row.get("showAtRegistration"));
		} else {
			statement.setObject(15, null);
		}
		if (row.get("validationScript") != null) {
			statement.setString(16, (String) row.get("validationScript"));
		} else {
			statement.setObject(16, null);
		}
		if (row.get("visible") != null) {
			statement.setBoolean(17, (Boolean) row.get("visible"));
		} else {
			statement.setObject(17, null);
		}
		if (row.get("writable") != null) {
			statement.setBoolean(18, (Boolean) row.get("writable"));
		} else {
			statement.setObject(18, null);
		}
		if (row.get("category_id") != null) {
			statement.setLong(19, (Long) row.get("category_id"));
		} else {
			statement.setObject(19, null);
		}
		if (row.get("resource_id") != null) {
			statement.setLong(20, (Long) row.get("resource_id"));
		} else {
			statement.setObject(20, null);
		}
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		LOGGER.log(Level.INFO, "Enviando comando SQL para importar attribute schema com id " + row.get("id"));
	}

}
