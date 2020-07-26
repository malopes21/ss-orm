package blazon.script.tasks;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import blazon.script.helpers.ConnectionFactory;

public class CreateRequestApprovalTasks {
	
	public static void main(String[] args) {
		
		CreateRequestApprovalTasks.createApprovalTasks();
	}
	
	public static void createApprovalTasks() {
		
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			conn.setAutoCommit(false);
			
			for(int i=1; i<20; i++) {
				
				String sql = " insert into Task (id, category, createdBy, createdDate, status, recipient_id, userFrom, priority) " + 
						" values (?, ?, ?, ?, ?, ?, ?, ?) ";
				
				statement = conn.prepareStatement(sql);
				statement.setLong(1, i);
				statement.setString(2, "APPROVAL_TASK");
				statement.setString(3, "REQUEST");
				statement.setDate(4, new Date(new java.util.Date().getTime()));
				statement.setString(5, "TODO");
				statement.setLong(6, 1);
				statement.setLong(7, 3);
				statement.setString(8, "LOW");
				
				int n = statement.executeUpdate();
				
				sql = " insert into BlazonRequestApprovalTask (id, request_id) \n" + 
						"				values (?, ?) ";
				
				statement.close();
				
				statement = conn.prepareStatement(sql);
				statement.setLong(1, i);
				statement.setLong(2, 133);
				
				n = statement.executeUpdate();
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
