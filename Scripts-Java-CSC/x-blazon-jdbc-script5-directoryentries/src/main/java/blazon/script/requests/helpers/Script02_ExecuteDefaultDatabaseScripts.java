package blazon.script.requests.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Script02_ExecuteDefaultDatabaseScripts {
	
	//Executa os scripts SQL: "drop foreign keys", "drop columns", "add columns", "create tables"
	
	public static void execute() {
		
		dropForeignKeys();
		
		dropColumns();
		
		addColumns();
		
		createTables();
	}

	
	private static void dropForeignKeys() {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {
			
			String fullSql = " ALTER TABLE BlazonRequestTransitionState " + 
					"  DROP FOREIGN KEY FKdpfb02nx61vcbdbqkd8739rqv; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					"  DROP FOREIGN KEY FKjf6m674x51u9mwbxilfjoaubh; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					"  DROP FOREIGN KEY FKmahlggwuo8v5moybi6ajxpef ";

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			String[] sqls = fullSql.split(";");
			
			for(String sql: sqls) {
				
				statement = conn.prepareStatement(sql);
				
				statement.executeUpdate();
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

	
	private static void dropColumns() {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {
			
			String fullSql = " ALTER TABLE BlazonRequest " + 
					" DROP COLUMN accountId; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					" DROP COLUMN entitlementId; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					" DROP COLUMN roleId; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					" DROP COLUMN resourceId; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					" DROP COLUMN beneficiary_id; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					" DROP COLUMN requester_id; " +
					" " +
					" ALTER TABLE BlazonRequestTransitionState " + 
					" DROP COLUMN user_id ";

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			String[] sqls = fullSql.split(";");
			
			for(String sql: sqls) {
				
				statement = conn.prepareStatement(sql);
				
				statement.executeUpdate();
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
	

	private static void addColumns() {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {
			
			String fullSql = " ALTER TABLE BlazonRequest " + 
					" ADD COLUMN beneficiary_id bigint; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					" ADD COLUMN requester_id bigint; " + 
					" " + 
					" ALTER TABLE BlazonRequest " + 
					" ADD COLUMN requestInternalEntry_id bigint ";

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			String[] sqls = fullSql.split(";");
			
			for(String sql: sqls) {
				
				statement = conn.prepareStatement(sql);
				
				statement.executeUpdate();
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

	
	private static void createTables() {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {
			
			String fullSql = " CREATE TABLE BlazonRequestDirectoryEntry (\n" + 
						"  type varchar(31) NOT NULL,\n" + 
						"  id bigint(20) NOT NULL AUTO_INCREMENT,\n" + 
						"  directoryIdentifier bigint(20) DEFAULT NULL,\n" + 
						"  name varchar(255) DEFAULT NULL,\n" + 
						"  accountIdentifier varchar(255) DEFAULT NULL,\n" + 
						"  resourceId bigint(20) DEFAULT NULL,\n" + 
						"  resourceName varchar(255) DEFAULT NULL,\n" + 
						"  accountId bigint(20) DEFAULT NULL,\n" + 
						"  entitlementId bigint(20) DEFAULT NULL,\n" + 
						"  entitlementName varchar(255) DEFAULT NULL,\n" + 
						"  displayName varchar(255) DEFAULT NULL,\n" + 
						"  username varchar(255) DEFAULT NULL,\n" + 
						"  PRIMARY KEY (id)\n" + 
					") ENGINE=InnoDB ";

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			String[] sqls = fullSql.split(";");
			
			for(String sql: sqls) {
				
				statement = conn.prepareStatement(sql);
				
				statement.executeUpdate();
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

}
