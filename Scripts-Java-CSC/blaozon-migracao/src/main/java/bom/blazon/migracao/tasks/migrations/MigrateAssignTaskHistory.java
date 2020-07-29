package bom.blazon.migracao.tasks.migrations;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import bom.blazon.migracao.tasks.extract.ReadTaskAssignHistory;
import bom.blazon.migracao.tasks.loading.CreateTaskAssignHistory;
import bom.blazon.migracao.tasks.loading.CreateUserTask;

public class MigrateAssignTaskHistory {
	
	private Connection sourceConn;
	
	private Connection destinationConn;
	
	public MigrateAssignTaskHistory(Connection sourceConn, Connection destinationConn) {
		
		this.sourceConn = sourceConn;
		this.destinationConn = destinationConn;
		
	}

	public void migrate() throws Exception {
		
		int page = 0;

		int size = 500;

		while (true) {
		
			List<Map<String, Object>> sourceData = ReadTaskAssignHistory.read(page, size, sourceConn);
			
			sourceData.stream().forEach(new Consumer<Map<String, Object>>() {
	
				@Override
				public void accept(Map<String, Object> data) {
					
					try {
						
						if (data.get("fromUserId") != null) {
	
							Map<String, Object> userFrom = new HashMap<>();
	
							userFrom.put("directoryIdentifier", data.get("fromUserId"));
							userFrom.put("displayName", data.get("fromUserDisplayName"));
							userFrom.put("username", data.get("fromUserUsername"));
	
							Long userFromId = CreateUserTask.create(userFrom, destinationConn);
	
							data.put("from_id", userFromId);
	
						}
	
						if (data.get("toUserId") != null) {
	
							Map<String, Object> userTo = new HashMap<>();
	
							userTo.put("directoryIdentifier", data.get("toUserId"));
							userTo.put("displayName", data.get("toUserDisplayName"));
							userTo.put("username", data.get("toUserUsername"));
	
							Long userToId = CreateUserTask.create(userTo, destinationConn);
	
							data.put("to_id", userToId);
	
						}
						
						CreateTaskAssignHistory.create(data, destinationConn);
						
					} catch (ClassNotFoundException | SQLException e) {
						
						System.out.println("Não foi possível criar o histórico para: " +  data.get("id"));
						
					}
					
				}
			});
			
			destinationConn.commit();

			System.out.println("Assign Tasks history migrated page: " + page);

			if (sourceData.size() != 500)
				break;

			page = page + size;
		
		}
				
	}
}