package blazon.script.directory.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

public class ImportManagedByFunctions {

	public static Long insertManagedByFull(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("managedBy_id") == null) {
			
			return null;
		}
		
		Map<String, Object> managedByData = readManagedBy((Long) row.get("managedBy_id"));
		
		Long managedById = insertManagedBy(conn, managedByData);
		
		List<Map<String, Object>> managedByObjectIdsData = readManagedByObjectIds((Long) row.get("managedBy_id"));
		
		insertManagedByObjectIds(conn, managedById, managedByObjectIdsData);
		
		return managedById;
	}
	

	static Map<String, Object> readManagedBy(Long createdById) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from ManagedBy where id = ?";

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
	
	
	private static Long insertManagedBy(Connection conn, Map<String, Object> managedByData) throws SQLException {
		
		PreparedStatement statement = null;
		
		String sql = "insert into ManagedBy (type) values (?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setString(1, (String) managedByData.get("type"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
		
		Long managedById = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	managedById = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating instance failed, no ID obtained.");
		    }
		}
		
		return managedById;
	}
	
	
	private static List<Map<String, Object>> readManagedByObjectIds(Long managedBy_id) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from ManagedBy_objectIds where ManagedBy_id = ?";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, managedBy_id);
		
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


	private static void insertManagedByObjectIds(Connection conn, Long managedById, List<Map<String, Object>> rows) throws SQLException {
		
		for(Map<String, Object> row: rows) {
			
			PreparedStatement statement = null;
			
			String sql = "insert into ManagedBy_objectIds (ManagedBy_id, objectIds) values (?, ?) ";
			
			statement = conn.prepareStatement(sql);
			statement.setLong(1, managedById);
			statement.setLong(2, (Long) row.get("objectIds"));
			
			int affectedRows = statement.executeUpdate();

			if (affectedRows == 0) {
			    throw new RuntimeException("Creating instance failed, no rows affected.");
			}
		}
	}

}
