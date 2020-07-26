package blazon.script.reconciliation.batch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import blazon.script.util.ConnectionFactory;

public class ImportReconciliationBatchsService {
	
	
	private final static Logger LOGGER = Logger.getLogger(ImportReconciliationBatchsService.class.getName());
	
	
	public static void main(String[] args) {
		
		long inicio = System.currentTimeMillis();
		
		execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}
	

	public static void execute() {
		
		LOGGER.log(Level.INFO, "Iniciando importação de Reconciliation Batchs ...");
		
		try {
			
			clearReconciliatioBatchs();
			
			int limit = 100;
			
			int offset = 0;
			
			List<Map<String, Object>> rows = ImportReconciliationBatchsFunctions.readSourceReconciliationBatchs(limit, offset);
			
			int total = rows.size();
			
			if(rows.size() > 0) {
				
				LOGGER.info(String.format("Lido %s registros, do id %s até id %s. Total lido %s", rows.size(), rows.get(0).get("id"), rows.get(rows.size()-1).get("id"), total));
			}
			
			while(!rows.isEmpty()) {
				
				ImportReconciliationBatchsFunctions.saveTargetReconciliationBatchs(rows);
				
				offset = offset + limit;
				
				rows = ImportReconciliationBatchsFunctions.readSourceReconciliationBatchs(limit, offset);
				
				total = total + rows.size();
				
				if(rows.size() > 0) {
					
					LOGGER.info(String.format("Lido %s registros, do id %s até id %s. Total lido %s", rows.size(), rows.get(0).get("id"), rows.get(rows.size()-1).get("id"), total));
				}
			}
			
		}catch (Exception e) {
			
			LOGGER.log(Level.SEVERE, e.getMessage());

			e.printStackTrace();
		}
		
		LOGGER.info("Finalizado importação de Reconciliation Batchs!");
	}
	

	private static void clearReconciliatioBatchs() throws Exception {
		
		Connection conn = ConnectionFactory.getTargetConnection();
		PreparedStatement statement = null;
		
		String sql = "delete from ReconciliationBatchEntry";

		conn.setAutoCommit(false);
		
		statement = conn.prepareStatement(sql);
		
		statement.executeUpdate();
		
		conn.commit();
		
		LOGGER.info("Tabela de reconciliation batchs limpa ...");
	}
	
}
