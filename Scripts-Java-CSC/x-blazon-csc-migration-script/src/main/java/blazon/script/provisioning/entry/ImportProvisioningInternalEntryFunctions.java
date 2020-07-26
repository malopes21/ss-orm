package blazon.script.provisioning.entry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

class ImportProvisioningInternalEntryFunctions {

	static Long insertInternalEntry(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("targetId") == null) {
			
			return null;
		}
		
		Map<String, Object> internalEntryData = readInternalEntry((Long) row.get("targetId"), (String) row.get("targetType"));
		
		if(internalEntryData.isEmpty()) {
			
			return null;
		}
		
		PreparedStatement statement = null;
		
		if(row.get("targetType").toString().equals("ACCOUNT")) {
		
			String sql = "insert into ProvisioningDirectoryEntry (type, accountIdentifier, directoryIdentifier) values (?, ?, ?) ";
			
			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "ACCOUNT");
			statement.setString(2, (String) internalEntryData.get("accountIdentifier"));
			statement.setLong(3, (Long) row.get("targetId"));
		
		} else if(row.get("targetType").toString().equals("MEMBERSHIP_ENTITLEMENT")) {
			
			String sql = "insert into ProvisioningDirectoryEntry (type, accountId, accountIdentifier, entitlementId, entitlementName, directoryIdentifier) "
					+ " values (?, ?, ?, ?, ?, ?) ";
			
			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "MEMBERSHIP_ENTITLEMENT");
			statement.setLong(2, (Long) internalEntryData.get("account_id"));
			statement.setString(3, (String) internalEntryData.get("accountIdentifier"));
			statement.setLong(4, (Long) internalEntryData.get("entitlement_id"));
			statement.setString(5, (String) internalEntryData.get("name"));
			statement.setLong(6, (Long) row.get("targetId"));
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
			sql = "select * from Account where id = ?";
		} else if(targetType.equals("MEMBERSHIP_ENTITLEMENT")) {
			sql = "select * \n" + 
					"from MembershipEntitlement me \n" + 
					"join Account ac on ac.id = me.account_id \n" + 
					"join Entitlement  ent on ent.id  = me.entitlement_id \n" + 
					"where me.id = ?";
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
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
		}
		
		conn.commit();
		conn.close();
		
		return row;
	}

}
