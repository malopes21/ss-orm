package blazon.script;

import java.util.List;

import blazon.script.helpers.Account;
import blazon.script.helpers.UpdateElasticSearchFields;

public class Main {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		List<Account> accounts = UpdateElasticSearchFields.listAccounts();
		
		int buffer = 10;
		
		for(Account account: accounts) {
			
			String _id = UpdateElasticSearchFields.getES_id(account);
			
			UpdateElasticSearchFields.removePasswordField(_id);
			
			Thread.sleep(10);
			
			UpdateElasticSearchFields.updateUsernameField(_id);
			
			Thread.sleep(10);
			
			buffer++;
			
			if(buffer == 10) {
				
				buffer = 0;
				
				Thread.sleep(100);
			}
		}
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");
		
	}

}
