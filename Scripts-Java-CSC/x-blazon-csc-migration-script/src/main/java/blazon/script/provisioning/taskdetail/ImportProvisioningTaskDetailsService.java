package blazon.script.provisioning.taskdetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import blazon.script.util.ConnectionFactory;

public class ImportProvisioningTaskDetailsService {
	
	
	private final static Logger LOGGER = Logger.getLogger(ImportProvisioningTaskDetailsService.class.getName());
	
	
	public static void main(String[] args) {
		
		long inicio = System.currentTimeMillis();
		
		execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}
	

	public static void execute() {
		
		LOGGER.log(Level.INFO, "Iniciando importação de Provisioning Task Details ...");
		
		try {
			
			createImportValidationField();
			
			int limit = 100;
			
			List<Map<String, Object>> rows = ImportProvisioningTaskDetailsFunctions.readSourceProvisioningTaskDetails(limit);
			
			int total = rows.size();
			
			if(rows.size() > 0) {
				
				LOGGER.info(String.format("Lido %s registros, do id %s até id %s. Total lido %s", rows.size(), rows.get(0).get("id"), rows.get(rows.size()-1).get("id"), total));
			}
			
			while(!rows.isEmpty()) {
				
				ImportProvisioningTaskDetailsFunctions.saveTargetProvisioningTaskDetails(rows);
				
				rows = ImportProvisioningTaskDetailsFunctions.readSourceProvisioningTaskDetails(limit);
				
				total = total + rows.size();
				
				if(rows.size() > 0) {
					
					LOGGER.info(String.format("Lido %s registros, do id %s até id %s. Total lido %s", rows.size(), rows.get(0).get("id"), rows.get(rows.size()-1).get("id"), total));
				}
			}
			
			//deleteImportValidationField();
			
		}catch (Exception e) {
			
			LOGGER.log(Level.SEVERE, e.getMessage());

			e.printStackTrace();
		}
		
		LOGGER.info("Finalizado importação de Provisioning Task Details!");
	}
	

	private static void createImportValidationField() throws Exception {
		
		try {

			Connection conn = ConnectionFactory.getSourceConnection();
			PreparedStatement statement = null;
			
			String sql = "alter table ProvisioningTaskDetail add column _imported_ int default 0";
	
			conn = ConnectionFactory.getSourceConnection();
	
			conn.setAutoCommit(false);
			
			statement = conn.prepareStatement(sql);
			
			statement.executeUpdate();
			
			conn.commit();
			
			LOGGER.info("Campo de validação criado ...");
			
		} catch (Exception e) {
			
			LOGGER.info("Campo de validação provavelmente já criado!");
		}
	}
	
	
	private static void deleteImportValidationField() throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		
		String sql = "alter table ProvisioningTaskDetail drop column _imported_";

		conn = ConnectionFactory.getSourceConnection();

		conn.setAutoCommit(false);
		
		statement = conn.prepareStatement(sql);
		
		statement.executeUpdate();
		
		conn.commit();
		
		LOGGER.info("Campo de validação removido ...");
	}
}
