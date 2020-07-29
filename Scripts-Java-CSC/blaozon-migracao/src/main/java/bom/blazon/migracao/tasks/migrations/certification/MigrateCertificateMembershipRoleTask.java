package bom.blazon.migracao.tasks.migrations.certification;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import bom.blazon.migracao.tasks.enrichment.SearchRole;
import bom.blazon.migracao.tasks.loading.CreateTask;
import bom.blazon.migracao.tasks.loading.CreateTaskData;
import bom.blazon.migracao.tasks.loading.CreateUserTask;

public class MigrateCertificateMembershipRoleTask {
	
	public static void create(Map<String, Object> data, Connection sourceConn, Connection destinationConn) throws ClassNotFoundException, SQLException {
		
		if (data.get("userFromId") != null) {

			Map<String, Object> userFrom = new HashMap<>();

			userFrom.put("directoryIdentifier", data.get("userFromId"));
			userFrom.put("displayName", data.get("userFromDisplayName"));
			userFrom.put("username", data.get("userFromUsername"));

			Long userFromId = CreateUserTask.create(userFrom, destinationConn);

			data.put("requester_id", userFromId);

		}

		if (data.get("recipientId") != null) {

			Map<String, Object> userTo = new HashMap<>();

			userTo.put("directoryIdentifier", data.get("recipientId"));
			userTo.put("displayName", data.get("recipientDisplayName"));
			userTo.put("username", data.get("recipientUsername"));

			Long userToId = CreateUserTask.create(userTo, destinationConn);

			data.put("recipient_id", userToId);

		}
		
		Long taskId = CreateTask.create(data, destinationConn);
		
		Long roleId = Long.valueOf(data.get("roleId").toString());
		
		Map<String, Object> role = SearchRole.read(roleId, sourceConn);
		
		if(role == null) {
			
			System.out.println(String.format("Detalhes sobre role não foi encontrado. TaskId: %s", data.get("id")));
			
		} else {
		
			addTaskData(taskId, "roleIdentifier",  role.get("id").toString(), destinationConn);
			addTaskData(taskId, "role",  role.get("name").toString(), destinationConn);
			addTaskData(taskId, "roleDescription",  role.get("description"), destinationConn);
			addTaskData(taskId, "type", "MEMBERSHIP_ROLE", destinationConn);
		
		}
		
	}
	
	private static void addTaskData(Long taskId, String name, Object value, Connection conn) throws ClassNotFoundException, SQLException {
		
		Map<String, Object> data = new HashMap<>();
		data.put("taskId", taskId);
		data.put("name", name);
		data.put("value", value);
		
		CreateTaskData.create(data, conn);
		
	}

}
