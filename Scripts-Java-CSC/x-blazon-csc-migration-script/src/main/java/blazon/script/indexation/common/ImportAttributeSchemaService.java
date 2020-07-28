package blazon.script.indexation.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImportAttributeSchemaService {

	public static Map<String, Map<String, Object>> getAttributeSchema(Connection sourceConn, String schema, Long resourceId) throws Exception {
		
		Map<String, Map<String, Object>> outboundSchema = new HashMap<>();

		List<Map<String, Object>> attributes = readAttributes(sourceConn, schema, resourceId);
		
		for(Map<String, Object> attribute: attributes) {
			
			outboundSchema.put(attribute.get("name").toString(), attribute);
		}
		
		return outboundSchema;
	}

	static List<Map<String, Object>> readAttributes(Connection conn, String schema, Long resourceId) throws Exception {

		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		if(resourceId == null) {
			
			String sql = "select * from EntryAttribute ea " + 
					"where ea.schemaa = ? " +
					"and ea.searchable = true ";
			
			statement = conn.prepareStatement(sql);
			statement.setString(1, schema);
			
		} else {
			
			String sql = "select * from EntryAttribute ea " + 
					"where ea.schemaa = ? " +
					"and ea.searchable = true " +
					"and ea.resource_id = ? ";
			
			statement = conn.prepareStatement(sql);
			statement.setString(1, schema);
			statement.setLong(2, resourceId);
		}
		
		rs = statement.executeQuery();

		while (rs.next()) {

			Map<String, Object> row = new HashMap<>();
			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}

			rows.add(row);
		}

		return rows;
	}

	public static void addAdditionalFields(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from EntryAttributeValue eav \n" + 
				"where eav.entry_id  = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));
			
		rs = statement.executeQuery();

		while (rs.next()) {

			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
		}
	}

	public static void addResourceInfo(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select \n" + 
				"	id as resourceId, \n" + 
				"	name as resourceName, \n" + 
				"	description as resourceDescription \n" + 
				"from Resource " + 
				"where id  = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("resource_id"));
			
		rs = statement.executeQuery();

		while (rs.next()) {

			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnLabel(i), rs.getObject(i));
			}
		}
	}

	public static void addCreatedByInfo(Connection conn, Map<String, Object> row) throws SQLException {
		
		if(row.get("createdBy_id") == null) {
			
			return;
		}

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select \n" + 
				"	cb.objectId as createdByObjectId, \n" + 
				"	cb.type as createdByType \n" + 
				"from CreatedBy cb \n" + 
				"where cb.id = ? ";
		
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("createdBy_id"));
			
		rs = statement.executeQuery();

		while (rs.next()) {

			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnLabel(i), rs.getObject(i));
			}
		}
	}
}
