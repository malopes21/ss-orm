package blazon.script.tasks;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import blazon.script.helpers.ConnectionFactory;

public class CreateCertificationApprovalTasks {
	
	
	public static void main(String[] args) {
		
		CreateCertificationApprovalTasks.createApprovalTasks();
	}
	
	public static void createApprovalTasks() {
		
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			conn.setAutoCommit(false);
			
			List<Long> users = new ArrayList<Long>();
			users.add(1L); users.add(3L); users.add(4L); users.add(7L); users.add(11L);
			
			
			for(int i=2000; i<4000; i++) {
				
				int certificationId = (int) Math.round(Math.random() * 5);
				
				if(certificationId == 0) {
					certificationId = 5;
				}
				
				long recipientId = users.get(certificationId-1);
				
				certificationId = (int) Math.round(Math.random() * 5);
				
				if(certificationId == 0) {
					certificationId = 5;
				}
				
				long userFrom = users.get(certificationId-1);
				
				String sql = " insert into Task (id, category, createdBy, createdDate, status, recipient_id, userFrom, priority) " + 
						" values (?, ?, ?, ?, ?, ?, ?, ?) ";
				
				statement = conn.prepareStatement(sql);
				statement.setLong(1, i);
				statement.setString(2, "CERTIFICATION_TASK");
				statement.setString(3, "CERTIFICATION");
				statement.setTimestamp(4, new Timestamp(new java.util.Date().getTime()));
				statement.setString(5, "TODO");
				statement.setLong(6, recipientId);
				statement.setLong(7, userFrom);
				statement.setString(8, "LOW");
				
				int n = statement.executeUpdate();
				
				sql = " insert into CertificationApprovalTask (id, certificationEntry_id) \n" + 
						"				values (?, ?) ";
				
				statement.close();
				
				statement = conn.prepareStatement(sql);
				statement.setLong(1, i);
				statement.setLong(2, certificationId);
				
				n = statement.executeUpdate();
				
				Thread.sleep(2);
			}
			
			conn.commit();
			
			System.out.println("OK");
			
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

				if (statement != null) statement.close();
				if (conn != null) conn.close();

			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	}
	
}
