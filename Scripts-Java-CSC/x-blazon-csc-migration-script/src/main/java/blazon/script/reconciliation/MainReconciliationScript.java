package blazon.script.reconciliation;

import blazon.script.reconciliation.batch.ImportReconciliationBatchsService;
import blazon.script.reconciliation.entry.ImportReconciliationEntriesService;
import blazon.script.reconciliation.transitionstate.ImportReconciliationTransitionStatesService;

public class MainReconciliationScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		ImportReconciliationBatchsService.execute();
		
		ImportReconciliationEntriesService.execute();
		
		// ReconciliationEntry_matchedEntriesIds |
		// ReconciliationEntry_matchedOwnersIds  |
		
		ImportReconciliationTransitionStatesService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
