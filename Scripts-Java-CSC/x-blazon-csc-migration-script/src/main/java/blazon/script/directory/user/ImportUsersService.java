package blazon.script.directory.user;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import blazon.script.util.ImportUtil;

public class ImportUsersService {
	
	
	private final static Logger LOGGER = Logger.getLogger(ImportUsersService.class.getName());
	
	public static void main(String[] args) {
		
		long inicio = System.currentTimeMillis();
		
		execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}
	

	public static void execute() {
		
		String propertyFile = "properties/directory/importUsers.properties";
		
		LOGGER.log(Level.INFO, "Iniciando importação de Users ...");
		
		try {
			
			Integer offset = Integer.parseInt(ImportUtil.getProperty(propertyFile, "offset"));
			
			Integer limit = Integer.parseInt(ImportUtil.getProperty(propertyFile, "limit"));
			
			List<Map<String, Object>> rows = ImportUsersFunctions.read(limit, offset);
			
			int total = rows.size();
			
			while(!rows.isEmpty()) {
				
				ImportUsersFunctions.save(rows);
				
				LOGGER.info(String.format("Importados %s registros. Total lido %s. Limit %s, offset %s.", rows.size(), total, limit, offset));
				
				offset = offset + limit;
				
				ImportUtil.setProperty(propertyFile, "offset", offset.toString());
				
				rows = ImportUsersFunctions.read(limit, offset);
				
				total = total + rows.size();
			}
			
		}catch (Exception e) {
			
			LOGGER.log(Level.ERROR, e.getMessage());

			e.printStackTrace();
		}
		
		LOGGER.info("Finalizado importação de Users!");
	}
	
}
