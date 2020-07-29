package bom.blazon.migracao.tasks.enrichment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class SearchResource {

	public static Map<String, Object> read(Long resourceId, Connection conn) throws SQLException {
		
		String sql = "select id, name, description from Resource resource where id = ?;";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, resourceId);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			
			Map<String, Object> resource = new HashMap<String, Object>();
			
			resource.put("id", rs.getLong("id"));
			resource.put("name", rs.getString("name"));
			resource.put("description", rs.getString("description"));
			
			return resource;
			
		}
		
		return null;
		
	}
	
}
