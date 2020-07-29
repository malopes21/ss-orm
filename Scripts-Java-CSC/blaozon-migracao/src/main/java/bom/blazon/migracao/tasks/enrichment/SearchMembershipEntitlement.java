package bom.blazon.migracao.tasks.enrichment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class SearchMembershipEntitlement {

	public static Map<String, Object> read(Long accountId, Connection conn) throws SQLException {
		
		String sql = "select id, account_id, entitlement_id from MembershipEntitlement membershipEntitlement where id = ?;";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, accountId);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			
			Map<String, Object> account = new HashMap<String, Object>();
			
			account.put("id", rs.getLong("id"));
			account.put("account_id", rs.getLong("account_id"));
			account.put("entitlement_id", rs.getLong("entitlement_id"));
			
			return account;
			
		}
		
		return null;
		
	}
	
}
