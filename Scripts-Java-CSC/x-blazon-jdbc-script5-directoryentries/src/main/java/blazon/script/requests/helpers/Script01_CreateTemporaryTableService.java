package blazon.script.requests.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Script01_CreateTemporaryTableService {
	
	//Criar tabela BlazonRequestTemp e copiar os atributos accountId, entitlementId, roleId, resourceId, beneficiary_id, requester_id, membershipId;
	
	public static void execute() {
		
		createTable();
		copyTemporaryData();
	}

	
	private static void createTable() {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {
			
			String sql = " create table BlazonRequestTemp ( " + 
					"   request_id bigint, " +
					"	accountId bigint, " + 
					"	entitlementId bigint, " + 
					"	membershipId bigint, " + 
					"	roleId bigint, " + 
					"	resourceId bigint, " + 
					"	beneficiary_id bigint, " + 
					"	requester_id bigint, " + 
					"	requestType varchar(255) " + 
					") ";

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			statement = conn.prepareStatement(sql);
			
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
	}
	
	
	private static void copyTemporaryData() {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "insert into BlazonRequestTemp (request_id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id, requestType) " + 
					" select id, accountId, entitlementId, membershipId, roleId, resourceId, beneficiary_id, requester_id, type " + 
					" from BlazonRequest ";
			
			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			statement = conn.prepareStatement(sql);
			
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
	}

}
