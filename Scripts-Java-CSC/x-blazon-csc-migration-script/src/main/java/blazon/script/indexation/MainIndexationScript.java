package blazon.script.indexation;

import blazon.script.indexation.directory.account.ImportAccountDirectoryIndexationsService;
import blazon.script.indexation.directory.entitlement.ImportEntitlementDirectoryIndexationsService;
import blazon.script.indexation.directory.resource.ImportResourceDirectoryIndexationsService;
import blazon.script.indexation.directory.role.ImportRoleDirectoryIndexationsService;
import blazon.script.indexation.directory.user.ImportUserDirectoryIndexationsService;

public class MainIndexationScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		ImportRoleDirectoryIndexationsService.execute();
		
		ImportEntitlementDirectoryIndexationsService.execute();
		
		ImportAccountDirectoryIndexationsService.execute();
		
		ImportUserDirectoryIndexationsService.execute();
		
		ImportResourceDirectoryIndexationsService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
