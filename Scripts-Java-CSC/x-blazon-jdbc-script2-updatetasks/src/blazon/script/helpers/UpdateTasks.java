package blazon.script.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import blazon.script.domain.Task;

public class UpdateTasks {
	
	public static List<Task> findTaskByCreatedObjectId(Long id, String createdBy) {
		
		List<Task> tasks = new ArrayList<Task>();
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			String sql = " select id, status "
					+ " from Task "
					+ " where createdByObjectId = ? " 
					+ " and createdBy = ? ";
			
			statement = conn.prepareStatement(sql);
			statement.setLong(1, id);
			statement.setString(2, createdBy);

			rs = statement.executeQuery();
			
			while(rs.next()) {
				Task task = new Task();
				task = new Task();
				task.setId(rs.getLong("id"));
				task.setStatus(rs.getString("status"));
				tasks.add(task);
			}
			
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
		
		return tasks;
	}
	
	
	
	public static Task updateTask(Task task, Long actionId) {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();
			
			conn.setAutoCommit(false);

			String sql = " update Task "
					+ " set actionId = ? "
					+ " where id = ? "; 
			
			statement = conn.prepareStatement(sql);
			statement.setLong(1, actionId);
			statement.setLong(2, task.getId());

			statement.executeUpdate();
			
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
		
		return task;
	}
	

}
