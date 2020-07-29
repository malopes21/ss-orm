package bom.blazon.migracao.tasks.migrations.rolerights;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import bom.blazon.migracao.tasks.enrichment.SearchRole;
import bom.blazon.migracao.tasks.extract.rolerightstask.ReadTask;
import bom.blazon.migracao.tasks.loading.CreateTask;
import bom.blazon.migracao.tasks.loading.CreateTaskData;
import bom.blazon.migracao.tasks.loading.CreateUserTask;

public class MigrateRoleRightTasks {
	
	private Connection sourceConn;
	
	private Connection destinationConn;
	
	public MigrateRoleRightTasks(Connection sourceConn, Connection destinationConn) {
		
		this.sourceConn = sourceConn;
		this.destinationConn = destinationConn;
		
	}

	public void migrate() throws Exception {
		
		int page = 0;
		
		int size = 100;
		
		while(true) {
		
			List<Map<String, Object>> sourceData = ReadTask.read(page, size, sourceConn);
			
			sourceData.stream().forEach(new Consumer<Map<String, Object>>() {
	
				@Override
				public void accept(Map<String, Object> data) {
					
					try {
						
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
						
						Long roleId = Long.valueOf(data.get("roleRightEntryRoleId").toString());
						
						Map<String, Object> role = SearchRole.read(roleId, sourceConn);
						
						if(role == null) {
							System.out.println(String.format("Detalhes sobre a role não foi encontrado. TaskId: %s", data.get("id")));
						} else {
							
							addTaskData(taskId, "role",  role.get("name"), destinationConn);
							addTaskData(taskId, "roleIdentifier",  role.get("id"), destinationConn);
							addTaskData(taskId, "roleDescription",  role.get("description"), destinationConn);
							addTaskData(taskId, "justification",  data.get("roleRightEntryJustification"), destinationConn);
							addTaskData(taskId, "action",  data.get("roleRightEntryAction"), destinationConn);
							addTaskData(taskId, "roleRightEntryId",  data.get("roleRightEntry_id"), destinationConn);
							
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			});
			
			destinationConn.commit();
			
			System.out.println("Role Rights Tasks migrated page: " + page);
			
			if(sourceData.size() != 100)
				break;
			
			page = page + size;
		
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
