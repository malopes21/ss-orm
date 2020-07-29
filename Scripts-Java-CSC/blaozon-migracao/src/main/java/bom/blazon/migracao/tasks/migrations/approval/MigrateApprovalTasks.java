package bom.blazon.migracao.tasks.migrations.approval;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import bom.blazon.migracao.tasks.extract.approvaltask.ReadTask;

public class MigrateApprovalTasks {

	private Connection sourceConn;

	private Connection destinationConn;

	public MigrateApprovalTasks(Connection sourceConn, Connection destinationConn) {

		this.sourceConn = sourceConn;
		this.destinationConn = destinationConn;

	}

	public void migrate() throws Exception {

		int page = 0;

		int size = 500;

		while (true) {

			final List<Map<String, Object>> sourceData = ReadTask.read(page, size, sourceConn);

			sourceData.stream().forEach(new Consumer<Map<String, Object>>() {

				@Override
				public void accept(Map<String, Object> data) {

					try {

						if (data.get("requestType").equals("CREATE_ACCOUNT")) {
							MigrateCreateAccountApprovalTask.create(data, sourceConn, destinationConn);
						}

						if (data.get("requestType").equals("ASSIGN_ROLE")) {
							MigrateAssignRoleApprovalTask.create(data, sourceConn, destinationConn);
						}

						if (data.get("requestType").equals("ASSIGN_ENTITLEMENT")) {
							MigrateAssignEntitlementApprovalTask.create(data, sourceConn, destinationConn);
						}

					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}

				}
			});

			destinationConn.commit();

			System.out.println("Approval Tasks migrated page: " + page);

			if (sourceData.size() != 500)
				break;

			page = page + size;

		}

	}
}