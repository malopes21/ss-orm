package blazon.script.roleright.entry.items;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

public class ImportRoleRightRequesterFunctions {

	public static Long insertRequester(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("requester_id") == null) {
			
			return null;
		}
		
		Map<String, Object> requesterData = readRequester((Long) row.get("requester_id"));
		
		if(requesterData.isEmpty()) {
			
			return null;
		}
		
		PreparedStatement statement = null;
		
		String sql = "insert into RoleRightDirectoryEntry (type, username, displayName, directoryIdentifier) values (?, ?, ?, ?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setString(1, (String) "USER");
		statement.setString(2, (String) requesterData.get("username"));
		statement.setString(3, (String) requesterData.get("displayName"));
		statement.setLong(4, (Long) requesterData.get("id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
		
		Long requesterRoleRightEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	requesterRoleRightEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating instance failed, no ID obtained.");
		    }
		}
		
		return requesterRoleRightEntryId;
	}
	
	
	static Map<String, Object> readRequester(Long beneficiaryId) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from User where id = ?";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, beneficiaryId);
		
		rs = statement.executeQuery();
		
		Map<String, Object> row = new HashMap<>();
		
		if(rs.next()) {
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
		}
		
		conn.commit();
		conn.close();
		
		return row;
	}

}
