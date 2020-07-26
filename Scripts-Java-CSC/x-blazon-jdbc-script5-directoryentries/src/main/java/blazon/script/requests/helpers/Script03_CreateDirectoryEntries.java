package blazon.script.requests.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import blazon.script.requests.domain.BlazonRequestTemp;

public class Script03_CreateDirectoryEntries {
	
	//Ler a tabela BlazonRequestTemp e para cada linhas criar os registros de BlazonRequestDirectoryEntry e atualizar a tabela de BlazonRequest com os ids gerados
	
	public static void execute() {
		
		List<BlazonRequestTemp> requests = readTemporaryRequestData();
		
		createDirectoryEntries(requests);
	}
	

	private static List<BlazonRequestTemp> readTemporaryRequestData() {
		
		List<BlazonRequestTemp> requestDatas = new ArrayList<BlazonRequestTemp>();
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {
			
			String sql = " select * from BlazonRequestTemp ";

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			statement = conn.prepareStatement(sql);
			
			rs = statement.executeQuery();
			
			while(rs.next()) {
				
				BlazonRequestTemp request = new BlazonRequestTemp();
				
				request.setAccountId(rs.getLong("accountId"));
				request.setBeneficiary_id(rs.getLong("beneficiary_id"));
				request.setEntitlementId(rs.getLong("entitlementId"));
				request.setMembershipId(rs.getLong("membershipId"));
				request.setRequest_id(rs.getLong("request_id"));
				request.setRequester_id(rs.getLong("requester_id"));
				request.setResourceId(rs.getLong("resourceId"));
				request.setRoleId(rs.getLong("roleId"));
				request.setRequestType(rs.getString("requestType"));
				
				requestDatas.add(request);
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
		
		return requestDatas;
	}
	
	
	private static void createDirectoryEntries(List<BlazonRequestTemp> requests) {
		
		//List<String> requestUserTypes = Arrays.asList("MULTIPLE_REQUESTS,NEW_USER,UPDATE_USER,REMOVE_USER,CHANGE_STATUS_USER,LOCK_USER,UNLOCK_USER,RESET_PASSWORD".split(","));
		
		List<String> requestResourceTypes = Arrays.asList("CREATE_ACCOUNT".split(","));
		
		List<String> requestAccountTypes = Arrays.asList("UPDATE_ACCOUNT,ACTIVATE_ACCOUNT,INACTIVATE_ACCOUNT,REMOVE_ACCOUNT".split(","));
		
		List<String> requestRoleTypes = Arrays.asList("ASSIGN_ROLE,REMOVE_USER_FROM_ROLE".split(","));
		
		List<String> requestEntitlementTypes = Arrays.asList("REMOVE_ENTITLEMENT_FROM_ACCOUNT, ASSIGN_ENTITLEMENT".split(","));
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			conn.setAutoCommit(false);
			
			for(BlazonRequestTemp request: requests) {
				
				if(request.getRequester_id() != null) {
					
					createUserDirectoryEntry(conn, request.getRequest_id(), request.getRequester_id(), "requester");
				}
				
				if(request.getBeneficiary_id() != null) {
					
					createUserDirectoryEntry(conn, request.getRequest_id(), request.getBeneficiary_id(), "beneficiary");
				}
				
				if(requestResourceTypes.contains(request.getRequestType()) && request.getResourceId() != null) {
					
					createResourceDirectoryEntry(conn, request.getRequest_id(), request.getResourceId());
				}
			
				if(requestAccountTypes.contains(request.getRequestType()) && request.getAccountId() != null && request.getResourceId() != null) {
					
					createAccountDirectoryEntry(conn, request.getRequest_id(), request.getAccountId(), request.getResourceId());
				}
				
				if(requestRoleTypes.contains(request.getRequestType()) && request.getRoleId() != null) {
					
					createRoleDirectoryEntry(conn, request.getRequest_id(), request.getRoleId());
				}
				
				if(requestEntitlementTypes.contains(request.getRequestType()) && request.getRoleId() != null && request.getAccountId() != null) {
					
					createMembershipEntitlementDirectoryEntry(conn, request.getRequest_id(), request.getEntitlementId(), request.getAccountId(), request.getResourceId());
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
	

	private static Long createUserDirectoryEntry(Connection conn, Long requestId, Long userId, String userType) throws SQLException {
		
		PreparedStatement statement;
		
		String sql = " select username, displayName from User where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, userId);

		ResultSet rs = statement.executeQuery();
		
		String username = null;
		String displayName = null;
		
		if(rs.next()) {
			
			username = rs.getString("username");
			displayName = rs.getString("displayname");
			
		} else {
			
			return -1L;
		}
		
		sql = " insert into BlazonRequestDirectoryEntry (type, directoryIdentifier, username, displayName) " + 
				" values (?, ?, ?, ?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		
		int pos = 1;
		statement.setString(pos++, "USER");
		statement.setLong(pos++, userId);
		statement.setString(pos++, username);
		statement.setString(pos++, displayName);
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating BlazonRequestDirectoryEntry instance failed, no rows affected.");
		}
		
		Long blazonRequestDirectoryEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	blazonRequestDirectoryEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating blazonRequestDirectoryEntryId instance failed, no ID obtained.");
		    }
		}
		
		if(userType.equals("beneficiary")) {
			sql = " update BlazonRequest set beneficiary_id = ? where id = ? ";
		} else {
			sql = " update BlazonRequest set requester_id = ? where id = ? ";
		}
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, blazonRequestDirectoryEntryId);
		statement.setLong(2, requestId);
		
		statement.executeUpdate();
		
		statement.close();
		
		return blazonRequestDirectoryEntryId;
	}
	
	
	private static Long createResourceDirectoryEntry(Connection conn, Long requestId, Long resourceId) throws SQLException {
		
		PreparedStatement statement;
		
		String sql = " select name from Resource where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, resourceId);

		ResultSet rs = statement.executeQuery();
		
		String name = null;
		
		if(rs.next()) {
			
			name = rs.getString("name");
			
		} else {
			
			return -1L;
		}
		
		sql = " insert into BlazonRequestDirectoryEntry (directoryIdentifier, type, name) " + 
				" values (?, ?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setLong(1, resourceId);
		statement.setString(2, "RESOURCE");
		statement.setString(3, name);
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating BlazonRequestDirectoryEntry instance failed, no rows affected.");
		}
		
		Long blazonRequestDirectoryEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	blazonRequestDirectoryEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating blazonRequestDirectoryEntryId instance failed, no ID obtained.");
		    }
		}
		
		sql = " update BlazonRequest set requestInternalEntry_id = ? where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, blazonRequestDirectoryEntryId);
		statement.setLong(2, requestId);
		
		statement.executeUpdate();
		
		statement.close();
		
		return blazonRequestDirectoryEntryId;
	}
	
	
	private static Long createAccountDirectoryEntry(Connection conn, Long requestId, Long accountId, Long resourceId) throws SQLException {
		
		PreparedStatement statement;
		
		String sql = " insert into BlazonRequestDirectoryEntry (directoryIdentifier, type) " + 
				" values (?, ?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setLong(1, accountId);
		statement.setString(2, "ACCOUNT");
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating BlazonRequestDirectoryEntry instance failed, no rows affected.");
		}
		
		Long blazonRequestDirectoryEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	blazonRequestDirectoryEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating blazonRequestDirectoryEntryId instance failed, no ID obtained.");
		    }
		}
		
		statement.close();
		
		sql = " select accountIdentifier from Account where id = ? ";
		
		PreparedStatement statement1 = conn.prepareStatement(sql);
		statement1.setLong(1, accountId);

		ResultSet rs1 = statement1.executeQuery();
		
		sql = " select name from Resource where id = ? ";
		
		PreparedStatement statement2 = conn.prepareStatement(sql);
		statement2.setLong(1, resourceId);

		ResultSet rs2 = statement2.executeQuery();
		
		if(rs1.next() && rs2.next()) {
			
			String accountIdentifier = rs1.getString("accountIdentifier");
			
			String resourceName = rs2.getString("name");
			
			sql = " insert into BlazonRequestAccount (id, accountIdentifier, resourceId, resourceName) " + 
					" values (?, ?, ?, ?) ";
			
			statement = conn.prepareStatement(sql);
			statement.setLong(1, blazonRequestDirectoryEntryId);
			statement.setString(2, accountIdentifier);
			statement.setLong(3, resourceId);
			statement.setString(4, resourceName);
			
			statement.executeUpdate();
			
			statement1.close();
			statement2.close();
			statement.close();
		}
		
		sql = " update BlazonRequest set requestInternalEntry_id = ? where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, blazonRequestDirectoryEntryId);
		statement.setLong(2, requestId);
		
		statement.executeUpdate();
		
		statement.close();
		
		return blazonRequestDirectoryEntryId;
	}
	
	
	private static Long createRoleDirectoryEntry(Connection conn, Long requestId, Long roleId) throws SQLException {
		
		PreparedStatement statement;
		
		String sql = " insert into BlazonRequestDirectoryEntry (directoryIdentifier, type) " + 
				" values (?, ?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setLong(1, roleId);
		statement.setString(2, "ROLE");
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating BlazonRequestDirectoryEntry instance failed, no rows affected.");
		}
		
		Long blazonRequestDirectoryEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	blazonRequestDirectoryEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating blazonRequestDirectoryEntryId instance failed, no ID obtained.");
		    }
		}
		
		statement.close();
		
		sql = " select name from Role where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, roleId);

		ResultSet rs = statement.executeQuery();
		
		if(rs.next()) {
			
			String name = rs.getString("name");
			
			sql = " insert into BlazonRequestRole (id, name) " + 
					" values (?, ?) ";
			
			statement = conn.prepareStatement(sql);
			statement.setLong(1, blazonRequestDirectoryEntryId);
			statement.setString(2, name);
			
			statement.executeUpdate();
			
			statement.close();
		}
		
		sql = " update BlazonRequest set requestInternalEntry_id = ? where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, blazonRequestDirectoryEntryId);
		statement.setLong(2, requestId);
		
		statement.executeUpdate();
		
		statement.close();
		
		return blazonRequestDirectoryEntryId;
	}
	
	
	private static Long createEntitlementDirectoryEntry(Connection conn, Long requestId, Long entitlementId) throws SQLException {
		
		PreparedStatement statement;
		
		String sql = " insert into BlazonRequestDirectoryEntry (directoryIdentifier, type) " + 
				" values (?, ?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setLong(1, entitlementId);
		statement.setString(2, "ENTITLEMENT");
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating BlazonRequestDirectoryEntry instance failed, no rows affected.");
		}
		
		Long blazonRequestDirectoryEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	blazonRequestDirectoryEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating blazonRequestDirectoryEntryId instance failed, no ID obtained.");
		    }
		}
		
		statement.close();
		
		sql = " select name from Entitlement where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, entitlementId);

		ResultSet rs = statement.executeQuery();
		
		if(rs.next()) {
			
			String name = rs.getString("name");
			
			sql = " insert into BlazonRequestEntitlement (id, name) " + 
					" values (?, ?) ";
			
			statement = conn.prepareStatement(sql);
			statement.setLong(1, blazonRequestDirectoryEntryId);
			statement.setString(2, name);
			
			statement.executeUpdate();
			
			statement.close();
		}
		
		sql = " update BlazonRequest set requestInternalEntry_id = ? where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, blazonRequestDirectoryEntryId);
		statement.setLong(2, requestId);
		
		statement.executeUpdate();
		
		statement.close();
		
		return blazonRequestDirectoryEntryId;
	}
	
	
	private static void createMembershipEntitlementDirectoryEntry(Connection conn, Long requestId, Long entitlementId, Long accountId, Long resourceId) throws SQLException {
		
		Long blazonRequestDirectoryAccountId = createAccountDirectoryEntry(conn, requestId, accountId, resourceId);
		
		Long blazonRequestDirectoryEntitlementId = createEntitlementDirectoryEntry(conn, requestId, entitlementId);
		
		PreparedStatement statement;
		
		String sql = " insert into BlazonRequestDirectoryEntry (type) " + 
				" values (?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setString(1, "MEMBERSHIP_ENTITLEMENT");
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating BlazonRequestDirectoryEntry instance failed, no rows affected.");
		}
		
		Long blazonRequestDirectoryEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	blazonRequestDirectoryEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating blazonRequestDirectoryEntryId instance failed, no ID obtained.");
		    }
		}
		
		statement.close();
		
		sql = " insert into BlazonRequestMembershipEntitlement (id, account_id, entitlement_id) " + 
				" values (?, ?, ?) ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, blazonRequestDirectoryEntryId);
		statement.setLong(2, blazonRequestDirectoryAccountId);
		statement.setLong(3, blazonRequestDirectoryEntitlementId);
		
		statement.executeUpdate();
		
		statement.close();
		
		sql = " update BlazonRequest set requestInternalEntry_id = ? where id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, blazonRequestDirectoryEntryId);
		statement.setLong(2, requestId);
		
		statement.executeUpdate();
		
		statement.close();
	}
}
