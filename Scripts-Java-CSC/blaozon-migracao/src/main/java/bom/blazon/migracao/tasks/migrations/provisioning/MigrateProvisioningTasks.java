package bom.blazon.migracao.tasks.migrations.provisioning;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import bom.blazon.migracao.tasks.extract.provisioningtask.ReadTask;

public class MigrateProvisioningTasks {

	private Connection sourceConn;

	private Connection destinationConn;

	public MigrateProvisioningTasks(Connection sourceConn, Connection destinationConn) {

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
	
						if (data.get("provisioningEntryEntryType").equals("ACTIVATE_ACCOUNT")) {
							MigrateProvisioningActivateAccountTask.create(data, sourceConn, destinationConn);
						}
	
						if (data.get("provisioningEntryEntryType").equals("INACTIVATE_ACCOUNT")) {
							MigrateProvisioningInactivateAccountTask.create(data, sourceConn, destinationConn);
						}
	
						if (data.get("provisioningEntryEntryType").equals("CREATE_ACCOUNT")) {
							MigrateProvisioningCreateAccountTask.create(data, sourceConn, destinationConn);
						}
	
						if (data.get("provisioningEntryEntryType").equals("UPDATE_ACCOUNT")) {
							MigrateProvisioningUpdateAccountTask.create(data, sourceConn, destinationConn);
						}
	
						if (data.get("provisioningEntryEntryType").equals("REMOVE_ACCOUNT")) {
							MigrateProvisioningRevokeAccountTask.create(data, sourceConn, destinationConn);
						}
	
						if (data.get("provisioningEntryEntryType").equals("GRANT_ENTITLEMENT")) {
							MigrateProvisioningGrantEntitlementTask.create(data, sourceConn, destinationConn);
						}
	
						if (data.get("provisioningEntryEntryType").equals("REVOKE_ENTITLEMENT")) {
							MigrateProvisioningRevokeEntitlementTask.create(data, sourceConn, destinationConn);
						}
	
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
	
				}
			});
			
			destinationConn.commit();
			
			System.out.println("Provisioning Tasks migrated page: " + page);
			
			if(sourceData.size() != 100)
				break;
			
			page = page + size;
		
		}

	}

}
