package bom.blazon.migracao.tasks.migrations.provisioning;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import bom.blazon.migracao.tasks.enrichment.SearchAccount;
import bom.blazon.migracao.tasks.enrichment.SearchEntitlement;
import bom.blazon.migracao.tasks.enrichment.SearchMembershipEntitlement;
import bom.blazon.migracao.tasks.enrichment.SearchResource;
import bom.blazon.migracao.tasks.loading.CreateTask;
import bom.blazon.migracao.tasks.loading.CreateTaskData;
import bom.blazon.migracao.tasks.loading.CreateUserTask;

public class MigrateProvisioningGrantEntitlementTask {
	
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
		
		Long membershipEntitlementId = Long.valueOf(data.get("provisioningEntryTargetId").toString());
		
		Map<String, Object> membershipEntitlement = SearchMembershipEntitlement.read(membershipEntitlementId, sourceConn);
		
		if(membershipEntitlement == null) {
			System.out.println(String.format("Detalhes sobre o membershipentitlement não foram encontrados. TaskId: %s", data.get("id")));
		} else {
			
			Long resourceId = Long.valueOf(data.get("provisioningEntryResourceId").toString());
			
			Long entitlementId = Long.valueOf(membershipEntitlement.get("entitlement_id").toString());
			
			Long accountId = Long.valueOf(membershipEntitlement.get("account_id").toString());
			
			Map<String, Object> account = SearchAccount.read(accountId, sourceConn);
			
			Map<String, Object> resource = SearchResource.read(resourceId, sourceConn);
			
			Map<String, Object> entitlement = SearchEntitlement.read(entitlementId, sourceConn);
			
			if(account == null || resource == null || entitlement == null) {
				System.out.println(String.format("Detalhes sobre o resource, account ou entitlement não foram encontrados. TaskId: %s", data.get("id")));
			} else {
				
				addTaskData(taskId, "resource",  "resource", destinationConn);
				addTaskData(taskId, "resourceIdentifier",  "resourceIdentifier", destinationConn);
				addTaskData(taskId, "resourceDescription",  "resourceDescription", destinationConn);
				addTaskData(taskId, "entitlement",  "entitlement", destinationConn);
				addTaskData(taskId, "entitlementIdentifier",  "entitlementIdentifier", destinationConn);
				addTaskData(taskId, "entitlementDescription",  "entitlementDescription", destinationConn);
				addTaskData(taskId, "accountId",  "accountId", destinationConn);
				addTaskData(taskId, "accountIdentifier",  "accountIdentifier", destinationConn);
				addTaskData(taskId, "type", "GRANT_ENTITLEMENT", destinationConn);
				
			}
			
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