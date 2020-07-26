package blazon.script;

import blazon.script.requests.helpers.Script01_CreateTemporaryTableService;
import blazon.script.requests.helpers.Script02_ExecuteDefaultDatabaseScripts;
import blazon.script.requests.helpers.Script03_CreateDirectoryEntries;

public class MainBlazonRequestScript {

	public static void main(String[] args) throws Exception {
		
		long inicio = System.currentTimeMillis();
		
		//Criar tabela BlazonRequestTemp e copiar os atributos accountId, entitlementId, roleId, resourceId, beneficiary_id, requester_id, membershipId;
		
		Script01_CreateTemporaryTableService.execute();
		
		//Executa os scripts SQL: "drop foreign keys", "drop columns", "add columns", "create tables"
		
		Script02_ExecuteDefaultDatabaseScripts.execute();
		
		//Ler a tabela BlazonRequestTemp e para cada linhas criar os registros de BlazonRequestDirectoryEntry e atualizar a tabela de BlazonRequest com os ids gerados
		
		Script03_CreateDirectoryEntries.execute();
		
		//Deletar a tabela BlazonRequestTemp ???? talvez deletar depois na mão mesmo
		
		System.out.println("TERMINOU! Tempo consumido: " + (System.currentTimeMillis() - inicio) + " ms");	
	}

}
