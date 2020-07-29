package bom.blazon.migracao.tasks.loading;

import java.util.HashMap;
import java.util.Map;

public class TaskDefinitionMapper {
	
	private static final Map<String, String> mapper = new HashMap<>();
	
	static {
		
		mapper.put("1", "1");
		mapper.put("2", "1");
		mapper.put("3", "1");
		mapper.put("4", "1");
		mapper.put("5", "1");
		mapper.put("6", "1");
		mapper.put("7", "1");
		mapper.put("8", "1");
		mapper.put("9", "1");
		mapper.put("10", "1");
		mapper.put("11", "1");
		mapper.put("12", "1");
		mapper.put("13", "1");
		
	}
	
	public static String get(String definition) {
		
		return mapper.get(definition);
		
	}

}
