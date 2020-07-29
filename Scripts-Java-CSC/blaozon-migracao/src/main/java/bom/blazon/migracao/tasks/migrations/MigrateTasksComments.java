package bom.blazon.migracao.tasks.migrations;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import bom.blazon.migracao.tasks.extract.ReadTaskComment;
import bom.blazon.migracao.tasks.loading.CreateTaskComment;
import bom.blazon.migracao.tasks.loading.CreateUserTask;

public class MigrateTasksComments {
	
	private Connection sourceConn;
	
	private Connection destinationConn;
	
	public MigrateTasksComments(Connection sourceConn, Connection destinationConn) {
		
		this.sourceConn = sourceConn;
		this.destinationConn = destinationConn;
		
	}

	public void migrate() throws Exception {
		
		int page = 0;

		int size = 500;

		while (true) {
		
			List<Map<String, Object>> sourceData = ReadTaskComment.read(page, size, sourceConn);
			
			sourceData.stream().forEach(new Consumer<Map<String, Object>>() {
	
				@Override
				public void accept(Map<String, Object> data) {
					
					try {
						
						if (data.get("userId") != null) {
	
							Map<String, Object> userTo = new HashMap<>();
	
							userTo.put("directoryIdentifier", data.get("userId"));
							userTo.put("displayName", data.get("displayName"));
							userTo.put("username", data.get("username"));
	
							Long userToId = CreateUserTask.create(userTo, destinationConn);
	
							data.put("user_id", userToId);
	
						}
						
						CreateTaskComment.create(data, destinationConn);
						
					} catch (ClassNotFoundException | SQLException e) {
						
						System.out.println("Não foi possível criar o comentário para: " +  data.get("id"));
						
					}
					
				}
			});
			
			destinationConn.commit();

			System.out.println("Tasks comments migrated page: " + page);

			if (sourceData.size() != 500)
				break;

			page = page + size;
		
		}
				
	}
}