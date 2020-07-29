package blazon.script.directory.user;

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

import blazon.script.directory.common.ImportAdditionalFieldsFunctions;
import blazon.script.directory.common.ImportCreatedByFunctions;
import blazon.script.directory.common.ImportEntryFunctions;
import blazon.script.directory.common.ImportManagedByFunctions;
import blazon.script.util.ConnectionFactory;

class ImportUsersFunctions {
	
	private final static Logger LOGGER = Logger.getLogger(ImportUsersService.class.getName());
	
	static List<Map<String, Object>> read(int limit, int offset) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from User u \n" + 
				"join Entry e on e.id = u.id \n" + 
				"where e.state in ('ACTIVE', 'INACTIVE') \n" + 
				"order by u.id \n" + 
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
			
			Long createdById = ImportCreatedByFunctions.insertCreatedBy(targetConn, row);
			Long managedById = ImportManagedByFunctions.insertManagedByFull(targetConn, row);
			
			ImportEntryFunctions.saveEntry(targetConn, row, createdById, managedById);
			ImportAdditionalFieldsFunctions.insertAdditionalFields(targetConn, row);
			saveUser(targetConn, row);
		}
		
		targetConn.commit();
		sourceConn.commit();
		
		targetConn.close();
		sourceConn.close();
	}


	private static void saveUser(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		
		String sql = "INSERT INTO User \n" + 
				"(id, \n" + 
				"birthDate, \n" + 
				"displayName, \n" + 
				"email, \n" + 
				"firstName, \n" + 
				"lastAccess, \n" + 
				"lastAssignmentExecutionDate, \n" + 
				"lastName, \n" + 
				"lastPasswordModificationDate, \n" + 
				"locked, \n" + 
				"middleName, \n" + 
				"mobilePhone, \n" + 
				"needChangePassword, \n" + 
				"password, \n" + 
				"personalEmail, \n" + 
				"photoImageId, \n" + 
				"primaryPhone, \n" + 
				"thumbImageId, \n" + 
				"username, \n" + 
				"lastRoleRightsVerifierExecutionDate, \n" + 
				"lastInactivatedAccountsVerifierExecutionDate) \n" + 
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		statement = conn.prepareStatement(sql);
		
		statement.setLong(1, (Long) row.get("id"));
		statement.setDate(2, (java.sql.Date) row.get("birthDate"));
		statement.setString(3, (String) row.get("displayName"));
		statement.setString(4, (String) row.get("email"));
		statement.setString(5, (String) row.get("firstName"));
		statement.setTimestamp(6, (java.sql.Timestamp) row.get("lastAccess"));
		statement.setTimestamp(7, (java.sql.Timestamp) row.get("lastAssignmentExecutionDate"));
		statement.setString(8, (String) row.get("lastName"));
		statement.setTimestamp(9, (java.sql.Timestamp) row.get("lastPasswordModificationDate"));
		statement.setBoolean(10, (Boolean) row.get("locked"));
		statement.setString(11, (String) row.get("middleName"));
		statement.setString(12, (String) row.get("mobilePhone"));
		statement.setBoolean(13, (Boolean) row.get("needChangePassword"));
		statement.setString(14, (String) row.get("password"));
		statement.setString(15, (String) row.get("personalEmail"));
		statement.setString(16, (String) row.get("photoImageId"));
		statement.setString(17, (String) row.get("primaryPhone"));
		statement.setString(18, (String) row.get("thumbImageId"));
		statement.setString(19, (String) row.get("username"));
		statement.setTimestamp(20, (java.sql.Timestamp) row.get("lastRoleRightsVerifierExecutionDate"));
		statement.setTimestamp(21, (java.sql.Timestamp) row.get("lastInactivatedAccountsVerifierExecutionDate"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		LOGGER.log(Level.INFO, "Enviando comando SQL para importar user com id " + row.get("id"));
	}

}
