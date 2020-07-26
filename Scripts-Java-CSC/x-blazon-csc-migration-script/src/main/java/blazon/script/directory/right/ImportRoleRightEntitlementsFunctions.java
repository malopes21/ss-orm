package blazon.script.directory.right;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

public class ImportRoleRightEntitlementsFunctions {

	public static void insertRightEntitlements(Connection targetConn, Map<String, Object> row) throws Exception {

		List<Map<String, Object>> rightEntitlements = readRightEntitlements((Long) row.get("id"));
		
		insertRightEntitlements(targetConn, (Long) row.get("id"), rightEntitlements);
	}

	
	private static List<Map<String, Object>> readRightEntitlements(Long right_id) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from Rightt_Entitlement where Right_id = ?";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, right_id);
		
		rs = statement.executeQuery();
		
		List<Map<String, Object>> rows = new ArrayList<>();
		
		while(rs.next()) {
			
			Map<String, Object> row = new HashMap<>();
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
			
			rows.add(row);
		}
		
		conn.commit();
		conn.close();
		
		return rows;
	}


	private static void insertRightEntitlements(Connection conn, Long right_id, List<Map<String, Object>> rows) throws SQLException {
		
		for(Map<String, Object> row: rows) {
			
			PreparedStatement statement = null;
			
			String sql = "insert into Rightt_Entitlement (Right_id, entitlements_id) values (?, ?) ";
			
			statement = conn.prepareStatement(sql);
			statement.setLong(1, right_id);
			statement.setLong(2, (Long) row.get("entitlements_id"));
			
			int affectedRows = statement.executeUpdate();

			if (affectedRows == 0) {
			    throw new RuntimeException("Creating instance failed, no rows affected.");
			}
		}
	}
}
