package blazon.script.directory.resource.dependencies;

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

public class ImportResourceOwnersFunctions {
	

	public static void importOwners(Connection targetConn, Map<String, Object> row) throws Exception {

		List<Map<String, Object>> rows = readSourceOwners((Long) row.get("id"));
		
		saveTargetOwners(targetConn, rows);
	}
	
	
	static List<Map<String, Object>> readSourceOwners(Long resourceId) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from Resource_User ru where ru.managedResources_id = ? \n" ;

		statement = conn.prepareStatement(sql);
		statement.setLong(1, resourceId);
		
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
	

	public static void saveTargetOwners(Connection targetConn, List<Map<String, Object>> rows) throws Exception {

		for(Map<String, Object> row: rows) {
			
			saveOwner(targetConn, row);
		}
		
	}

	
	private static void saveOwner(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		
		String sql = "INSERT INTO Resource_User \n" + 
				"(id, \n" + 
				"managedResources_id, \n" + 
				"owners_id) \n" + 
				"VALUES(?, ?, ?)";
		
		statement = conn.prepareStatement(sql);
		
		statement.setLong(1, (Long) row.get("id"));
		statement.setLong(2, (Long) row.get("managedResources_id"));
		statement.setLong(3, (Long) row.get("owners_id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

}
