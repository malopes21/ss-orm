package blazon.script.directory.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

public class ImportAdditionalFieldsFunctions {


	public static void insertAdditionalFields(Connection targetConn, Map<String, Object> row) throws Exception {

		List<Map<String, Object>> additionalFields = readAdditionalFields((Long) row.get("id"));
		
		insertAdditionalFields(targetConn, (Long) row.get("id"), additionalFields);
	}
	
	
	private static List<Map<String, Object>> readAdditionalFields(Long entry_id) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from EntryAttributeValue where entry_id = ?";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, entry_id);
		
		rs = statement.executeQuery();
		
		List<Map<String, Object>> rows = new ArrayList<>();
		
		while(rs.next()) {
			
			Map<String, Object> row = new HashMap<>();
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
			
			rows.add(row);
		}
		
		conn.commit();
		conn.close();
		
		return rows;
	}


	private static void insertAdditionalFields(Connection conn, Long entry_id, List<Map<String, Object>> rows) throws SQLException {
		
		for(Map<String, Object> row: rows) {
			
			PreparedStatement statement = null;
			
			String sql = "insert into EntryAttributeValue (name, value, entry_id) values (?, ?, ?) ";
			
			statement = conn.prepareStatement(sql);
			statement.setString(1, (String) row.get("name"));
			statement.setString(2, (String) row.get("value"));
			statement.setLong(3, entry_id);
			
			int affectedRows = statement.executeUpdate();

			if (affectedRows == 0) {
			    throw new RuntimeException("Creating instance failed, no rows affected.");
			}
		}
	}
}
