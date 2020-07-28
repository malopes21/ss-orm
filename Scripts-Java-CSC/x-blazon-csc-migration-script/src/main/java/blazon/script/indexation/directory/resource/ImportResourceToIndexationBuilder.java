package blazon.script.indexation.directory.resource;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class ImportResourceToIndexationBuilder {

	public static JSONObject createEntry(Map<String, Object> row) {

		String key = generateMd5Key("RESOURCE", row.get("id").toString());
		
		JSONObject entryJson = new JSONObject();

		entryJson.put("key", key);
		entryJson.put("identifier", (Long) row.get("id")); 
		entryJson.put("schema", "RESOURCE");
		entryJson.put("resourceName", row.get("name"));
		entryJson.put("resourceIdentifier", row.get("id"));
		entryJson.put("resourceType", "REGULAR");
		
		JSONArray fieldsJson = new JSONArray();
		
		JSONObject field = createField("STRING", "name", row.get("name"));
		fieldsJson.put(field);
		
		field = createField("STRING", "description", row.get("description"));
		fieldsJson.put(field);
		
		field = createField("DATE", "creationDate", row.get("creationDate"));
		fieldsJson.put(field);
		
		field = createField("STRING", "uri", row.get("uri"));
		fieldsJson.put(field);
		
		field = createField("STRING", "tags", row.get("tags"));
		fieldsJson.put(field);
		
		field = createField("NUMBER", "categoryId", row.get("category_id"));
		fieldsJson.put(field);
		
		//field = createField("STRING", "categoryName", row.get("categoryName"));
		//fieldsJson.put(field);
		
		field = createField("BOOLEAN", "visibleToSelfService", row.get("visibleToSelfService"));
		fieldsJson.put(field);
		
		field = createField("STRING", "logoImageId", row.get("logoImageId"));
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
