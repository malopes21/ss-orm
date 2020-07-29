package blazon.script.reconciliation.batch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

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
			
			List<Map<String, Object>> rows = ImportReconciliationBatchsFunctions.read(limit, offset);
			
			int total = rows.size();
			
			while(!rows.isEmpty()) {
				
				ImportReconciliationBatchsFunctions.save(rows);
				
				LOGGER.info(String.format("Importados %s registros. Total lido %s. Limit %s, offset %s.", rows.size(), total, limit, offset));
				
				offset = offset + limit;
				
				rows = ImportReconciliationBatchsFunctions.read(limit, offset);
				
				total = total + rows.size();
			}
			
		}catch (Exception e) {
			
			LOGGER.log(Level.ERROR, e.getMessage());

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
