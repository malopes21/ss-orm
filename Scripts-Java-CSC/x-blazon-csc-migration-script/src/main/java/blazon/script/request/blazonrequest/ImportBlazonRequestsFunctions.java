package blazon.script.request.blazonrequest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import blazon.script.request.blazonrequest.internalentry.ImportBlazonRequestBeneficiaryFunctions;
import blazon.script.request.blazonrequest.internalentry.ImportBlazonRequestInternalEntryFunctions;
import blazon.script.request.blazonrequest.internalentry.ImportBlazonRequestRequesterFunctions;
import blazon.script.util.ConnectionFactory;

class ImportBlazonRequestsFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportBlazonRequestsFunctions.class.getName());

	static List<Map<String, Object>> read(int limit, int offset) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from BlazonRequest \n" + 
					"where type <> 'MULTIPLE_REQUESTS' \n" + 
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

				Long beneficiary_id = ImportBlazonRequestBeneficiaryFunctions.insertBeneficiary(targetConn, row);
				
				if(beneficiary_id == null) {
					LOGGER.log(Level.WARN, "beneficiary_id null, not imported blazon request: " + row.get("id"));
					continue;
				}

				Long requester_id = ImportBlazonRequestRequesterFunctions.insertRequester(targetConn, row);
				
				if(requester_id == null) {
					LOGGER.log(Level.WARN, "requester_id null, not imported blazon request: " + row.get("id"));
					continue;
				}

				Long requestInternalEntry_id = ImportBlazonRequestInternalEntryFunctions.insertInternalEntry(targetConn, row);
				
				if(requestInternalEntry_id == null) {
					LOGGER.log(Level.WARN, "InternalEntry null, not imported blazon request: " + row.get("id"));
					continue;
				} 
					
				saveBlazonRequest(targetConn, row, beneficiary_id, requester_id, requestInternalEntry_id);

			} catch (Exception e) {

				LOGGER.log(Level.ERROR, String.format("Erro ao importar blazon request com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveBlazonRequest(Connection conn, Map<String, Object> row, Long beneficiary_id,
			Long requester_id, Long requestInternalEntry_id) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO BlazonRequest \n"
				+ "(id, "
				+ " approvalFinishedAt, "
				+ " approvalPolicy_id, "
				+ " approvalProcess, "
				+ " approvalStartedAt, "
				+ " approvalWorkflowId, "
				+ " createDate, "
				+ " createdBy, "
				+ " createdByObjectId, "
				+ " dependenciesVerifiedAt, "
				+ " effectiveDate, "
				+ " finalizeDate, "
				+ " generatedBySystem, "
				+ " justification, "
				+ " lockDate, "
				+ " lockNumber, "
				+ " needApproval, "
				+ " payload, "
				+ " payloadWithItemThatViolatesSodPolicy, "
				+ " provisioningEntryId, "
				+ " provisioningFinishedAt, "
				+ " provisioningStartedAt, "
				+ " sodEntryId, "
				+ " sodFinishedAt, "
				+ " sodProcess, "
				+ " sodStartedAt, "
				+ " sodWorkflowId, "
				+ " status, "
				+ " type, "
				+ " beneficiary_id, "
				+ " requestInternalEntry_id, "
				+ " requester_id) \n"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("approvalFinishedAt") != null) {
			statement.setTimestamp(2, (java.sql.Timestamp) row.get("approvalFinishedAt"));
		} else {
			statement.setObject(2, null);
		}
		if (row.get("approvalPolicy_id") != null) {
			statement.setLong(3, (Long) row.get("approvalPolicy_id"));
		} else {
			statement.setObject(3, null);
		}
		if (row.get("approvalProcess") != null) {
			statement.setString(4, (String) row.get("approvalProcess"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("approvalStartedAt") != null) {
			statement.setTimestamp(5, (java.sql.Timestamp) row.get("approvalStartedAt"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("approvalWorkflowId") != null) {
			statement.setLong(6, (Long) row.get("approvalWorkflowId"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("createDate") != null) {
			statement.setTimestamp(7, (java.sql.Timestamp) row.get("createDate"));
		} else {
			statement.setObject(7, null);
		}
		if (row.get("createdBy") != null) {
			statement.setString(8, (String) row.get("createdBy"));
		} else {
			statement.setObject(8, null);
		}
		if (row.get("createdByObjectId") != null) {
			statement.setString(9, (String) row.get("createdByObjectId"));
		} else {
			statement.setObject(9, null);
		}
		if (row.get("dependenciesVerifiedAt") != null) {
			statement.setTimestamp(10, (java.sql.Timestamp) row.get("dependenciesVerifiedAt"));
		} else {
			statement.setObject(10, null);
		}
		if (row.get("effectiveDate") != null) {
			statement.setTimestamp(11, (java.sql.Timestamp) row.get("effectiveDate"));
		} else {
			statement.setObject(11, null);
		}
		if (row.get("finalizeDate") != null) {
			statement.setTimestamp(12, (java.sql.Timestamp) row.get("finalizeDate"));
		} else {
			statement.setObject(12, null);
		}
		if (row.get("generatedBySystem") != null) {
			statement.setBoolean(13, (Boolean) row.get("generatedBySystem"));
		} else {
			statement.setObject(13, null);
		}
		if (row.get("justification") != null) {
			statement.setString(14, (String) row.get("justification"));
		} else {
			statement.setObject(14, null);
		}
		if (row.get("lockDate") != null) {
			statement.setTimestamp(15, (java.sql.Timestamp) row.get("lockDate"));
		} else {
			statement.setObject(15, null);
		}
		if (row.get("lockNumber") != null) {
			statement.setLong(16, (Long) row.get("lockNumber"));
		} else {
			statement.setObject(16, null);
		}
		if (row.get("needApproval") != null) {
			statement.setBoolean(17, (Boolean) row.get("needApproval"));
		} else {
			statement.setObject(17, null);
		}
		if (row.get("payload") != null) {
			if(row.get("type").toString().equals("UPDATE_USER")) {
				JSONObject payload = new JSONObject(row.get("payload").toString());
				String userPayload = buildUpdateUserPayload(payload.getJSONObject("user"));
				statement.setString(18, userPayload);
			} else if(row.get("type").toString().equals("CREATE_ACCOUNT")) {
				JSONObject payload = new JSONObject(row.get("payload").toString());
				if(payload.has("expireAt") && payload.get("expireAt") != JSONObject.NULL) {
					Long expireAtLong = payload.getLong("expireAt");
					String expireAtString = serialize(new Date(expireAtLong));
					payload.put("expireAt", expireAtString);
					statement.setString(18, payload.toString());
				} else {
					statement.setString(18, row.get("payload").toString());
				}
			} else {
				statement.setString(18, row.get("payload").toString());
			}
		} else {
			statement.setObject(18, null);
		}
		if (row.get("payloadWithItemThatViolatesSodPolicy") != null) {
			statement.setBoolean(19, (Boolean) row.get("payloadWithItemThatViolatesSodPolicy"));
		} else {
			statement.setObject(19, null);
		}
		if (row.get("provisioningEntryId") != null) {
			statement.setLong(20, (Long) row.get("provisioningEntryId"));
		} else {
			statement.setObject(20, null);
		}
		if (row.get("provisioningFinishedAt") != null) {
			statement.setTimestamp(21, (java.sql.Timestamp) row.get("provisioningFinishedAt"));
		} else {
			statement.setObject(21, null);
		}
		if (row.get("provisioningStartedAt") != null) {
			statement.setTimestamp(22, (java.sql.Timestamp) row.get("provisioningStartedAt"));
		} else {
			statement.setObject(22, null);
		}
		if (row.get("sodEntryId") != null) {
			statement.setLong(23, (Long) row.get("sodEntryId"));
		} else {
			statement.setObject(23, null);
		}
		if (row.get("sodFinishedAt") != null) {
			statement.setTimestamp(24, (java.sql.Timestamp) row.get("sodFinishedAt"));
		} else {
			statement.setObject(24, null);
		}
		if (row.get("sodProcess") != null) {
			statement.setString(25, (String) row.get("sodProcess"));
		} else {
			statement.setObject(25, null);
		}
		if (row.get("sodStartedAt") != null) {
			statement.setTimestamp(26, (java.sql.Timestamp) row.get("sodStartedAt"));
		} else {
			statement.setObject(26, null);
		}
		if (row.get("sodWorkflowId") != null) {
			statement.setLong(27, (Long) row.get("sodWorkflowId"));
		} else {
			statement.setObject(27, null);
		}
		if (row.get("status") != null) {
			statement.setString(28, (String) row.get("status"));
		} else {
			statement.setObject(28, null);
		}
		if (row.get("type") != null) {
			if(row.get("type").toString().equals("CHANGE_STATUS_USER")) {
				JSONObject payload = new JSONObject(row.get("payload").toString());
				String status = payload.getString("status");
				if(status.equals("ACTIVE")) {
					statement.setString(29,"ACTIVATE_USER");
				} else if(status.equals("INACTIVE")) {
					statement.setString(29,"INACTIVATE_USER");
				}
			} else if (row.get("type").toString().equals("REMOVE_USER_FROM_ROLE")) {
				statement.setString(29,"REVOKE_ROLE");
			} else if (row.get("type").toString().equals("REMOVE_ACCOUNT")) {
				statement.setString(29,"REVOKE_ACCOUNT");
			} else if (row.get("type").toString().equals("REMOVE_ENTITLEMENT_FROM_ACCOUNT")) {
				statement.setString(29,"REVOKE_ENTITLEMENT");
			} else {
				statement.setString(29, (String) row.get("type"));
			} 
		} else {
			statement.setObject(29, null);
		}
		if (beneficiary_id != null) {
			statement.setLong(30, beneficiary_id);
		} else {
			statement.setObject(30, null);
		}
		if (requestInternalEntry_id != null) {
			statement.setLong(31, requestInternalEntry_id);
		} else {
			statement.setObject(31, null);
		}
		if (requester_id != null) {
			statement.setLong(32, requester_id);
		} else {
			statement.setObject(32, null);
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		LOGGER.log(Level.INFO, String.format("Comando SQL enviado para importar Blazon request com id %s", row.get("id")));
	}
	
	private static String buildUpdateUserPayload(JSONObject payload) {
		
		Map<String, Object> attributes = new HashMap<String, Object>();
		Iterator<String> keys = payload.keys();

		while(keys.hasNext()) {
		    String key = keys.next();
		    if (payload.get(key) instanceof JSONArray) {
		    	JSONArray attr = payload.getJSONArray(key);
		    	for(int i=0; i<attr.length(); i++) {
		    		JSONObject obj = attr.getJSONObject(i);
		    		if(obj.has("value")) {
		    			attributes.put(obj.getString("name"), obj.get("value"));
		    		}
		    	}
		    } else {
		    	attributes.put(key, payload.get(key));
		    }
		}
		
		if(attributes.get("state") != null) {
			attributes.put("status", attributes.get("state"));
			attributes.remove("state");
		}
		
		return new JSONObject().put("attributes", attributes).toString();
	}

	public static String serialize(Date date) {
		
		SimpleDateFormat FORMATTER = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

	    return FORMATTER.format(date);
	}
}
