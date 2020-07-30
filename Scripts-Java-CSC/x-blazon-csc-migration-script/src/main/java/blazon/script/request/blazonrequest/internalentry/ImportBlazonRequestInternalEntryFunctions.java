package blazon.script.request.blazonrequest.internalentry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import blazon.script.util.ConnectionFactory;

public class ImportBlazonRequestInternalEntryFunctions {

	public static Long insertInternalEntry(Connection conn, Map<String, Object> row) throws Exception {

		if (row.get("type") == null) {

			return null;
		}

		InternalEntryInfo internalEntryInfo = getDirectoryInternalInfo(row);

		if (internalEntryInfo.getType() == null) {

			return null;
		}

		Map<String, Object> internalEntryData = readInternalEntry(internalEntryInfo);

		if (internalEntryData.isEmpty()) {

			return null;
		}

		PreparedStatement statement = null;

		if (internalEntryInfo.getType().toString().equals("ACCOUNT")) {

			String sql = "insert into BlazonRequestDirectoryEntry (type, accountIdentifier, directoryIdentifier) values (?, ?, ?) ";

			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "ACCOUNT");
			statement.setString(2, (String) internalEntryData.get("accountIdentifier"));
			statement.setLong(3, (Long) internalEntryData.get("accountId"));

		} else if (internalEntryInfo.getType().toString().equals("MEMBERSHIP_ENTITLEMENT")) {

			String sql = "insert into BlazonRequestDirectoryEntry (type, accountId, accountIdentifier, entitlementId, entitlementName, resourceId, resourceName) "
					+ " values (?, ?, ?, ?, ?, ?, ?) ";

			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "MEMBERSHIP_ENTITLEMENT");
			statement.setLong(2, (Long) internalEntryData.get("accountId"));
			statement.setString(3, (String) internalEntryData.get("accountIdentifier"));
			statement.setLong(4, (Long) internalEntryData.get("entitlementId"));
			statement.setString(5, (String) internalEntryData.get("entitlementName"));
			statement.setLong(6, (Long) internalEntryData.get("resourceId"));
			statement.setString(7, (String) internalEntryData.get("resourceName"));

		} else if (internalEntryInfo.getType().toString().equals("RESOURCE")) {

			String sql = "insert into BlazonRequestDirectoryEntry (type, name, directoryIdentifier) values (?, ?, ?) ";

			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "RESOURCE");
			statement.setString(2, (String) internalEntryData.get("resourceName"));
			statement.setLong(3, (Long) internalEntryData.get("resourceId"));

		} else if (internalEntryInfo.getType().toString().equals("ROLE")) {

			String sql = "insert into BlazonRequestDirectoryEntry (type, name, directoryIdentifier) values (?, ?, ?) ";

			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "ROLE");
			statement.setString(2, (String) internalEntryData.get("roleName"));
			statement.setLong(3, (Long) internalEntryData.get("roleId"));

		} else if (internalEntryInfo.getType().toString().equals("USER")) {

			String sql = "insert into BlazonRequestDirectoryEntry (type, username, displayName, directoryIdentifier) "
					+ " values (?, ?, ?, ?) ";

			statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, (String) "USER");
			statement.setString(2, (String) internalEntryData.get("username"));
			statement.setString(3, (String) internalEntryData.get("displayName"));
			statement.setLong(4, (Long) internalEntryData.get("userId"));

		} else {

			throw new RuntimeException("Unknow target type!");
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Creating instance failed, no rows affected.");
		}

		Long internalProvisioningEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
			if (generatedKeys.next()) {

				internalProvisioningEntryId = generatedKeys.getLong(1);
			} else {
				throw new RuntimeException("Creating instance failed, no ID obtained.");
			}
		}

		return internalProvisioningEntryId;
	}

	private static InternalEntryInfo getDirectoryInternalInfo(Map<String, Object> row) {

		InternalEntryInfo info = new InternalEntryInfo();

		if (row.get("type").equals("ASSIGN_ROLE")) {
			info.setId((Long) row.get("roleId"));
			info.setType("ROLE");
		} else if (row.get("type").equals("CREATE_ACCOUNT")) {
			info.setId((Long) row.get("resourceId"));
			info.setType("RESOURCE");
		} else if (row.get("type").equals("ASSIGN_ENTITLEMENT")) {
			info.setAccountId((Long) row.get("accountId"));
			info.setEntitlementId((Long) row.get("entitlementId"));
			info.setType("MEMBERSHIP_ENTITLEMENT");
		} else if (row.get("type").equals("UPDATE_USER")) {
			info.setId((Long) row.get("beneficiary_id"));
			info.setType("USER");
		} else if (row.get("type").equals("ACTIVATE_ACCOUNT")) {
			JSONObject payload = new JSONObject(row.get("payload").toString());
			String accountIdString = payload.getString("accountId");
			info.setId(Long.valueOf(accountIdString));
			info.setType("ACCOUNT");
		} else if (row.get("type").equals("INACTIVATE_ACCOUNT")) {
			JSONObject payload = new JSONObject(row.get("payload").toString());
			info.setId(Long.valueOf(payload.getString("accountId")));
			info.setType("ACCOUNT");
		} else if (row.get("type").equals("CHANGE_STATUS_USER")) {
			info.setId((Long) row.get("beneficiary_id"));
			info.setType("USER");
		} else if (row.get("type").equals("REMOVE_USER_FROM_ROLE")) {
			if(row.get("roleId") != null) {
				info.setId((Long) row.get("roleId"));
			} else {
				JSONObject payload = new JSONObject(row.get("payload").toString());
				info.setId(Long.valueOf(payload.getLong("roleId")));
			}
			info.setType("ROLE");
		} else if (row.get("type").equals("REMOVE_ACCOUNT")) {
			JSONObject payload = new JSONObject(row.get("payload").toString());
			String accountIdString = payload.getString("accountId");
			info.setId(Long.valueOf(accountIdString));
			info.setType("ACCOUNT");
		} else if (row.get("type").equals("REMOVE_ENTITLEMENT_FROM_ACCOUNT")) {
			JSONObject payload = new JSONObject(row.get("payload").toString());
			info.setAccountId(Long.valueOf(payload.getString("accountId")));
			info.setEntitlementId(Long.valueOf(payload.getString("entitlementId")));
			info.setType("MEMBERSHIP_ENTITLEMENT");
		} else if (row.get("type").equals("UPDATE_ACCOUNT")) {
			info.setId((Long) row.get("accountId"));
			info.setType("ACCOUNT");
		}
		
		return info;
	}

	static Map<String, Object> readInternalEntry(InternalEntryInfo internalEntryInfo) throws Exception {

		Long targetId = internalEntryInfo.getId();
		String targetType = internalEntryInfo.getType();

		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = null;
		if (targetType.equals("ACCOUNT")) {
			sql = "select \n" + 
					"	ac.id as accountId, \n" + 
					"	ac.accountIdentifier as accountIdentifier \n" + 
					"from Account ac \n" + 
					"where id = ?";
			statement = conn.prepareStatement(sql);
			statement.setLong(1, targetId);
		} else if (targetType.equals("MEMBERSHIP_ENTITLEMENT")) {
			sql = "select \n" + 
					"	me.id as membershipId, \n" + 
					"	ac.id as accountId,\n" + 
					"	ac.accountIdentifier as accountIdentifier, \n" + 
					"	ent.id as entitlementId, \n" + 
					"	ent.name as entitlementName, \n" + 
					"	re.id as resourceId, \n" + 
					"	re.name as resourceName \n" + 
					"from MembershipEntitlement me \n" + 
					"join Account ac on ac.id = me.account_id \n" + 
					"join Entitlement  ent on ent.id  = me.entitlement_id \n" + 
					"join Resource re on re.id = ent.resource_id \n" + 
					"where ac.id = ? and ent.id = ?";
			statement = conn.prepareStatement(sql);
			if (internalEntryInfo.getAccountId() != null) {
				statement.setLong(1, internalEntryInfo.getAccountId());
			} else {
				statement.setObject(1, null);
			}
			if (internalEntryInfo.getEntitlementId() != null) {
				statement.setLong(2, internalEntryInfo.getEntitlementId());
			} else {
				statement.setObject(1, null);
			}
		} else if (targetType.equals("ROLE")) {
			sql = "select \n" + 
					"	r.id as roleId, \n" + 
					"	r.name as roleName \n" + 
					"from Role r \n" + 
					"where id = ? ";
			statement = conn.prepareStatement(sql);
			statement.setLong(1, targetId);
		} else if (targetType.equals("RESOURCE")) {
			sql = "select \n" + 
					"	r.id as resourceId, \n" + 
					"	r.name as resourceName \n" + 
					"from Resource r \n" + 
					"where id = ? ";
			statement = conn.prepareStatement(sql);
			statement.setLong(1, targetId);
		} else if (targetType.equals("USER")) {
			sql = "select \n" + 
					"	u.id as userId, \n" + 
					"	u.username as username,\n" + 
					"	u.displayName as displayName \n" + 
					"from User u \n" + 
					"where id = ? ";
			statement = conn.prepareStatement(sql);
			statement.setLong(1, targetId);
		} else {
			throw new RuntimeException("Unknow target type!");
		}

		rs = statement.executeQuery();

		Map<String, Object> row = new HashMap<>();

		if (rs.next()) {

			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnLabel(i), rs.getObject(i));
			}
		}

		conn.commit();
		conn.close();

		return row;
	}

}

class InternalEntryInfo {

	private Long id;
	private String type;

	private Long accountId;
	private Long entitlementId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public Long getEntitlementId() {
		return entitlementId;
	}

	public void setEntitlementId(Long entitlementId) {
		this.entitlementId = entitlementId;
	}

}
