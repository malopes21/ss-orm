package blazon.script.reconciliation.matchowner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

class ImportReconciliationMatchedInternalOwnerFunctions {

	static Long insertInternalEntry(Connection sourceConn, Connection targetConn, Map<String, Object> row) throws Exception {
		
		//ReconciliationEntry_id, matchedOwnersIds
		
		if(row.get("matchedOwnersIds") == null) {
			
			return null;
		}
		
		String schema = getEntrySchema(sourceConn, (Long) row.get("matchedOwnersIds"));
		
		if(schema == null) {
			
			return null;
		}
		
		Map<String, Object> internalEntryData = readInternalEntry(sourceConn, (Long) row.get("matchedOwnersIds"), schema);
		
		if(internalEntryData.isEmpty()) {
			
			return null;
		}
		
		PreparedStatement statement = null;
		
		if(schema.toString().equals("ACCOUNT")) {
		
			String sql = "insert into ReconciliationDirectoryEntry (type, accountIdentifier, directoryIdentifier) values (?, ?, ?) ";
			
			statement = targetConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "ACCOUNT");
			statement.setString(2, (String) internalEntryData.get("accountIdentifier"));
			statement.setLong(3, (Long) row.get("matchedOwnersIds"));
		
		} else if(schema.toString().equals("MEMBERSHIP_ENTITLEMENT")) {
			
			String sql = "insert into ReconciliationDirectoryEntry (type, accountId, accountIdentifier, entitlementId, entitlementName, directoryIdentifier) "
					+ " values (?, ?, ?, ?, ?, ?) ";
			
			statement = targetConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "MEMBERSHIP_ENTITLEMENT");
			statement.setLong(2, (Long) internalEntryData.get("account_id"));
			statement.setString(3, (String) internalEntryData.get("accountIdentifier"));
			statement.setLong(4, (Long) internalEntryData.get("entitlement_id"));
			statement.setString(5, (String) internalEntryData.get("name"));
			statement.setLong(6, (Long) row.get("matchedOwnersIds"));
			
		} else if(schema.toString().equals("ENTITLEMENT")) {
			
			String sql = "insert into ReconciliationDirectoryEntry (type, name, directoryIdentifier) values (?, ?, ?) ";
			
			statement = targetConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "ENTITLEMENT");
			statement.setString(2, (String) internalEntryData.get("name"));
			statement.setLong(3, (Long) row.get("matchedOwnersIds"));
			
		} else if(schema.toString().equals("USER")) {
			
			String sql = "insert into ReconciliationDirectoryEntry (type, username, displayName, directoryIdentifier) values (?, ?, ?, ?) ";
			
			statement = targetConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "USER");
			statement.setString(2, (String) internalEntryData.get("username"));
			statement.setString(3, (String) internalEntryData.get("displayName"));
			statement.setLong(4, (Long) row.get("matchedOwnersIds"));
			
		} else if(schema.toString().equals("MEMBERSHIP_ROLE")) {
			
			String sql = "insert into ReconciliationDirectoryEntry (type, userId, username, displayName, roleId, roleName, directoryIdentifier) "
					+ " values (?, ?, ?, ?, ?, ?, ?) ";
			
			statement = targetConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "MEMBERSHIP_ROLE");
			statement.setLong(2, (Long) internalEntryData.get("user_id"));
			statement.setString(3, (String) internalEntryData.get("username"));
			statement.setString(4, (String) internalEntryData.get("displayName"));
			statement.setLong(5, (Long) internalEntryData.get("role_id"));
			statement.setString(6, (String) internalEntryData.get("name"));
			statement.setLong(7, (Long) row.get("matchedOwnersIds"));
			
		} else if(schema.toString().equals("ROLE")) {
			
			String sql = "insert into ReconciliationDirectoryEntry (type, name, directoryIdentifier) values (?, ?, ?) ";
			
			statement = targetConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "ROLE");
			statement.setString(2, (String) internalEntryData.get("name"));
			statement.setLong(3, (Long) row.get("matchedOwnersIds"));
			
		}
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
		
		Long internalProvisioningEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	internalProvisioningEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating instance failed, no ID obtained.");
		    }
		}
		
		return internalProvisioningEntryId;
	}
	
	
	private static String getEntrySchema(Connection sourceConn, Long entryId) throws SQLException {

		String sql = "select type from Entry where id = ?";
		
		PreparedStatement statement = sourceConn.prepareStatement(sql);
		statement.setLong(1, entryId);
		
		ResultSet rs = statement.executeQuery();
		
		if(rs.next()) {
			
			return rs.getString("type");
		}
		
		return null;
	}


	static Map<String, Object> readInternalEntry(Connection conn, Long reconciliationMatchedEntryId, String schemaa) throws Exception {
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = null;
		if(schemaa.equals("ACCOUNT")) {
			
			sql = "select * from Account where id = ?";
			
		} else if(schemaa.equals("MEMBERSHIP_ENTITLEMENT")) {
			
			sql = "select * \n" + 
					"from MembershipEntitlement me \n" + 
					"join Account ac on ac.id = me.account_id \n" + 
					"join Entitlement  ent on ent.id  = me.entitlement_id \n" + 
					"where me.id = ?";
			
		} else if(schemaa.equals("USER")) {
			
			sql = "select * from User where id = ?";
			
		} else if(schemaa.equals("ENTITLEMENT")) {
			
			sql = "select * from Entitlement where id = ?";
			
		} else if(schemaa.equals("MEMBERSHIP_ROLE")) {
			
			sql = "select * \n" + 
					"from MembershipRole mr \n" + 
					"join User u on u.id = mr.user_id \n" + 
					"join Role r on r.id  = mr.role_id \n" + 
					"where mr.id = ?";
		} else {
			
			sql = "select * from Role where id = ?";
		}
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, reconciliationMatchedEntryId);
		
		rs = statement.executeQuery();
		
		Map<String, Object> row = new HashMap<>();
		
		if(rs.next()) {
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
		}
		
		return row;
	}

}
