package blazon.script.reconciliation;

import blazon.script.reconciliation.batch.ImportReconciliationBatchsService;
import blazon.script.reconciliation.entry.ImportReconciliationEntriesService;
import blazon.script.reconciliation.matchentry.ImportReconciliationMatchedEntriesIdsService;
import blazon.script.reconciliation.matchowner.ImportReconciliationMatchedOwnersIdsService;
import blazon.script.reconciliation.transitionstate.ImportReconciliationTransitionStatesService;

public class MainReconciliationScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		ImportReconciliationBatchsService.execute();
		
		ImportReconciliationEntriesService.execute();
		
		ImportReconciliationMatchedEntriesIdsService.execute();
		
		ImportReconciliationMatchedOwnersIdsService.execute();
		
		ImportReconciliationTransitionStatesService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
