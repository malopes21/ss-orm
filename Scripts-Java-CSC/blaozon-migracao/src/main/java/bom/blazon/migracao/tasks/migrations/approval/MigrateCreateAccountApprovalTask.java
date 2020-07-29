package bom.blazon.migracao.tasks.migrations.approval;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import bom.blazon.migracao.tasks.enrichment.SearchResource;
import bom.blazon.migracao.tasks.loading.CreateTask;
import bom.blazon.migracao.tasks.loading.CreateTaskData;
import bom.blazon.migracao.tasks.loading.CreateUserTask;

public class MigrateCreateAccountApprovalTask {
	
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
		
		JSONObject payload = new JSONObject(data.get("requestPayload").toString());
		
		Long resourceId = Long.valueOf(payload.get("resourceId").toString());
		
		Map<String, Object> resource = SearchResource.read(resourceId, sourceConn);
		
		if(resource == null) {
			
			System.out.println(String.format("Detalhes sobre o resource não foi encontrado. TaskId: %s", data.get("id")));
			
		} else {
			
			addTaskData(taskId, "resourceIdentifier", resource.get("id").toString(), destinationConn);
			addTaskData(taskId, "resource", resource.get("name").toString(), destinationConn);
			addTaskData(taskId, "resourceDescription", resource.get("description"), destinationConn);
			addTaskData(taskId, "type", "CREATE_ACCOUNT", destinationConn);
			
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