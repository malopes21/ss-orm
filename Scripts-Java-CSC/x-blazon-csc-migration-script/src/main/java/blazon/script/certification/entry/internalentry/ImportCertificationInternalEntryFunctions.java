package blazon.script.certification.entry.internalentry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

public class ImportCertificationInternalEntryFunctions {

	public static Long insertInternalEntry(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("entryId") == null) {
			
			return null;
		}
		
		Map<String, Object> internalEntryData = readInternalEntry((Long) row.get("entryId"), (String) row.get("entryType"));
		
		if(internalEntryData.isEmpty()) {
			
			return null;
		}
		
		PreparedStatement statement = null;
		
		if(row.get("entryType").toString().equals("ACCOUNT")) {
			
			String sql = "insert into CertificationDirectoryEntry (type, accountIdentifier, userId, username, displayName, resourceId, resourceName, directoryIdentifier) " +
							" values (?, ?, ?, ?, ?, ?, ?, ?) ";
			
			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "ACCOUNT");
			statement.setString(2, (String) internalEntryData.get("accountIdentifier"));
			statement.setLong(3, (Long) internalEntryData.get("user_id"));
			statement.setString(4, (String) internalEntryData.get("username"));
			statement.setString(5, (String) internalEntryData.get("displayName"));
			statement.setLong(6, (Long) internalEntryData.get("resource_id"));
			statement.setString(7, (String) internalEntryData.get("resource_name"));
			statement.setLong(8, (Long) internalEntryData.get("account_id"));
		
		} else if(row.get("entryType").toString().equals("MEMBERSHIP_ENTITLEMENT")) {
			
			String sql = "insert into CertificationDirectoryEntry (type, accountId, accountIdentifier, userId, username, displayName, resourceId, resourceName, " +
					" entitlementId, entitlementName, directoryIdentifier) " + 
					" values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)  ";
			
			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "MEMBERSHIP_ENTITLEMENT");
			statement.setLong(2, (Long) internalEntryData.get("account_id"));
			statement.setString(3, (String) internalEntryData.get("accountIdentifier"));
			statement.setLong(4, (Long) internalEntryData.get("user_id"));
			statement.setString(5, (String) internalEntryData.get("username"));
			statement.setString(6, (String) internalEntryData.get("displayName"));
			statement.setLong(7, (Long) internalEntryData.get("resource_id"));
			statement.setString(8, (String) internalEntryData.get("resource_name"));
			statement.setLong(9, (Long) internalEntryData.get("entitlement_id"));
			statement.setString(10, (String) internalEntryData.get("entitlement_name"));
			statement.setLong(11, (Long) internalEntryData.get("membership_id"));
			
		} else if(row.get("entryType").toString().equals("MEMBERSHIP_ROLE")) {
			
			String sql = "insert into CertificationDirectoryEntry (type, userId, username, displayName, roleId, roleName, directoryIdentifier) " +
					" values (?, ?, ?, ?, ?, ?, ?) ";
	
			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "MEMBERSHIP_ROLE");
			statement.setLong(2, (Long) internalEntryData.get("user_id"));
			statement.setString(3, (String) internalEntryData.get("username"));
			statement.setString(4, (String) internalEntryData.get("displayName"));
			statement.setLong(5, (Long) internalEntryData.get("role_id"));
			statement.setString(6, (String) internalEntryData.get("role_name"));
			statement.setLong(7, (Long) internalEntryData.get("membership_id"));
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
	
	
	static Map<String, Object> readInternalEntry(Long targetId, String targetType) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = null;
		if(targetType.equals("ACCOUNT")) {
			
			sql = "select \n" + 
					"	ac.id as account_id,\n" + 
					"	ac.accountIdentifier as accountIdentifier, \n" + 
					"	re.id as resource_id, \n" + 
					"	re.name  as resource_name, \n" + 
					"	u.id as user_id, \n" + 
					"	u.username as username, \n" + 
					"	u.displayName as displayName \n" + 
					"from Account ac \n" + 
					"join User u on u.id = ac.user_id \n" + 
					"join Resource re on re.id = ac.resource_id \n" + 
					"where ac.id = ? ";
			
		} else if(targetType.equals("MEMBERSHIP_ENTITLEMENT")) {
			
			sql = "select \n" + 
					"	me.id as membership_id, \n" + 
					"	ac.id as account_id, \n" + 
					"	ac.accountIdentifier as accountIdentifier, \n" + 
					"	re.id as resource_id, \n" + 
					"	re.name  as resource_name, \n" + 
					"	ent.id as entitlement_id, \n" + 
					"	ent.name as entitlement_name, \n" + 
					"	u.id as user_id, \n" + 
					"	u.username as username, \n" + 
					"	u.displayName as displayName \n" + 
					"from MembershipEntitlement me \n" + 
					"join Account ac on ac.id = me.account_id \n" + 
					"join User u on u.id = ac.user_id \n" + 
					"join Entitlement  ent on ent.id  = me.entitlement_id \n" + 
					"join Resource re on re.id = ent.resource_id \n" + 
					"where me.id = ? ";
			
		} else if(targetType.equals("MEMBERSHIP_ROLE")) {
			
			sql = "select \n" + 
					"	mr.id as membership_id, \n" + 
					"	r.id as role_id, \n" + 
					"	r.name as role_name, \n" + 
					"	u.id as user_id, \n" + 
					"	u.username as username, \n" + 
					"	u.displayName as displayName \n" + 
					"from MembershipRole mr \n" + 
					"join User u on u.id = mr.user_id \n" + 
					"join Role r on r.id  = mr.role_id \n" + 
					"where mr.id = ? ";
			
		} else {
			
			throw new RuntimeException("Unknow target type!");
		}
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, targetId);
		
		rs = statement.executeQuery();
		
		Map<String, Object> row = new HashMap<>();
		
		if(rs.next()) {
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnLabel(i), rs.getObject(i));
			}
		}
		
		conn.commit();
		conn.close();
		
		return row;
	}

}
