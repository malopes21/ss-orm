package bom.blazon.migracao;

import java.sql.Connection;
import java.util.Date;

import bom.blazon.migracao.connection.ConnectionFactory;
import bom.blazon.migracao.imagedatabase.migrations.MigrateBllazonImage;
import bom.blazon.migracao.tasks.migrations.MigrateAssignTaskHistory;
import bom.blazon.migracao.tasks.migrations.MigrateTasksComments;
import bom.blazon.migracao.tasks.migrations.MigrateTasksInQueues;
import bom.blazon.migracao.tasks.migrations.approval.MigrateApprovalTasks;
import bom.blazon.migracao.tasks.migrations.certification.MigrateCertificationTasks;
import bom.blazon.migracao.tasks.migrations.provisioning.MigrateProvisioningTasks;
import bom.blazon.migracao.tasks.migrations.rolerights.MigrateRoleRightTasks;

public class Main {

	public static void main(String[] args) throws Exception {

		//Connection connSource = ConnectionFactory.getConnection("172.33.6.66", "3306", "blazoniam", "blazon", "B!@z0N1d3nt!t!");
		
		Connection connSource = ConnectionFactory.getConnection("127.0.0.1", "3306", "blazoniam", "root", "");

		Connection connDest = ConnectionFactory.getConnection("127.0.0.1", "3306", "blazon", "root", "");

		long t1 = System.currentTimeMillis();

		MigrateBllazonImage migrateBllazonImage = new MigrateBllazonImage(connSource, connDest);

		migrateBllazonImage.migrate();
		
		System.out.println("Inicio Approval Task: " + new Date());

		MigrateApprovalTasks migrateApprovalTasks = new MigrateApprovalTasks(connSource, connDest);
		migrateApprovalTasks.migrate();

		System.out.println("Approval Tasks migrated");
		
		System.out.println("Inicio Certification Task: " + new Date());

		MigrateCertificationTasks migrateCertificationTasks = new MigrateCertificationTasks(connSource, connDest);
		migrateCertificationTasks.migrate();

		System.out.println("Certification Tasks migrated em: " + new Date());
		
		System.out.println("Inicio Provisioning Task: " + new Date());

		MigrateProvisioningTasks migrateProvisioningTasks = new MigrateProvisioningTasks(connSource, connDest);
		migrateProvisioningTasks.migrate();

		System.out.println("Provisioning Tasks migrated em: " + new Date());
		
		System.out.println("Inicio Role Right Task: " + new Date());

		MigrateRoleRightTasks migrateRoleRightTasks = new MigrateRoleRightTasks(connSource, connDest);
		migrateRoleRightTasks.migrate();

		System.out.println("Role Right Tasks migrated em " + new Date());
		
		System.out.println("Inicio Task Comments: " + new Date());

		MigrateTasksComments migrateTasksComments = new MigrateTasksComments(connSource, connDest);
		migrateTasksComments.migrate();

		System.out.println("Tasks comments history migrated em " + new Date());
		
		System.out.println("Inicio Tasks in queue: " + new Date());

		MigrateTasksInQueues migrateTasksInQueues = new MigrateTasksInQueues(connSource, connDest);
		migrateTasksInQueues.migrate();

		System.out.println("Tasks queue migrated em " + new Date());
		
		System.out.println("Inicio Task History: " + new Date());

		MigrateAssignTaskHistory migrateAssignTaskHistory = new MigrateAssignTaskHistory(connSource, connDest);
		migrateAssignTaskHistory.migrate();

		System.out.println("Tasks assign history migrated em " + new Date());

		System.out.println(((System.currentTimeMillis() - t1) / 1000) + " segundos");

	}

}