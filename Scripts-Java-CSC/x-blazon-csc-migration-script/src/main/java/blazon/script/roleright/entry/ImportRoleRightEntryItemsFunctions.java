package blazon.script.roleright.entry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

public class ImportRoleRightEntryItemsFunctions {

	
	static void insertItems(Connection conn, Map<String, Object> row) throws Exception {
		
		List<Map<String, Object>> itemsData = readItems((Long) row.get("id"));
		
		for(Map<String, Object> itemData: itemsData ) {
			
			insertItem(conn, itemData);
			
			insertItem_RoleRightEntry(conn, itemData);
		}
		
	}

	static void insertItem(Connection conn, Map<String, Object> row) throws Exception {
		
		String sql = "INSERT INTO RoleRightEntryItem \n" + 
				"(id, approvalStatus, entryDescription, entryId, entryName, entryType) \n" + 
				"VALUES (?, ?, ?, ?, ?, ?) ";
		
		PreparedStatement statement = conn.prepareStatement(sql);
		
		if (row.get("itemId") != null) {
			statement.setLong(1, (Long) row.get("itemId"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("approvalStatus") != null) {
			statement.setString(2, (String) row.get("approvalStatus"));
		} else {
			statement.setObject(2, null);
		}
		if (row.get("entryDescription") != null) {
			statement.setString(3, (String) row.get("entryDescription"));
		} else {
			statement.setObject(3, null);
		}
		if (row.get("entryId") != null) {
			statement.setLong(4, (Long) row.get("entryId"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("entryName") != null) {
			statement.setString(5, (String) row.get("entryName"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("entryType") != null) {
			statement.setString(6, (String) row.get("entryType"));
		} else {
			statement.setObject(6, null);
		}
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
	}
	
	
	private static void insertItem_RoleRightEntry(Connection conn, Map<String, Object> row) throws SQLException {

		String sql = "INSERT INTO RoleRightEntry_RoleRightEntryItem \n" + 
				"(RoleRightEntry_id, items_id)\n" + 
				"VALUES (?, ?) ";
		
		PreparedStatement statement = conn.prepareStatement(sql);
		
		if (row.get("roleRightEntryId") != null) {
			statement.setLong(1, (Long) row.get("roleRightEntryId"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("itemId") != null) {
			statement.setLong(2, (Long) row.get("itemId"));
		} else {
			statement.setObject(2, null);
		}
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
	}

	
	static List<Map<String, Object>> readItems(Long roleRightEntryId) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select \n" + 
				"	rre_item.RoleRightEntry_id as roleRightEntryId, \n" + 
				"	item.id as itemId, \n" + 
				"	item.entryId as entryId, \n" + 
				"	item.entryType as entryType, \n" + 
				"	item.entryName  as entryName, \n" + 
				"	item.entryDescription as entryDescription, \n" + 
				"	item.approvalStatus  as approvalStatus \n" + 
				"from RoleRightEntryItem item \n" + 
				"join RoleRightEntry_RoleRightEntryItem rre_item on rre_item.items_id = item.id \n" + 
				"where rre_item.RoleRightEntry_id = ? ";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, roleRightEntryId);
		
		rs = statement.executeQuery();
		
		List<Map<String, Object>> rows = new ArrayList<>();
		
		while(rs.next()) {
			
			Map<String, Object> row = new HashMap<>();
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnLabel(i), rs.getObject(i));
			}
			
			rows.add(row);
		}
		
		conn.commit();
		conn.close();
		
		return rows;
	}

}
