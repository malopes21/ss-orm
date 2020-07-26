package balzon.script;

import java.util.List;

import balzon.script.domain.CampaignDefinition;
import balzon.script.domain.CertificationPolicy;
import balzon.script.helpers.CampaignDefinitionHelper;
import balzon.script.helpers.CampaignExecutionInstanceHelper;
import balzon.script.helpers.CertificationPolicyHelper;

public class Main {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		List<CertificationPolicy> policies = CertificationPolicyHelper.getExistentPolicies();
		
		System.out.println(policies);
		
		List<CampaignDefinition> campaigns = CampaignDefinitionHelper.createCampaigns(policies);
		
		System.out.println(campaigns);
		
		CampaignExecutionInstanceHelper.createCampaignExecutionInstances(campaigns);
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");
	}

}
