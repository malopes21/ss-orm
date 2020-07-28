package blazon.script.roleright.entry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

class ImportRoleRightRoleFunctions {

	static Long insertRole(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("roleId") == null) {
			
			return null;
		}
		
		Map<String, Object> roleData = readRole((Long) row.get("roleId"));
		
		if(roleData.isEmpty()) {
			
			return null;
		}
		
		PreparedStatement statement = null;
		
		String sql = "insert into RoleRightDirectoryEntry (type, name, directoryIdentifier) values (?, ?, ?) ";
				
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setString(1, (String) "ROLE");
		statement.setString(2, (String) roleData.get("name"));
		statement.setLong(3, (Long) roleData.get("id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
		
		Long roleRoleRightEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	roleRoleRightEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating instance failed, no ID obtained.");
		    }
		}
		
		return roleRoleRightEntryId;
	}
	
	
	static Map<String, Object> readRole(Long resourceId) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from Role where id = ?";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, resourceId);
		
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
