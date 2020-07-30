package blazon.script.directory;

import blazon.script.directory.account.ImportAccountsService;
import blazon.script.directory.entitlement.ImportEntitlementsService;
import blazon.script.directory.membershipentitlement.ImportMembershipEntitlementsService;
import blazon.script.directory.membershiprole.ImportMembershipRolesService;
import blazon.script.directory.resource.ImportResourcesService;
import blazon.script.directory.resource.dependencies.ImportResourceProvisioningProfilesService;
import blazon.script.directory.right.ImportRoleRightsService;
import blazon.script.directory.role.ImportRolesService;
import blazon.script.directory.user.ImportUsersService;

public class MainDirectoryScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		ImportUsersService.execute();
		
		ImportRolesService.execute();
		
		//ImportResourceCategoriesService.execute(); 
		ImportResourcesService.execute();
		ImportResourceProvisioningProfilesService.execute();
		
		ImportEntitlementsService.execute();
		
		ImportAccountsService.execute();
		
		ImportMembershipEntitlementsService.execute();
		
		ImportMembershipRolesService.execute();
		
		ImportRoleRightsService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
