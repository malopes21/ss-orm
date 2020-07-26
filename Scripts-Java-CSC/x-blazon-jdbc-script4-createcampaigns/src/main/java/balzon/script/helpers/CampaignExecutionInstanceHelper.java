package balzon.script.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import balzon.script.domain.CampaignDefinition;

public class CampaignExecutionInstanceHelper {

	public static void createCampaignExecutionInstances(List<CampaignDefinition> campaigns) {

		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);
			
			for(CampaignDefinition campaign: campaigns) {

				String sql = " INSERT INTO blazon.CampaignExecutionInstance " + 
						" (date, deadline, finalizeDate, status, campaign_id) " + 
						" VALUES(now(), DATE_ADD(CURDATE(), INTERVAL 10 DAY), null, 'IN_EXECUTION', ?) ";	
				
				statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				statement.setLong(1, campaign.getId());
				
				int affectedRows = statement.executeUpdate();

		        if (affectedRows == 0) {
		            throw new RuntimeException("Creating campaign instance failed, no rows affected.");
		        }
		        
		        Long campaignExecutionInstanceId = null;

		        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		            if (generatedKeys.next()) {
		            	
		            	campaignExecutionInstanceId = generatedKeys.getLong(1);
		            }
		            else {
		                throw new RuntimeException("Creating campaign instance failed, no ID obtained.");
		            }
		        }
		        
		        statement.close();
		        
		        List<Long> certificationEntryIds = getCertificationEntryIdsByPolicy(campaign.getPolicyId());
		        
		        for(Long certificationEntryId: certificationEntryIds) {
		        	
					sql = " INSERT INTO blazon.CampaignExecutionInstance_CertificationEntry " + 
						" (CampaignExecutionInstance_id, certificationEntries_id) " + 
						" VALUES(?, ?) ";				
					statement = conn.prepareStatement(sql);
					statement.setLong(1, campaignExecutionInstanceId);
					statement.setLong(2, certificationEntryId);
					
					affectedRows = statement.executeUpdate();
					
					if (affectedRows == 0) {
					    throw new RuntimeException("Creating relation failed, no rows affected.");
					}
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
	}

	private static List<Long> getCertificationEntryIdsByPolicy(Long policyId) {
		
		List<Long> entriesIds = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);

			String sql = " select entry.id as id " + 
					" from CertificationEntry entry " + 
					" where entry.policy_id = ? ";
			
			statement = conn.prepareStatement(sql);
			statement.setLong(1, policyId);

			rs = statement.executeQuery();
			
			while(rs.next()) {
				
				entriesIds.add(rs.getLong("id"));
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
		
		return entriesIds;
	}

}
