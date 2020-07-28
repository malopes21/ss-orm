package blazon.script.indexation;

import blazon.script.indexation.directory.role.ImportRoleDirectoryIndexationsService;

public class MainIndexationScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		ImportRoleDirectoryIndexationsService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
