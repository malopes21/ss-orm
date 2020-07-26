package blazon.script.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import blazon.script.domain.CertificationEntry;
import blazon.script.domain.Task;

public class UpdateCertificationTasks {
	

	public static List<CertificationEntry> findCertificationEntriesInWatingApproval() throws Exception {
		
		List<CertificationEntry> requests = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);

			String sql = " select id, status "
					+ " from CertificationEntry "
					+ " where status = 'WAITING_APPROVAL' ";
			
			statement = conn.prepareStatement(sql);

			rs = statement.executeQuery();
			
			while(rs.next()) {
				
				CertificationEntry request = new CertificationEntry();
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

	
	public static void updateCertificationTasks() throws Exception {

		List<CertificationEntry> requests = findCertificationEntriesInWatingApproval();
		
		for(CertificationEntry request: requests) {
			
			List<Task> tasks = UpdateTasks.findTaskByCreatedObjectId(request.getId(), "CERTIFICATION");
			
			if(tasks.size() == 1) {
				
				//CreateRequestApprovalTasks.updateTask(task, 1L);
				
			} else if(tasks.size() == 2) {
				
				//CreateRequestApprovalTasks.updateTask(task, ?);
			}
		}
	}


}
