package blazon.script.provisioning.transitionstate;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import blazon.script.util.ImportUtil;

public class ImportProvisioningTransitionStatesService {
	
	
	private final static Logger LOGGER = Logger.getLogger(ImportProvisioningTransitionStatesService.class.getName());
	
	
	public static void main(String[] args) {
		
		long inicio = System.currentTimeMillis();
		
		execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}
	
	
	public static void execute() {
		
		String propertyFileName = "properties/provisioning/importProvisioningTransitionStates.properties";
		
		LOGGER.log(Level.INFO, "Iniciando importação de Provisioning transition states ...");
		
		try {
			
			Integer offset = Integer.parseInt(ImportUtil.getProperty(propertyFileName, "offset"));
			
			Integer limit = Integer.parseInt(ImportUtil.getProperty(propertyFileName, "limit"));
			
			List<Map<String, Object>> rows = ImportProvisioningTransitionStatesFunctions.read(limit, offset);
			
			int total = rows.size();
			
			while(!rows.isEmpty()) {
				
				ImportProvisioningTransitionStatesFunctions.save(rows);
				
				LOGGER.info(String.format("Importados %s registros. Total lido %s. Limit %s, offset %s.", rows.size(), total, limit, offset));
				
				offset = offset + limit;
				
				ImportUtil.setProperty(propertyFileName, "offset", offset.toString());
				
				rows = ImportProvisioningTransitionStatesFunctions.read(limit, offset);
				
				total = total + rows.size();
			}
			
		}catch (Exception e) {
			
			LOGGER.log(Level.ERROR, e.getMessage());

			e.printStackTrace();
		}
		
		LOGGER.info("Finalizado importação de Provisioning transition states!");
	}
	
}
