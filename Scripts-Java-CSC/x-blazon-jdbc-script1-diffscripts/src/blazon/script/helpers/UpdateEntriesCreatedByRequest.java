package blazon.script.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateEntriesCreatedByRequest {

	public static void updateEntriesCreatedByRequest() throws Exception {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);

			String sql = "select " + 
					" entry.id, " + 
					" entry.managedBy_id, " +
					" request.createdBy, " + 
					" request.createdByObjectId " + 
					" from Entry entry " + 
					" inner join CreatedBy createdBy on entry.createdBy_id = createdBy.id " + 
					" inner join BlazonRequest request on createdBy.objectId = request.id " + 
					" where createdBy.type = 'REQUEST' ";
			
			statement = conn.prepareStatement(sql);

			rs = statement.executeQuery();
			
			while(rs.next()) {
				
				if(rs.getObject("managedBy_id") == null) {
					
					long entryId = rs.getLong("id");
					
					String createdByType = rs.getString("createdBy");
					
					String createdByObjectId = rs.getString("createdByObjectId");
					
					long managedById = insertManagedBy(conn, createdByType, createdByObjectId);
					
					updateEntry(conn, entryId, managedById);
				}
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
	

	private static long insertManagedBy(Connection conn, String createdByType, String createdByObjectId) throws SQLException {
		
		long key = -1;

		PreparedStatement statement = null;
		
		ResultSet rs = null;

		String sql = "insert into ManagedBy (type) values (?)";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		
		statement.setString(1, createdByType);

		statement.executeUpdate();
		
		rs = statement.getGeneratedKeys();

		if (rs.next()) {
		    key = rs.getLong(1);
		}
		
		if(createdByObjectId != null && key != -1) {
			
			sql = "insert into ManagedBy_objectIds (ManagedBy_id, objectIds) values (?, ?);";
			
			statement = conn.prepareStatement(sql);
			
			statement.setLong(1, key);
			
			statement.setLong(2, Long.parseLong(createdByObjectId));

			statement.executeUpdate();
		}
		
		return key;
	}
	

	private static void updateEntry(Connection conn, long entryId, long managedById) throws SQLException {
		
		PreparedStatement statement = null;
		
		String sql = "update Entry set managedBy_id = ? where id = ?";
		
		statement = conn.prepareStatement(sql);
		
		statement.setLong(1, managedById);
		
		statement.setLong(2, entryId);

		statement.executeUpdate();
	}
}
