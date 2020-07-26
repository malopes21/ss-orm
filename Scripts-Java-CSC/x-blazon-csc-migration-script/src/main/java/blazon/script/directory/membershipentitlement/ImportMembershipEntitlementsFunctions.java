package blazon.script.directory.membershipentitlement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import blazon.script.directory.common.ImportAdditionalFieldsFunctions;
import blazon.script.directory.common.ImportCreatedByFunctions;
import blazon.script.directory.common.ImportEntryFunctions;
import blazon.script.directory.common.ImportManagedByFunctions;
import blazon.script.util.ConnectionFactory;

class ImportMembershipEntitlementsFunctions {
	
	private final static Logger LOGGER = Logger.getLogger(ImportMembershipEntitlementsFunctions.class.getName());
	
	static List<Map<String, Object>> readSourceMembershipEntitlements(int limit) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select me.*, e.* \n"
				+ "from MembershipEntitlement me \n" + 
				"join Entry e on e.id = me.id \n" + 
				"join Entry ea on ea.id = me.account_id \n" + 
				"where e.state in ('ACTIVE') \n" + 
				"and ea.state in ('ACTIVE', 'INACTIVE') \n" + 
				"and _imported_ <> 1 \n" + 
				"order by me.id \n" + 
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
	

	public static void saveTargetMembershipEntitlements(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();
		
		for(Map<String, Object> row: rows) {
			
			try {
				
				Long createdById = ImportCreatedByFunctions.insertCreatedBy(targetConn, row);
				Long managedById = ImportManagedByFunctions.insertManagedByFull(targetConn, row);
				
				ImportEntryFunctions.saveEntry(targetConn, row, createdById, managedById);
				ImportAdditionalFieldsFunctions.insertAdditionalFields(targetConn, row);
				saveMembershipEntitlement(targetConn, row);
				
				setImportedMembershipEntitlement(sourceConn, row);
				
			} catch (Exception e) {
				
				LOGGER.log(Level.SEVERE, String.format("Erro ao importar membership entitlement com id %s", row.get("id")));
				throw e;
			}
		}
		
		targetConn.commit();
		sourceConn.commit();
		
		targetConn.close();
		sourceConn.close();
	}


	private static void saveMembershipEntitlement(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		
		String sql = "INSERT INTO MembershipEntitlement \n" + 
				"(id, \n" + 
				"account_id, \n" + 
				"entitlement_id) \n" + 
				"VALUES(?, ?, ?) ";
		
		statement = conn.prepareStatement(sql);
		
		statement.setLong(1, (Long) row.get("id"));
		statement.setLong(2, (Long) row.get("account_id"));
		statement.setLong(3, (Long) row.get("entitlement_id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}
	

	private static void setImportedMembershipEntitlement(Connection conn, Map<String, Object> row) throws Exception {
		
		PreparedStatement statement = null;
		
		String sql = "update MembershipEntitlement set _imported_ = 1 where id = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}

}
