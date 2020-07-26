package blazon.script.provisioning.entry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

class ImportProvisioningResourceFunctions {

	static Long insertResource(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("resource_id") == null) {
			
			return null;
		}
		
		Map<String, Object> resourceData = readResource((Long) row.get("resource_id"));
		
		PreparedStatement statement = null;
		
		String sql = "insert into ProvisioningDirectoryEntry (type, name, directoryIdentifier) values (?, ?, ?) ";
				
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setString(1, (String) "RESOURCE");
		statement.setString(2, (String) resourceData.get("name"));
		statement.setLong(3, (Long) resourceData.get("id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
		
		Long resourceProvisioningEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	resourceProvisioningEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating instance failed, no ID obtained.");
		    }
		}
		
		return resourceProvisioningEntryId;
	}
	
	
	static Map<String, Object> readResource(Long resourceId) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from Resource where id = ?";

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
