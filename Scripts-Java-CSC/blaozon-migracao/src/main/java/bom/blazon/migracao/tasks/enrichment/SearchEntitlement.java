package bom.blazon.migracao.tasks.enrichment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class SearchEntitlement {

	public static Map<String, Object> read(Long entitlementId, Connection conn) throws SQLException {
		
		String sql = "select id, name, description from Entitlement entitlement where id = ?;";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, entitlementId);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			
			Map<String, Object> entitlement = new HashMap<String, Object>();
			
			entitlement.put("id", rs.getLong("id"));
			entitlement.put("name", rs.getString("name"));
			entitlement.put("description", rs.getString("description"));
			
			return entitlement;
			
		}
		
		return null;
		
	}
	
}
