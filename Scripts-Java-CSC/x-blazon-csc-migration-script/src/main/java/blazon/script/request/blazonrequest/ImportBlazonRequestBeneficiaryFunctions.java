package blazon.script.request.blazonrequest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

class ImportBlazonRequestBeneficiaryFunctions {

	static Long insertBeneficiary(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("beneficiary_id") == null) {
			
			return null;
		}
		
		Map<String, Object> beneficiaryData = readBeneficiary((Long) row.get("beneficiary_id"));
		
		PreparedStatement statement = null;
		
		String sql = "insert into BlazonRequestDirectoryEntry (type, username, displayName, directoryIdentifier) values (?, ?, ?, ?) ";
		
		statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setString(1, (String) "USER");
		statement.setString(2, (String) beneficiaryData.get("username"));
		statement.setString(3, (String) beneficiaryData.get("displayName"));
		statement.setLong(4, (Long) beneficiaryData.get("id"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
		
		Long beneficiaryProvisioningEntryId = null;

		try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
		    if (generatedKeys.next()) {
		    	
		    	beneficiaryProvisioningEntryId = generatedKeys.getLong(1);
		    }
		    else {
		        throw new RuntimeException("Creating instance failed, no ID obtained.");
		    }
		}
		
		return beneficiaryProvisioningEntryId;
	}
	
	
	static Map<String, Object> readBeneficiary(Long beneficiaryId) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from User where id = ?";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, beneficiaryId);
		
		rs = statement.executeQuery();
		
		Map<String, Object> row = new HashMap<>();
		
		if(rs.next()) {
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
		}
		
		conn.commit();
		conn.close();
		
		return row;
	}

}
