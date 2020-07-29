package bom.blazon.migracao.tasks.extract.approvaltask;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bom.blazon.migracao.util.ReadFile;

public class ReadTask {
	
	public static List<Map<String, Object>> read(Integer page, Integer size, Connection conn) throws Exception {
		
		List<Map<String, Object>> result = new ArrayList<>();
		
		String sql = ReadFile.read("src/main/resources/SELECT_APPROVAL_TASKS");
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, size);
		stmt.setInt(2, page);
		
		ResultSet rs = stmt.executeQuery();
		
		ResultSetMetaData resultSetMetaData = rs.getMetaData();
		
		while(rs.next()) {
			
			Map<String, Object> row = new HashMap<String, Object>();
		
			for(int i=1;i<=resultSetMetaData.getColumnCount();i++) {
				
				Object value = rs.getObject(i);
				String collumnName = resultSetMetaData.getColumnLabel(i);
				
				row.put(collumnName, value);
				
			}
			
			result.add(row);
			
		}
		
		return result;
		
	}
	
}
