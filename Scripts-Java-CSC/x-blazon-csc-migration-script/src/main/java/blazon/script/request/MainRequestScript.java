package blazon.script.request;

import blazon.script.request.approvaltaskdetails.ImportBlazonRequestApprovalTaskDetailsService;
import blazon.script.request.blazonrequest.ImportBlazonRequestsService;
import blazon.script.request.transtionstate.ImportBlazonRequestTransitionStatesService;

public class MainRequestScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		ImportBlazonRequestsService.execute();
		
		ImportBlazonRequestApprovalTaskDetailsService.execute();
		
		ImportBlazonRequestTransitionStatesService.execute();
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
