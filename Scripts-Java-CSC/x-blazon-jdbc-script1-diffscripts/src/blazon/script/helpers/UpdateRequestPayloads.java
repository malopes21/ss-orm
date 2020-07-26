package blazon.script.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONObject;

public class UpdateRequestPayloads {

	public static void updateRequestPayloads() throws Exception {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);

			String sql = "select id, createdBy, createdByObjectId, status, payload from BlazonRequest\n" + 
					" where (status = 'WAITING_APPROVAL' or status = 'WAITING_DEPENDENCIES') and (type = 'ASSIGN_ENTITLEMENT' or type = 'CREATE_ACCOUNT') ";
			
			statement = conn.prepareStatement(sql);

			rs = statement.executeQuery();
			
			while(rs.next()) {
				
					
					long requestId = rs.getLong("id");
					
					String createdByType = rs.getString("createdBy");
					
					String createdByObjectId = rs.getString("createdByObjectId");
					
					String payload = rs.getString("payload");
					
					updatePayload(conn, requestId, createdByType, createdByObjectId, payload);
			}
			
			conn.commit();

		} catch (Exception e) {
			
			e.printStackTrace();

			try {
				
				if(conn != null && !conn.isClosed()) {
					conn.rollback();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}finally {
			
			try {

				if (rs != null) rs.close();
				if (statement != null) statement.close();
				if (conn != null) conn.close();

			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	}
	

	private static void updatePayload(Connection conn, long requestId, String createdByType, String createdByObjectId, String payload) throws SQLException {
		
		PreparedStatement statement = null;
		
		JSONObject object = new JSONObject(payload);
		
		object.put("managedByType", createdByType);
		
		if(createdByObjectId != null) {
		
			object.put("managedByObjectId", createdByObjectId);
		}
		
		String payload2 = object.toString(); 
		
		String sql = "update BlazonRequest set payload = ? where id = ?";
		
		statement = conn.prepareStatement(sql);
		
		statement.setString(1, payload2);
		
		statement.setLong(2, requestId);

		statement.executeUpdate();
	}
}
