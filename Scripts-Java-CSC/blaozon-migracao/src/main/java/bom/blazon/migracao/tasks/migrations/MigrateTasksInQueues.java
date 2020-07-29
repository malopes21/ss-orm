package bom.blazon.migracao.tasks.migrations;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import bom.blazon.migracao.tasks.extract.ReadTasksInQueue;
import bom.blazon.migracao.tasks.loading.PutTaskInQueue;

public class MigrateTasksInQueues {
	
	private Connection sourceConn;
	
	private Connection destinationConn;
	
	public MigrateTasksInQueues(Connection sourceConn, Connection destinationConn) {
		
		this.sourceConn = sourceConn;
		this.destinationConn = destinationConn;
		
	}

	public void migrate() throws Exception {
		
		int page = 0;

		int size = 500;

		while (true) {
		
			List<Map<String, Object>> sourceData = ReadTasksInQueue.read(0, 0, sourceConn);
			
			sourceData.stream().forEach(new Consumer<Map<String, Object>>() {
	
				@Override
				public void accept(Map<String, Object> data) {
					
					try {
						
						PutTaskInQueue.create(data, destinationConn);
						
					} catch (ClassNotFoundException | SQLException e) {
						
						System.out.println(String.format("Não foi possível criar a task queue para: %s(TaskQueue_id) - %s (tasks_id)", data.get("TaskQueue_id"), data.get("tasks_id")));
						
					}
					
				}
			});
			
			destinationConn.commit();

			System.out.println("Tasks in queue migrated page: " + page);

			if (sourceData.size() != 500)
				break;

			page = page + size;
		
		}
				
	}
}