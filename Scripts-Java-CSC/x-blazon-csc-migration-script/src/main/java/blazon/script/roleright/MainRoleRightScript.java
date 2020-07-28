package blazon.script.roleright;

import blazon.script.roleright.approvaltaskdetail.ImportRoleRightApprovalTaskDetailsService;
import blazon.script.roleright.entry.ImportRoleRightEntriesService;

public class MainRoleRightScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		ImportRoleRightEntriesService.execute();
		
		ImportRoleRightApprovalTaskDetailsService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
