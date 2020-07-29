package bom.blazon.migracao.tasks.migrations.approval;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import bom.blazon.migracao.tasks.enrichment.SearchRole;
import bom.blazon.migracao.tasks.loading.CreateTask;
import bom.blazon.migracao.tasks.loading.CreateTaskData;
import bom.blazon.migracao.tasks.loading.CreateUserTask;

public class MigrateAssignRoleApprovalTask {

	public static void create(Map<String, Object> data, Connection sourceConnection, Connection destinationConnection) throws ClassNotFoundException, SQLException {
		
		if (data.get("userFromId") != null) {

			Map<String, Object> userFrom = new HashMap<>();

			userFrom.put("directoryIdentifier", data.get("userFromId"));
			userFrom.put("displayName", data.get("userFromDisplayName"));
			userFrom.put("username", data.get("userFromUsername"));

			Long userFromId = CreateUserTask.create(userFrom, destinationConnection);

			data.put("requester_id", userFromId);

		}

		if (data.get("recipientId") != null) {

			Map<String, Object> userTo = new HashMap<>();

			userTo.put("directoryIdentifier", data.get("recipientId"));
			userTo.put("displayName", data.get("recipientDisplayName"));
			userTo.put("username", data.get("recipientUsername"));

			Long userToId = CreateUserTask.create(userTo, destinationConnection);

			data.put("recipient_id", userToId);

		}
		
		Long taskId = CreateTask.create(data, destinationConnection);
		
		JSONObject payload = new JSONObject(data.get("requestPayload").toString());

		Long roleId = Long.valueOf(payload.get("roleId").toString());
		
		Map<String, Object> role = SearchRole.read(roleId, sourceConnection);
		
		if(role != null) {
			
			addTaskData(taskId, "roleIdentifier",  role.get("id").toString(), destinationConnection);
			addTaskData(taskId, "role",  role.get("name").toString(), destinationConnection);
			addTaskData(taskId, "roleDescription",  role.get("description"), destinationConnection);
			addTaskData(taskId, "type", "ASSIGN_ROLE", destinationConnection);
			
		} else {
			System.out.println(String.format("Detalhes sobre a role não foi encontrado. TaskId: %s", data.get("id")));
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
