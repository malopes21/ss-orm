package balzon.script.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import balzon.script.domain.CertificationPolicy;

public class CertificationPolicyHelper {


	public static List<CertificationPolicy> getExistentPolicies() {
		
		List<CertificationPolicy> policies = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionFactory.getConnection();

			conn.setAutoCommit(false);

			String sql = " select policy.id as id, policy.name as name, policy.description as description" + 
					" from CertificationEntry entry " + 
					" join CertificationPolicy policy on policy.id = entry.policy_id " + 
					" group by policy.id ";
			
			statement = conn.prepareStatement(sql);

			rs = statement.executeQuery();
			
			while(rs.next()) {
				
				CertificationPolicy policy = new CertificationPolicy();
				policy.setId(rs.getLong("id"));
				policy.setName(rs.getString("name"));
				policy.setDescription(rs.getString("description"));
				policies.add(policy);
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
		
		return policies;
	}

}
