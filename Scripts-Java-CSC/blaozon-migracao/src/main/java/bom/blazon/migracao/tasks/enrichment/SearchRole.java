package bom.blazon.migracao.tasks.enrichment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class SearchRole {

	public static Map<String, Object> read(Long roleId, Connection conn) throws SQLException {
		
		String sql = "select id, name, description from Role role where id = ?;";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, roleId);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			
			Map<String, Object> role = new HashMap<String, Object>();
			
			role.put("id", rs.getLong("id"));
			role.put("name", rs.getString("name"));
			role.put("description", rs.getString("description"));
			
			return role;
			
		}
		
		return null;
		
	}
	
}
