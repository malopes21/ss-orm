package blazon.script.provisioning;

import blazon.script.provisioning.entry.ImportProvisioningEntriesService;
import blazon.script.provisioning.taskdetail.ImportProvisioningTaskDetailsService;
import blazon.script.provisioning.transitionstate.ImportProvisioningTransitionStatesService;

public class MainProvisioningScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		//ImportResourceAdaptersService.execute();
		
		ImportProvisioningEntriesService.execute();
		
		ImportProvisioningTransitionStatesService.execute();
		
		ImportProvisioningTaskDetailsService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
