package bom.blazon.migracao.tasks.enrichment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class SearchAccount {

	public static Map<String, Object> read(Long accountId, Connection conn) throws SQLException {
		
		String sql = "select id, accountIdentifier from Account account where id = ?;";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, accountId);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			
			Map<String, Object> account = new HashMap<String, Object>();
			
			account.put("id", rs.getLong("id"));
			account.put("accountIdentifier", rs.getString("accountIdentifier"));
			
			return account;
			
		}
		
		return null;
		
	}
	
}
