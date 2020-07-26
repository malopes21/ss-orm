package blazon.script.helpers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONObject;

public class UpdateElasticSearchFields {

	public static List<Account> listAccounts() throws Exception {
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			int page = 0;
			
			int size = 5;

			String sql = "select id, accountIdentifier from Account limit ? offset ? ";
			
			List<Account> accounts = new ArrayList<Account>();
			
			int count = 0;
			
			do {
				
				count = 0;
				
				statement = conn.prepareStatement(sql);
				statement.setInt(1, size);
				statement.setInt(2, page * size);
	
				rs = statement.executeQuery();
				
				while(rs.next()) {
					
					Long accountId = rs.getLong("id");
					String accountIdentifier = rs.getString("accountIdentifier");
					Account account = new Account();
					account.setId(accountId);
					account.setAccountIdentifier(accountIdentifier);
					accounts.add(account);
					count++;
				}
				
				page++;
			
			} while(size == count);
			
			return accounts;
			
		} catch (Exception e) {
			
			e.printStackTrace();

			try {
				
				if(conn != null && !conn.isClosed()) {
					conn.rollback();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}finally {
			
			try {

				if (rs != null) rs.close();
				if (statement != null) statement.close();
				if (conn != null) conn.close();

			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		
		return null;
	}

	public static void removePasswordField(String _id) throws ClientProtocolException, IOException {

		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost postRequest = new HttpPost(
			"http://localhost:9200/entries/entries/"+_id+"/_update");

		StringEntity input = new StringEntity("{\n" + 
				"  \"script\": {\n" + 
				"    \"source\": \"ctx._source.fields.removeIf(field -> field.name == params.field_name)\",\n" + 
				"    \"params\": {\n" + 
				"      \"field_name\": \"password\"\n" + 
				"    }\n" + 
				"  }\n" + 
				"}");
		input.setContentType("application/json");
		postRequest.setEntity(input);

		HttpResponse response = httpClient.execute(postRequest);

		if (response.getStatusLine().getStatusCode() != 200 && response.getStatusLine().getStatusCode() != 201) {
			throw new RuntimeException("Failed : HTTP error code : "
				+ response.getStatusLine().getStatusCode());
		}
	}

	public static void updateUsernameField(String _id) throws Exception {
		
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost postRequest = new HttpPost(
			"http://localhost:9200/entries/entries/"+_id+"/_update");

		StringEntity input = new StringEntity("{\n" + 
				"  \"script\": {\n" + 
				"    \"source\": \"def targets = ctx._source.fields.findAll(field -> field.name == params.current_name); for(field in targets) { field.name = params.name }\",\n" + 
				"    \"params\": {\n" + 
				"      \"current_name\": \"username\",\n" + 
				"      \"name\": \"accountIdentifier\"\n" + 
				"    }\n" + 
				"  }\n" + 
				"}");
		
		input.setContentType("application/json");
		postRequest.setEntity(input);

		HttpResponse response = httpClient.execute(postRequest);

		if (response.getStatusLine().getStatusCode() != 200 && response.getStatusLine().getStatusCode() != 201) {
			throw new RuntimeException("Failed : HTTP error code : "
				+ response.getStatusLine().getStatusCode());
		}
	}
	
	public static String getES_id(Account account) throws ClientProtocolException, IOException {
		
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost postRequest = new HttpPost(
			"http://localhost:9200/entries/entries/_search");

		StringEntity input = new StringEntity("{\n" + 
				"	\"query\": { \n" + 
				"	   \"bool\":{ \n" + 
				"		  \"must\":[ \n" + 
				"		     { \n" + 
				"		        \"match\":{ \n" + 
				"		           \"identifier\": " + account.getId() +" \n" + 
				"		        }\n" + 
				"		     },\n" + 
				"		     { \n" + 
				"		        \"match\":{ \n" + 
				"		           \"schema\":\"ACCOUNT\"\n" + 
				"		        }\n" + 
				"		     }\n" + 
				"		  ]\n" + 
				"	   }\n" + 
				"	}\n" + 
				"}");
		input.setContentType("application/json");
		postRequest.setEntity(input);

		HttpResponse response = httpClient.execute(postRequest);

		if (response.getStatusLine().getStatusCode() != 200 && response.getStatusLine().getStatusCode() != 201) {
			throw new RuntimeException("Failed : HTTP error code : "
				+ response.getStatusLine().getStatusCode());
		}

		BufferedReader br = new BufferedReader(
                        new InputStreamReader((response.getEntity().getContent())));

		StringBuilder stringBuilder = new StringBuilder();
		
		String output;
		while ((output = br.readLine()) != null) {
			stringBuilder.append(output);
		}

		httpClient.getConnectionManager().shutdown();
		
		JSONObject root = new JSONObject(stringBuilder.toString());
		
		JSONObject externalHits = root.getJSONObject("hits");
		
		JSONArray internalHits = externalHits.getJSONArray("hits");
		
		if(internalHits.length() == 0) {
			
			return null;
		}
		
		JSONObject result = (JSONObject) internalHits.getJSONObject(0);
		
		String _id = result.getString("_id");
		
		return _id;
	}
	
	public static void main(String[] args) throws Exception {
		
		Account account = new Account();
		account.setId(21L);
		String _id = getES_id(account);
		updateUsernameField(_id);
		System.out.println("OK");
	}
	
}
