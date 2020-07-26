
if(row.get("batchId") != null) { statement.setString(1, (String)row.get("batchId")); } else { statement.setObject(1, null); }
if(row.get("amount") != null) { statement.setLong(2, (Long)row.get("amount")); } else { statement.setObject(2, null); }
if(row.get("finalizedDate") != null) { statement.setTimestamp(3, (java.sql.Timestamp)row.get("finalizedDate")); } else { statement.setObject(3, null); }
if(row.get("profileId") != null) { statement.setLong(4, (Long)row.get("profileId")); } else { statement.setObject(4, null); }
if(row.get("profileName") != null) { statement.setString(5, (String)row.get("profileName")); } else { statement.setObject(5, null); }
if(row.get("startDate") != null) { statement.setTimestamp(6, (java.sql.Timestamp)row.get("startDate")); } else { statement.setObject(6, null); }
if(row.get("status") != null) { statement.setString(7, (String)row.get("status")); } else { statement.setObject(7, null); }