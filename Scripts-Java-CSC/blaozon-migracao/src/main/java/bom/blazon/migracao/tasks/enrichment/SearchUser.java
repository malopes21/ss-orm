package bom.blazon.migracao.tasks.enrichment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class SearchUser {

	public static Map<String, Object> read(Integer roleId, Connection conn) throws SQLException {
		
		String sql = "select id, displayName, username from User user where id = ?;";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, roleId);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			
			Map<String, Object> user = new HashMap<String, Object>();
			
			user.put("id", rs.getLong("id"));
			user.put("displayName", rs.getString("displayName"));
			user.put("username", rs.getString("username"));
			
			return user;
			
		}
		
		return null;
		
	}
	
}
