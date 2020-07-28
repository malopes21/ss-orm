package blazon.script.certification;

import blazon.script.certification.approvaltaskdetail.ImportCertificationApprovalTaskDetailsService;
import blazon.script.certification.campaign.ImportCertificationCampaigns;
import blazon.script.certification.entry.ImportCertificationEntriesService;
import blazon.script.certification.transitionstate.ImportCertificationTransitionStatesService;

public class MainCertificationScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		ImportCertificationCampaigns.execute();
		
		ImportCertificationEntriesService.execute();
		
		ImportCertificationApprovalTaskDetailsService.execute();
		
		ImportCertificationTransitionStatesService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
