package balzon.script.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import balzon.script.domain.CampaignDefinition;
import balzon.script.domain.CertificationPolicy;

public class CampaignDefinitionHelper {

	public static List<CampaignDefinition> createCampaigns(List<CertificationPolicy> policies) {

		List<CampaignDefinition> campaigns = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			for(CertificationPolicy policy: policies) {

				String sql = " INSERT INTO blazon.CampaignDefinition " + 
						" (name, description, enabled, lastExecution, type, sla) " + 
						" VALUES(?, ?, true, null, 'RECURRENT', 30) ";
				
				statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				statement.setString(1, policy.getName());
				statement.setString(2, policy.getDescription());
				
				int affectedRows = statement.executeUpdate();

		        if (affectedRows == 0) {
		            throw new RuntimeException("Creating campaign failed, no rows affected.");
		        }
		        
		        CampaignDefinition campaign = new CampaignDefinition();

		        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		            if (generatedKeys.next()) {
		            	
		            	
		            	campaign.setId(generatedKeys.getLong(1));
		            	campaign.setName(policy.getName());
		            	campaign.setDescription(policy.getDescription());
		            	campaign.setPolicyId(policy.getId());
		            	
		            	campaigns.add(campaign);
		            }
		            else {
		                throw new RuntimeException("Creating campaign failed, no ID obtained.");
		            }
		        }
		        
		        statement.close();
				
		        sql = " INSERT INTO blazon.CampaignDefinition_CertificationPolicy " + 
		        		" (CampaignDefinition_id, policies_id) " + 
		        		" VALUES(?, ?) ";				
				statement = conn.prepareStatement(sql);
				statement.setLong(1, campaign.getId());
				statement.setLong(2, policy.getId());
				
				affectedRows = statement.executeUpdate();

		        if (affectedRows == 0) {
		            throw new RuntimeException("Creating campaign failed, no rows affected.");
		        }
				
			}
			
			conn.commit();
			
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
		
		return campaigns;
	}

}
