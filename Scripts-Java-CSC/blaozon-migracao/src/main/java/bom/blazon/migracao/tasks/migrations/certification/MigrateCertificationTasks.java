package bom.blazon.migracao.tasks.migrations.certification;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import bom.blazon.migracao.tasks.extract.certificationtask.ReadTask;

public class MigrateCertificationTasks {

	private Connection sourceConn;

	private Connection destinationConn;

	public MigrateCertificationTasks(Connection sourceConn, Connection destinationConn) {

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
	
						if (data.get("entryType").equals("ACCOUNT")) {
							MigrateCertificateAccountTask.create(data, sourceConn, destinationConn);
						}
	
						if (data.get("entryType").equals("MEMBERSHIP_ENTITLEMENT")) {
							MigrateCertificateMembershipEntitlementTask.create(data, sourceConn, destinationConn);
						}
	
						if (data.get("entryType").equals("MEMBERSHIP_ROLE")) {
							MigrateCertificateMembershipRoleTask.create(data, sourceConn, destinationConn);
						}
	
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
			});
			
			destinationConn.commit();
			
			System.out.println("Certification Tasks migrated page: " + page);
			
			if(sourceData.size() != 100)
				break;
			
			page = page + size;
		
		}

	}

}
