package bom.blazon.migracao.imagedatabase.extract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bom.blazon.migracao.util.ReadFile;

public class ReadBlazonImage {
	
	public static List<Map<String, Object>> read(Connection conn) throws Exception {
		
		List<Map<String, Object>> result = new ArrayList<>();
		
		String sql = ReadFile.read("src/main/resources/SELECT_BLAZON_IMAGE");
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
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