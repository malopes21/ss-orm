package blazon.script.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import blazon.script.domain.BlazonRequest;
import blazon.script.domain.Task;

public class UpdateApprovalTasks {
	

	public static List<BlazonRequest> findRequestsInWatingApproval() throws Exception {
		
		List<BlazonRequest> requests = new ArrayList<BlazonRequest>();
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);

			String sql = " select id, status "
					+ " from BlazonRequest "
					+ " where status = 'WAITING_APPROVAL' ";
			
			statement = conn.prepareStatement(sql);

			rs = statement.executeQuery();
			
			while(rs.next()) {
				
				BlazonRequest request = new BlazonRequest();
				request.setId(rs.getLong("id"));
				request.setStatus(rs.getString("status"));
				requests.add(request);
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
		
		return requests;
	}


	public static void updateApprovalTasks() throws Exception {

		List<BlazonRequest> requests = findRequestsInWatingApproval();
		
		for(BlazonRequest request: requests) {
			
			List<Task> tasks = UpdateTasks.findTaskByCreatedObjectId(request.getId(), "REQUEST");
			
			if(tasks.size() == 1) {
				
				//CreateRequestApprovalTasks.updateTask(task, 1L);
				
			} else if(tasks.size() == 2) {
				
				//CreateRequestApprovalTasks.updateTask(task, ?);
			}
		}
	}


}
