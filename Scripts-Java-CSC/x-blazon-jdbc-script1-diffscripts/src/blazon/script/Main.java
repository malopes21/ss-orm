package blazon.script;

import blazon.script.helpers.UpdateEntriesCreatedByReconciliation;
import blazon.script.helpers.UpdateEntriesCreatedByRequest;
import blazon.script.helpers.UpdateRequestPayloads;

public class Main {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		UpdateEntriesCreatedByRequest.updateEntriesCreatedByRequest();
		
		UpdateEntriesCreatedByReconciliation.updateEntriesCreatedByReconciliation();
		
		UpdateRequestPayloads.updateRequestPayloads();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");
	}

}
