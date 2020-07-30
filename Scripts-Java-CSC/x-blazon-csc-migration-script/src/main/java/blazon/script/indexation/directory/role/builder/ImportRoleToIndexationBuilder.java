package blazon.script.indexation.directory.role.builder;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class ImportRoleToIndexationBuilder {

	public static JSONObject createEntry(Map<String, Map<String, Object>> schema, Map<String, Object> row) {

		String key = generateMd5Key("ROLE", row.get("id").toString());
		
		JSONObject entryJson = new JSONObject();

		entryJson.put("key", key);
		entryJson.put("identifier", (Long) row.get("id")); 
		entryJson.put("schema", "ROLE");
		entryJson.put("resourceName", JSONObject.NULL);
		entryJson.put("resourceIdentifier", JSONObject.NULL);
		entryJson.put("resourceType", JSONObject.NULL);
		
		JSONArray fieldsJson = new JSONArray();
		
		for(String fieldName: schema.keySet()) {
			
			Object attributeValue = row.get(fieldName);
			
			Map<String, Object> fieldMetadata = schema.get(fieldName);
			
			String displayType = fieldMetadata.get("displayType").toString();
			
			if (displayType.equals("STRING")
					|| displayType.equals("TEXTAREA")
					|| displayType.equals("PASSWORD")) {
				
				if (attributeValue != null) {
					
					JSONObject field = createField("STRING", fieldName, attributeValue);
					
					fieldsJson.put(field);
				}
				
			} else if (displayType.equals("NUMBER")) {
				
				if (attributeValue != null) {
					
					JSONObject field = createField("NUMBER", fieldName, attributeValue);
					
					fieldsJson.put(field);
				}
				
			} else if (displayType.equals("CHECKBOX")) {
				
				if (attributeValue != null) {
					
					JSONObject field = createField("BOOLEAN", fieldName, attributeValue);
					
					fieldsJson.put(field);
				}
				
			} else if (displayType.equals("DATE")) {
				
				if (attributeValue != null) {
					
					JSONObject field = createField("DATE", fieldName, attributeValue);
					
					fieldsJson.put(field);
				}
			}
		}
		
		JSONObject field = createField("BOOLEAN", "visibleToSelfService", row.get("visibleToSelfService"));
		fieldsJson.put(field);
		
		field = createField("DATE", "createdAt", row.get("createdAt"));
		fieldsJson.put(field);
		
		field = createField("STRING", "tags", row.get("tags"));
		fieldsJson.put(field);
		
		entryJson.put("fields", fieldsJson);
		
		return entryJson;
	}
	
	private static JSONObject createField(String type, String fieldName, Object attributeValue) {

		JSONObject fieldJson = new JSONObject();
		
		fieldJson.put("name", fieldName);
		
		if(type.equals("NUMBER")) {
			fieldJson.put("numberValue", attributeValue != null ? Long.valueOf(attributeValue.toString()) : JSONObject.NULL);
			fieldJson.put("stringValue", JSONObject.NULL);
			fieldJson.put("booleanValue", JSONObject.NULL);
			fieldJson.put("dateValue", JSONObject.NULL);
		} else if(type.equals("STRING")) {
			fieldJson.put("numberValue", JSONObject.NULL);
			fieldJson.put("stringValue", attributeValue != null ? attributeValue.toString() : JSONObject.NULL);
			fieldJson.put("booleanValue", JSONObject.NULL);
			fieldJson.put("dateValue", JSONObject.NULL);
		} else if(type.equals("BOOLEAN")) {
			fieldJson.put("numberValue", JSONObject.NULL);
			fieldJson.put("stringValue", JSONObject.NULL);
			fieldJson.put("booleanValue", attributeValue != null ? Boolean.valueOf(attributeValue.toString()) : JSONObject.NULL);
			fieldJson.put("dateValue", JSONObject.NULL);
		} else if(type.equals("DATE")) {
			fieldJson.put("numberValue", JSONObject.NULL);
			fieldJson.put("stringValue", JSONObject.NULL);
			fieldJson.put("booleanValue", JSONObject.NULL);
			fieldJson.put("dateValue", attributeValue != null ? ((Date) attributeValue).getTime() : null);
		} 
		
		return fieldJson;
	}


	public static String generateMd5Key(String schema, String identifier) {
		
		String key = schema + ":" + identifier;
		MessageDigest m;
		
		try {
			m = MessageDigest.getInstance("MD5");
			
			m.update(key.getBytes(), 0, key.length());
			
			return new BigInteger(1, m.digest()).toString();
			
		} catch (NoSuchAlgorithmException e) {
			
			throw new IllegalArgumentException(e);
		}
	}
	

}
