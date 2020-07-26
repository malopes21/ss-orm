package blazon.script;

import blazon.script.helpers.UpdateApprovalTasks;
import blazon.script.helpers.UpdateCertificationTasks;

public class Main {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		UpdateApprovalTasks.updateApprovalTasks();
		
		UpdateCertificationTasks.updateCertificationTasks();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");
	}

}
