package blazon.script.reconciliation;

import blazon.script.reconciliation.batch.ImportReconciliationBatchsService;
import blazon.script.reconciliation.entry.ImportReconciliationEntriesService;
import blazon.script.reconciliation.transitionstate.ImportReconciliationTransitionStatesService;

public class MainReconciliationScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		//ImportReconciliationActionsService.execute();
		
		ImportReconciliationBatchsService.execute();
		
		ImportReconciliationEntriesService.execute();
		
		//ReconciliationDirectoryEntry
		// ReconciliationBatchEntry
		//ReconciliationEntry
		
		//| ReconciliationEntry_matchedEntriesIds |
		// ReconciliationEntry_matchedOwnersIds  |
		
		ImportReconciliationTransitionStatesService.execute();
		
		//ReconciliationEntryTransitionState
		
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
