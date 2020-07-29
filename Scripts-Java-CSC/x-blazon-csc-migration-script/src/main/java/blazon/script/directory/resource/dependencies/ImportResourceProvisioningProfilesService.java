package blazon.script.directory.resource.dependencies;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import blazon.script.util.ConnectionFactory;

public class ImportResourceProvisioningProfilesService {

	private final static Logger LOGGER = Logger.getLogger(ImportResourceProvisioningProfilesService.class.getName());

	public static void main(String[] args) throws Exception {

		long inicio = System.currentTimeMillis();

		execute();

		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");
	}

	public static void execute() throws Exception {

		List<Map<String, Object>> rows = read();
		save(rows);
	}

	static List<Map<String, Object>> read() throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from ResourceProvisioningProfile \n";

		statement = conn.prepareStatement(sql);
		rs = statement.executeQuery();

		while (rs.next()) {

			Map<String, Object> row = new HashMap<>();
			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}

			rows.add(row);
		}

		conn.commit();

		return rows;
	}

	public static void save(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			saveProvisioningProfile(targetConn, row);
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveProvisioningProfile(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO ResourceProvisioningProfile\n" + "(\n" + "id,\n"
				+ "activateAccountProvisioningFailoverWorkflow, \n" + "activateAccountProvisioningMappingIdentifier, \n"
				+ "activateAccountProvisioningObject, \n" + "activateAccountProvisioningTaskDefinitionIdentifier, \n"
				+ "activateAccountProvisioningTaskQueueIdentifier, \n" + "activateAccountProvisioningType, \n"
				+ "addMemberToEntitlementProvisioningFailoverWorkflow, \n"
				+ "addMemberToEntitlementProvisioningMappingIdentifier, \n"
				+ "addMemberToEntitlementProvisioningObject, \n"
				+ "addMemberToEntitlementProvisioningTaskDefinitionIdentifier, \n"
				+ "addMemberToEntitlementProvisioningTaskQueueIdentifier, \n"
				+ "addMemberToEntitlementProvisioningType, \n" + "changePasswordProvisioningFailoverWorkflow, \n"
				+ "changePasswordProvisioningMappingIdentifier, \n" + "changePasswordProvisioningObject, \n"
				+ "changePasswordProvisioningTaskDefinitionIdentifier, \n"
				+ "changePasswordProvisioningTaskQueueIdentifier, \n" + "changePasswordProvisioningType, \n"
				+ "createAccountProvisioningFailoverWorkflow, \n" + "createAccountProvisioningMappingIdentifier, \n"
				+ "createAccountProvisioningObject, \n" + "createAccountProvisioningTaskDefinitionIdentifier, \n"
				+ "createAccountProvisioningTaskQueueIdentifier, \n" + "createAccountProvisioningType, \n"
				+ "createEntitlementProvisioningFailoverWorkflow, \n"
				+ "createEntitlementProvisioningMappingIdentifier, \n" + "createEntitlementProvisioningObject, \n"
				+ "createEntitlementProvisioningTaskDefinitionIdentifier, \n"
				+ "createEntitlementProvisioningTaskQueueIdentifier, \n" + "createEntitlementProvisioningType, \n"
				+ "grantEntitlementProvisioningFailoverWorkflow, \n"
				+ "grantEntitlementProvisioningMappingIdentifier, \n"
				+ "grantEntitlementProvisioningMappingIdentifier2, \n" + "grantEntitlementProvisioningObject, \n"
				+ "grantEntitlementProvisioningTaskDefinitionIdentifier, \n"
				+ "grantEntitlementProvisioningTaskQueueIdentifier, \n" + "grantEntitlementProvisioningType, \n"
				+ "inactivateAccountProvisioningFailoverWorkflow, \n"
				+ "inactivateAccountProvisioningMappingIdentifier, \n" + "inactivateAccountProvisioningObject, \n"
				+ "inactivateAccountProvisioningTaskDefinitionIdentifier, \n"
				+ "inactivateAccountProvisioningTaskQueueIdentifier, \n" + "inactivateAccountProvisioningType, \n"
				+ "removeEntitlementProvisioningFailoverWorkflow, \n"
				+ "removeEntitlementProvisioningMappingIdentifier, \n" + "removeEntitlementProvisioningObject, \n"
				+ "removeEntitlementProvisioningTaskDefinitionIdentifier, \n"
				+ "removeEntitlementProvisioningTaskQueueIdentifier, \n" + "removeEntitlementProvisioningType, \n"
				+ "removeMemberOfEntitlementProvisioningFailoverWorkflow, \n"
				+ "removeMemberOfEntitlementProvisioningMappingIdentifier, \n"
				+ "removeMemberOfEntitlementProvisioningObject, \n"
				+ "removeMemberOfEntitlementProvisioningTaskDefinitionIdentifier, \n"
				+ "removeMemberOfEntitlementProvisioningTaskQueueIdentifier, \n"
				+ "removeMemberOfEntitlementProvisioningType, \n" + "resourceId, \n"
				+ "revokeAccountProvisioningFailoverWorkflow, \n" + "revokeAccountProvisioningMappingIdentifier, \n"
				+ "revokeAccountProvisioningObject, \n" + "revokeAccountProvisioningTaskDefinitionIdentifier, \n"
				+ "revokeAccountProvisioningTaskQueueIdentifier, \n" + "revokeAccountProvisioningType, \n"
				+ "revokeEntitlementProvisioningFailoverWorkflow, \n"
				+ "revokeEntitlementProvisioningMappingIdentifier, \n"
				+ "revokeEntitlementProvisioningMappingIdentifier2, \n" + "revokeEntitlementProvisioningObject, \n"
				+ "revokeEntitlementProvisioningTaskDefinitionIdentifier, \n"
				+ "revokeEntitlementProvisioningTaskQueueIdentifier, \n" + "revokeEntitlementProvisioningType, \n"
				+ "updateAccountProvisioningFailoverWorkflow, \n" + "updateAccountProvisioningMappingIdentifier, \n"
				+ "updateAccountProvisioningObject, \n" + "updateAccountProvisioningTaskDefinitionIdentifier, \n"
				+ "updateAccountProvisioningTaskQueueIdentifier, \n" + "updateAccountProvisioningType, \n"
				+ "updateEntitlementProvisioningFailoverWorkflow, \n"
				+ "updateEntitlementProvisioningMappingIdentifier, \n" + "updateEntitlementProvisioningObject, \n"
				+ "updateEntitlementProvisioningTaskDefinitionIdentifier, \n"
				+ "updateEntitlementProvisioningTaskQueueIdentifier, \n" + "updateEntitlementProvisioningType\n" + ")\n"
				+ "VALUES(\n" + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n" + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n"
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n" + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n"
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n" + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n"
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n" + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n" + "?, ?)";

		statement = conn.prepareStatement(sql);

		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("activateAccountProvisioningFailoverWorkflow") != null) {
			statement.setString(2, (String) row.get("activateAccountProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(2, null);
		}
		if (row.get("activateAccountProvisioningMappingIdentifier") != null) {
			statement.setLong(3, (Long) row.get("activateAccountProvisioningMappingIdentifier"));
		} else {
			statement.setObject(3, null);
		}
		if (row.get("activateAccountProvisioningObject") != null) {
			statement.setString(4, (String) row.get("activateAccountProvisioningObject"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("activateAccountProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(5, (Long) row.get("activateAccountProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("activateAccountProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(6, (Long) row.get("activateAccountProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("activateAccountProvisioningType") != null) {
			statement.setString(7, (String) row.get("activateAccountProvisioningType"));
		} else {
			statement.setObject(7, null);
		}
		if (row.get("addMemberToEntitlementProvisioningFailoverWorkflow") != null) {
			statement.setString(8, (String) row.get("addMemberToEntitlementProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(8, null);
		}
		if (row.get("addMemberToEntitlementProvisioningMappingIdentifier") != null) {
			statement.setLong(9, (Long) row.get("addMemberToEntitlementProvisioningMappingIdentifier"));
		} else {
			statement.setObject(9, null);
		}
		if (row.get("addMemberToEntitlementProvisioningObject") != null) {
			statement.setString(10, (String) row.get("addMemberToEntitlementProvisioningObject"));
		} else {
			statement.setObject(10, null);
		}
		if (row.get("addMemberToEntitlementProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(11, (Long) row.get("addMemberToEntitlementProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(11, null);
		}
		if (row.get("addMemberToEntitlementProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(12, (Long) row.get("addMemberToEntitlementProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(12, null);
		}
		if (row.get("addMemberToEntitlementProvisioningType") != null) {
			statement.setString(13, (String) row.get("addMemberToEntitlementProvisioningType"));
		} else {
			statement.setObject(13, null);
		}
		if (row.get("changePasswordProvisioningFailoverWorkflow") != null) {
			statement.setString(14, (String) row.get("changePasswordProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(14, null);
		}
		if (row.get("changePasswordProvisioningMappingIdentifier") != null) {
			statement.setLong(15, (Long) row.get("changePasswordProvisioningMappingIdentifier"));
		} else {
			statement.setObject(15, null);
		}
		if (row.get("changePasswordProvisioningObject") != null) {
			statement.setString(16, (String) row.get("changePasswordProvisioningObject"));
		} else {
			statement.setObject(16, null);
		}
		if (row.get("changePasswordProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(17, (Long) row.get("changePasswordProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(17, null);
		}
		if (row.get("changePasswordProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(18, (Long) row.get("changePasswordProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(18, null);
		}
		if (row.get("changePasswordProvisioningType") != null) {
			statement.setString(19, (String) row.get("changePasswordProvisioningType"));
		} else {
			statement.setObject(19, null);
		}
		if (row.get("createAccountProvisioningFailoverWorkflow") != null) {
			statement.setString(20, (String) row.get("createAccountProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(20, null);
		}
		if (row.get("createAccountProvisioningMappingIdentifier") != null) {
			statement.setLong(21, (Long) row.get("createAccountProvisioningMappingIdentifier"));
		} else {
			statement.setObject(21, null);
		}
		if (row.get("createAccountProvisioningObject") != null) {
			statement.setString(22, (String) row.get("createAccountProvisioningObject"));
		} else {
			statement.setObject(22, null);
		}
		if (row.get("createAccountProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(23, (Long) row.get("createAccountProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(23, null);
		}
		if (row.get("createAccountProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(24, (Long) row.get("createAccountProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(24, null);
		}
		if (row.get("createAccountProvisioningType") != null) {
			statement.setString(25, (String) row.get("createAccountProvisioningType"));
		} else {
			statement.setObject(25, null);
		}
		if (row.get("createEntitlementProvisioningFailoverWorkflow") != null) {
			statement.setString(26, (String) row.get("createEntitlementProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(26, null);
		}
		if (row.get("createEntitlementProvisioningMappingIdentifier") != null) {
			statement.setLong(27, (Long) row.get("createEntitlementProvisioningMappingIdentifier"));
		} else {
			statement.setObject(27, null);
		}
		if (row.get("createEntitlementProvisioningObject") != null) {
			statement.setString(28, (String) row.get("createEntitlementProvisioningObject"));
		} else {
			statement.setObject(28, null);
		}
		if (row.get("createEntitlementProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(29, (Long) row.get("createEntitlementProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(29, null);
		}
		if (row.get("createEntitlementProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(30, (Long) row.get("createEntitlementProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(30, null);
		}
		if (row.get("createEntitlementProvisioningType") != null) {
			statement.setString(31, (String) row.get("createEntitlementProvisioningType"));
		} else {
			statement.setObject(31, null);
		}
		if (row.get("grantEntitlementProvisioningFailoverWorkflow") != null) {
			statement.setString(32, (String) row.get("grantEntitlementProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(32, null);
		}
		if (row.get("grantEntitlementProvisioningMappingIdentifier") != null) {
			statement.setLong(33, (Long) row.get("grantEntitlementProvisioningMappingIdentifier"));
		} else {
			statement.setObject(33, null);
		}
		if (row.get("grantEntitlementProvisioningMappingIdentifier2") != null) {
			statement.setLong(34, (Long) row.get("grantEntitlementProvisioningMappingIdentifier2"));
		} else {
			statement.setObject(34, null);
		}
		if (row.get("grantEntitlementProvisioningObject") != null) {
			statement.setString(35, (String) row.get("grantEntitlementProvisioningObject"));
		} else {
			statement.setObject(35, null);
		}
		if (row.get("grantEntitlementProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(36, (Long) row.get("grantEntitlementProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(36, null);
		}
		if (row.get("grantEntitlementProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(37, (Long) row.get("grantEntitlementProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(37, null);
		}
		if (row.get("grantEntitlementProvisioningType") != null) {
			statement.setString(38, (String) row.get("grantEntitlementProvisioningType"));
		} else {
			statement.setObject(38, null);
		}
		if (row.get("inactivateAccountProvisioningFailoverWorkflow") != null) {
			statement.setString(39, (String) row.get("inactivateAccountProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(39, null);
		}
		if (row.get("inactivateAccountProvisioningMappingIdentifier") != null) {
			statement.setLong(40, (Long) row.get("inactivateAccountProvisioningMappingIdentifier"));
		} else {
			statement.setObject(40, null);
		}
		if (row.get("inactivateAccountProvisioningObject") != null) {
			statement.setString(41, (String) row.get("inactivateAccountProvisioningObject"));
		} else {
			statement.setObject(41, null);
		}
		if (row.get("inactivateAccountProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(42, (Long) row.get("inactivateAccountProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(42, null);
		}
		if (row.get("inactivateAccountProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(43, (Long) row.get("inactivateAccountProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(43, null);
		}
		if (row.get("inactivateAccountProvisioningType") != null) {
			statement.setString(44, (String) row.get("inactivateAccountProvisioningType"));
		} else {
			statement.setObject(44, null);
		}
		if (row.get("removeEntitlementProvisioningFailoverWorkflow") != null) {
			statement.setString(45, (String) row.get("removeEntitlementProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(45, null);
		}
		if (row.get("removeEntitlementProvisioningMappingIdentifier") != null) {
			statement.setLong(46, (Long) row.get("removeEntitlementProvisioningMappingIdentifier"));
		} else {
			statement.setObject(46, null);
		}
		if (row.get("removeEntitlementProvisioningObject") != null) {
			statement.setString(47, (String) row.get("removeEntitlementProvisioningObject"));
		} else {
			statement.setObject(47, null);
		}
		if (row.get("removeEntitlementProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(48, (Long) row.get("removeEntitlementProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(48, null);
		}
		if (row.get("removeEntitlementProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(49, (Long) row.get("removeEntitlementProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(49, null);
		}
		if (row.get("removeEntitlementProvisioningType") != null) {
			statement.setString(50, (String) row.get("removeEntitlementProvisioningType"));
		} else {
			statement.setObject(50, null);
		}
		if (row.get("removeMemberOfEntitlementProvisioningFailoverWorkflow") != null) {
			statement.setString(51, (String) row.get("removeMemberOfEntitlementProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(51, null);
		}
		if (row.get("removeMemberOfEntitlementProvisioningMappingIdentifier") != null) {
			statement.setLong(52, (Long) row.get("removeMemberOfEntitlementProvisioningMappingIdentifier"));
		} else {
			statement.setObject(52, null);
		}
		if (row.get("removeMemberOfEntitlementProvisioningObject") != null) {
			statement.setString(53, (String) row.get("removeMemberOfEntitlementProvisioningObject"));
		} else {
			statement.setObject(53, null);
		}
		if (row.get("removeMemberOfEntitlementProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(54, (Long) row.get("removeMemberOfEntitlementProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(54, null);
		}
		if (row.get("removeMemberOfEntitlementProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(55, (Long) row.get("removeMemberOfEntitlementProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(55, null);
		}
		if (row.get("removeMemberOfEntitlementProvisioningType") != null) {
			statement.setString(56, (String) row.get("removeMemberOfEntitlementProvisioningType"));
		} else {
			statement.setObject(56, null);
		}
		if (row.get("resourceId") != null) {
			statement.setLong(57, (Long) row.get("resourceId"));
		} else {
			statement.setObject(57, null);
		}
		if (row.get("revokeAccountProvisioningFailoverWorkflow") != null) {
			statement.setString(58, (String) row.get("revokeAccountProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(58, null);
		}
		if (row.get("revokeAccountProvisioningMappingIdentifier") != null) {
			statement.setLong(59, (Long) row.get("revokeAccountProvisioningMappingIdentifier"));
		} else {
			statement.setObject(59, null);
		}
		if (row.get("revokeAccountProvisioningObject") != null) {
			statement.setString(60, (String) row.get("revokeAccountProvisioningObject"));
		} else {
			statement.setObject(60, null);
		}
		if (row.get("revokeAccountProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(61, (Long) row.get("revokeAccountProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(61, null);
		}
		if (row.get("revokeAccountProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(62, (Long) row.get("revokeAccountProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(62, null);
		}
		if (row.get("revokeAccountProvisioningType") != null) {
			statement.setString(63, (String) row.get("revokeAccountProvisioningType"));
		} else {
			statement.setObject(63, null);
		}
		if (row.get("revokeEntitlementProvisioningFailoverWorkflow") != null) {
			statement.setString(64, (String) row.get("revokeEntitlementProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(64, null);
		}
		if (row.get("revokeEntitlementProvisioningMappingIdentifier") != null) {
			statement.setLong(65, (Long) row.get("revokeEntitlementProvisioningMappingIdentifier"));
		} else {
			statement.setObject(65, null);
		}
		if (row.get("revokeEntitlementProvisioningMappingIdentifier2") != null) {
			statement.setLong(66, (Long) row.get("revokeEntitlementProvisioningMappingIdentifier2"));
		} else {
			statement.setObject(66, null);
		}
		if (row.get("revokeEntitlementProvisioningObject") != null) {
			statement.setString(67, (String) row.get("revokeEntitlementProvisioningObject"));
		} else {
			statement.setObject(67, null);
		}
		if (row.get("revokeEntitlementProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(68, (Long) row.get("revokeEntitlementProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(68, null);
		}
		if (row.get("revokeEntitlementProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(69, (Long) row.get("revokeEntitlementProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(69, null);
		}
		if (row.get("revokeEntitlementProvisioningType") != null) {
			statement.setString(70, (String) row.get("revokeEntitlementProvisioningType"));
		} else {
			statement.setObject(70, null);
		}
		if (row.get("updateAccountProvisioningFailoverWorkflow") != null) {
			statement.setString(71, (String) row.get("updateAccountProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(71, null);
		}
		if (row.get("updateAccountProvisioningMappingIdentifier") != null) {
			statement.setLong(72, (Long) row.get("updateAccountProvisioningMappingIdentifier"));
		} else {
			statement.setObject(72, null);
		}
		if (row.get("updateAccountProvisioningObject") != null) {
			statement.setString(73, (String) row.get("updateAccountProvisioningObject"));
		} else {
			statement.setObject(73, null);
		}
		if (row.get("updateAccountProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(74, (Long) row.get("updateAccountProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(74, null);
		}
		if (row.get("updateAccountProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(75, (Long) row.get("updateAccountProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(75, null);
		}
		if (row.get("updateAccountProvisioningType") != null) {
			statement.setString(76, (String) row.get("updateAccountProvisioningType"));
		} else {
			statement.setObject(76, null);
		}
		if (row.get("updateEntitlementProvisioningFailoverWorkflow") != null) {
			statement.setString(77, (String) row.get("updateEntitlementProvisioningFailoverWorkflow"));
		} else {
			statement.setObject(77, null);
		}
		if (row.get("updateEntitlementProvisioningMappingIdentifier") != null) {
			statement.setLong(78, (Long) row.get("updateEntitlementProvisioningMappingIdentifier"));
		} else {
			statement.setObject(78, null);
		}
		if (row.get("updateEntitlementProvisioningObject") != null) {
			statement.setString(79, (String) row.get("updateEntitlementProvisioningObject"));
		} else {
			statement.setObject(79, null);
		}
		if (row.get("updateEntitlementProvisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(80, (Long) row.get("updateEntitlementProvisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(80, null);
		}
		if (row.get("updateEntitlementProvisioningTaskQueueIdentifier") != null) {
			statement.setLong(81, (Long) row.get("updateEntitlementProvisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(81, null);
		}
		if (row.get("updateEntitlementProvisioningType") != null) {
			statement.setString(82, (String) row.get("updateEntitlementProvisioningType"));
		} else {
			statement.setObject(82, null);
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		LOGGER.info("Enviando comando SQL de importação de resource provisioning profile com id " + row.get("id"));
	}
}
