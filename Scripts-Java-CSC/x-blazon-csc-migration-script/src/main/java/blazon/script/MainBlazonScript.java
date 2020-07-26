package blazon.script;

import blazon.script.directory.MainDirectoryScript;
import blazon.script.provisioning.MainProvisioningScript;

public class MainBlazonScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		MainDirectoryScript.main(args);
		
		MainProvisioningScript.main(args);
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
