package blazon.script.certification.entry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import blazon.script.certification.CampaignKey;
import blazon.script.certification.campaign.ImportCertificationCampaigns;
import blazon.script.certification.entry.internalentry.ImportCertificationInternalEntryFunctions;
import blazon.script.util.ConnectionFactory;

class ImportCertificationEntriesFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportCertificationEntriesFunctions.class.getName());

	static List<Map<String, Object>> read(int limit, int offset) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from CertificationEntry \n" + 
					"where 1 = 1 \n"	+ 
					"order by id \n" + 
					"limit %s offset %s ";

		sql = String.format(sql, limit, offset);
		statement = conn.prepareStatement(sql);
		rs = statement.executeQuery();

		while (rs.next()) {

			Map<String, Object> row = new HashMap<>();
			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}

			rows.add(row);
		}

		conn.commit();

		return rows;
	}

	public static void save(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			try {
				
				Long certiticationInternalEntry_id = ImportCertificationInternalEntryFunctions.insertInternalEntry(targetConn, row);
				
				if(certiticationInternalEntry_id == null) {
					
					System.out.println("InternalEntry null, for certificationEntry not imported, id: " + row.get("id"));
					
				} else {
					
					saveCertificationEntry(targetConn, row, certiticationInternalEntry_id);
				}

			} catch (Exception e) {

				LOGGER.log(Level.ERROR, String.format("Erro ao importar certification entry com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveCertificationEntry(Connection conn, Map<String, Object> row, Long certiticationInternalEntry_id) throws SQLException {
		
		CampaignKey campaignKey = new CampaignKey(row.get("entryType").toString(), row.get("resourceId") != null ? (Long) row.get("resourceId") : null );
		
		Long campaignId = ImportCertificationCampaigns.getCampaignMapping().get(campaignKey);
		
		if(campaignId == null) {
			
			throw new RuntimeException("Campaign id not found!");
		}

		PreparedStatement statement = null;

		String sql = "INSERT INTO CertificationEntry \n" + 
				"(id, createdBy, createdByObjectId, creationDate, deadline, entryId, entryType, executionInstanceId, lockDate, lockNumber, processDate, " +
				"status, workflowCertificationId, workflowCertificationName, certificationInternalEntry_id, revokeIfDeadlineReached) \n" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("createdBy") != null) {
			statement.setString(2, "CAMPAIGN");
		} else {
			statement.setObject(2, null);
		}
		if (campaignId != null) {
			statement.setString(3, String.valueOf(campaignId));
		} 
		if (row.get("creationDate") != null) {
			statement.setTimestamp(4, (java.sql.Timestamp) row.get("creationDate"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("deadline") != null) {
			statement.setTimestamp(5, (java.sql.Timestamp) row.get("deadline"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("entryId") != null) {
			statement.setLong(6, (Long) row.get("entryId"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("entryType") != null) {
			statement.setString(7, (String) row.get("entryType"));
		} else {
			statement.setObject(7, null);
		}
		if (campaignId != null) {
			statement.setString(8, String.valueOf(campaignId));
		} 
		if (row.get("lockDate") != null) {
			statement.setTimestamp(9, (java.sql.Timestamp) row.get("lockDate"));
		} else {
			statement.setObject(9, null);
		}
		if (row.get("lockNumber") != null) {
			statement.setLong(10, (Long) row.get("lockNumber"));
		} else {
			statement.setObject(10, null);
		}
		if (row.get("processDate") != null) {
			statement.setTimestamp(11, (java.sql.Timestamp) row.get("processDate"));
		} else {
			statement.setObject(11, null);
		}
		if (row.get("status") != null) {
			statement.setString(12, (String) row.get("status"));
		} else {
			statement.setObject(12, null);
		}
		if (row.get("workflowCertificationId") != null) {
			statement.setLong(13, (Long) row.get("workflowCertificationId"));
		} else {
			statement.setObject(13, null);
		}
		if (row.get("workflowCertificationName") != null) {
			statement.setString(14, (String) row.get("workflowCertificationName"));
		} else {
			statement.setObject(14, null);
		}
		if (certiticationInternalEntry_id != null) {
			statement.setLong(15, certiticationInternalEntry_id);
		} else {
			statement.setObject(15, null);
		}
		if (row.get("revokeIfDeadlineReached") != null) {
			statement.setBoolean(16, (Boolean) row.get("revokeIfDeadlineReached"));
		} else {
			statement.setBoolean(16, false);
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		LOGGER.log(Level.INFO, String.format("Comando SQL emitido para importar certification entry com id %s", row.get("id")));
	}
}
