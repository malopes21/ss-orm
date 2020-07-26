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
import java.util.logging.Logger;

import blazon.script.util.ConnectionFactory;

public class ImportResourceCategoriesService {
	
	private final static Logger LOGGER = Logger.getLogger(ImportResourceCategoriesService.class.getName());
	
	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}
	

	public static void execute() throws Exception {
		
		createImportValidationField();

		List<Map<String, Object>> rows = readSourceResourceCategories();
		saveTargetResourceCategories(rows);
		
	}
	
	
	static void createImportValidationField() throws Exception {
		
		try {

			Connection conn = ConnectionFactory.getSourceConnection();
			PreparedStatement statement = null;
			
			String sql = "alter table ResourceCategory add column _imported_ int default 0";
	
			conn = ConnectionFactory.getSourceConnection();
	
			conn.setAutoCommit(false);
			
			statement = conn.prepareStatement(sql);
			
			statement.executeUpdate();
			
			conn.commit();
			
			LOGGER.info("Campo de validação criado ...");
			
		} catch (Exception e) {
			
			LOGGER.info("Campo de validação provavelmente já criado!");
		}
	}
	
	
	static List<Map<String, Object>> readSourceResourceCategories() throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from ResourceCategory rc where _imported_ <> 1 limit 100000 offset 1 \n" ;

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
	

	static void saveTargetResourceCategories(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();
		
		for(Map<String, Object> row: rows) {
			
			saveCategory(targetConn, row);
			
			setImportedCategory(sourceConn, row);
		}
		
		targetConn.commit();
		sourceConn.commit();
		
		targetConn.close();
		sourceConn.close();
	}

	
	private static void saveCategory(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		
		String sql = "INSERT INTO ResourceCategory \n" + 
				"(id, \n" + 
				"description, \n" + 
				"name) \n" + 
				"VALUES(?, ?, ?)";
		
		statement = conn.prepareStatement(sql);
		
		statement.setLong(1, (Long) row.get("id"));
		statement.setString(2, (String) row.get("description"));
		statement.setString(3, (String) row.get("name"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

	
	private static void setImportedCategory(Connection conn, Map<String, Object> row) throws Exception {
		
		PreparedStatement statement = null;
		
		String sql = "update ResourceCategory set _imported_ = 1 where id = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}
}
