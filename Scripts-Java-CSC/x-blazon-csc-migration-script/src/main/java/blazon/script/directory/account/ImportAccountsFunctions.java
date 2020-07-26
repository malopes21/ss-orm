package blazon.script.directory.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import blazon.script.directory.common.ImportAdditionalFieldsFunctions;
import blazon.script.directory.common.ImportCreatedByFunctions;
import blazon.script.directory.common.ImportEntryFunctions;
import blazon.script.directory.common.ImportManagedByFunctions;
import blazon.script.util.ConnectionFactory;

class ImportAccountsFunctions {
	
	static List<Map<String, Object>> readSourceAccounts(int limit) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from Account ac \n" + 
				"join Entry e on e.id = ac.id \n" + 
				"where e.state in ('ACTIVE', 'INACTIVE') \n" + 
				"and _imported_ <> 1 \n" + 
				"order by ac.id \n" + 
				"limit %s ";

		sql = String.format(sql, limit);
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
	

	public static void saveTargetAccounts(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();
		
		for(Map<String, Object> row: rows) {
			
			Long createdById = ImportCreatedByFunctions.insertCreatedBy(targetConn, row);
			Long managedById = ImportManagedByFunctions.insertManagedByFull(targetConn, row);
			
			ImportEntryFunctions.saveEntry(targetConn, row, createdById, managedById);
			ImportAdditionalFieldsFunctions.insertAdditionalFields(targetConn, row);
			saveAccount(targetConn, row);
			
			setImportedAccount(sourceConn, row);
		}
		
		targetConn.commit();
		sourceConn.commit();
		
		targetConn.close();
		sourceConn.close();
	}


	private static void saveAccount(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		
		String sql = "INSERT INTO Account \n" + 
				"(id, \n" + 
				"accountIdentifier, \n" + 
				"description, \n" + 
				"lastPasswordModificationDate, \n" + 
				"name, \n" + 
				"resource_id, \n" + 
				"user_id) \n" + 
				"VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		statement = conn.prepareStatement(sql);
		
		statement.setLong(1, (Long) row.get("id"));
		statement.setString(2, (String) row.get("accountIdentifier"));
		statement.setString(3, (String) row.get("description"));
		if(row.get("lastPasswordModificationDate") != null) statement.setTimestamp(4, (java.sql.Timestamp) row.get("lastPasswordModificationDate") ); statement.setObject(4, null);
		statement.setString(5, (String) row.get("name"));
		statement.setLong(6, (Long) row.get("resource_id"));
		statement.setLong(7, (Long) row.get("user_id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}
	

	private static void setImportedAccount(Connection conn, Map<String, Object> row) throws Exception {
		
		PreparedStatement statement = null;
		
		String sql = "update Account set _imported_ = 1 where id = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}

}
