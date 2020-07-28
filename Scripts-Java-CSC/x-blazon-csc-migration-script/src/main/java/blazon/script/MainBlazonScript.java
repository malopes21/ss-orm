package blazon.script;

import blazon.script.certification.MainCertificationScript;
import blazon.script.directory.MainDirectoryScript;
import blazon.script.indexation.MainIndexationScript;
import blazon.script.provisioning.MainProvisioningScript;
import blazon.script.reconciliation.MainReconciliationScript;
import blazon.script.request.MainRequestScript;
import blazon.script.roleright.MainRoleRightScript;

public class MainBlazonScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		MainDirectoryScript.main(args);
		
		MainProvisioningScript.main(args);
		
		MainReconciliationScript.main(args);
		
		MainRequestScript.main(args);
		
		MainCertificationScript.main(args);
		
		MainRoleRightScript.main(args);
		
		MainIndexationScript.main(args);
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
