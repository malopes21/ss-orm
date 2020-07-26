package blazon.script.directory.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

public class ImportCreatedByFunctions {

	public static Long insertCreatedBy(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("createdBy_id") == null) {
			
			return null;
		}
		
		Map<String, Object> createdByData = readCreatedBy((Long) row.get("createdBy_id"));
		
		PreparedStatement statement = null;
		
		String sql = "insert into CreatedBy (objectId, type) values (?, ?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setLong(1, (Long) createdByData.get("objectId"));
		statement.setString(2, (String) createdByData.get("type"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
		
		Long createdById = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	createdById = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating instance failed, no ID obtained.");
		    }
		}
		
		return createdById;
	}
	
	
	static Map<String, Object> readCreatedBy(Long createdById) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from CreatedBy where id = ?";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, createdById);
		
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
