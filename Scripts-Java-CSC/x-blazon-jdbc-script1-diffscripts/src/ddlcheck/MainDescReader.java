package ddlcheck;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class MainDescReader {

	public static void main(String[] args) throws Exception {

		String fileNameNewBase = "entrada/descsCurrentBlazon_exec.sql";

		Map<String, Table> tablesNewBase = readTables(fileNameNewBase);
		
		String fileNameOldBase = "entrada/descsZeroBlazon_exec.sql";

		Map<String, Table> tablesOldBase = readTables(fileNameOldBase);
		
		//printTables(tables1);
		
		List<TableDescritor> tableDescritors = diffTables(tablesNewBase, tablesOldBase);
		
		printTableDescriptors(tableDescritors);
		
		System.out.println("OK " + tablesNewBase.size() + " " + tablesOldBase.size() + " " + (tablesNewBase.size() - tablesOldBase.size()));
	}


	private static List<TableDescritor> diffTables(Map<String, Table> newBaseTables, Map<String, Table> oldBaseTables) {
		
		List<TableDescritor> tableDescritors = new ArrayList<TableDescritor>();
		
		for(String newBaseTableName: newBaseTables.keySet() ) {
		
			Table oldBaseTable = oldBaseTables.get(newBaseTableName);
			
			Table newBaseTable = newBaseTables.get(newBaseTableName);
			
			if(oldBaseTable == null) {
				
				TableDescritor descritor = new TableDescritor();
				
				descritor.setTableName(newBaseTableName);
				
				descritor.setTodo("CREATE");
				
				List<FieldDescritor> fieldDescritors = new ArrayList<>();
				
				for(String newFieldName: newBaseTable.getFields().keySet()) {
					
					Field newTableField = newBaseTable.getFields().get(newFieldName);
					
					FieldDescritor fieldDescritor = new FieldDescritor();
					
					fieldDescritor.setFieldName(newFieldName);
					
					fieldDescritor.setTodo("CREATE");
					
					fieldDescritor.setType(newTableField.getType());
					
					fieldDescritors.add(fieldDescritor);
				}
				
				descritor.setFieldDescritors(fieldDescritors);
				
				tableDescritors.add(descritor);
				
			} else {
				
				List<FieldDescritor> fieldDescritors = diffFields(newBaseTable, oldBaseTable);
				
				if(!fieldDescritors.isEmpty()) {
					
					TableDescritor descritor = new TableDescritor();
					
					descritor.setTableName(newBaseTableName);
					
					descritor.setTodo("UPDATE");
					
					descritor.setFieldDescritors(fieldDescritors);
					
					tableDescritors.add(descritor);
				} else {
					
					TableDescritor descritor = new TableDescritor();
					
					descritor.setTableName(newBaseTableName);
					
					descritor.setTodo("IDENTITY");
					
					descritor.setFieldDescritors(fieldDescritors);
					
					tableDescritors.add(descritor);
				}
			}
		}
		
		for(String oldBaseTableName: oldBaseTables.keySet()) {
			
			Table newBaseTable = newBaseTables.get(oldBaseTableName);
			
			Table oldBaseTable = oldBaseTables.get(oldBaseTableName);
			
			if(newBaseTable == null) {
				
				TableDescritor descritor = new TableDescritor();
				
				descritor.setTodo("REMOVE");
				
				descritor.setTableName(oldBaseTable.getName());
				
				tableDescritors.add(descritor);
			}
		}

		return tableDescritors;
	}
	

	private static List<FieldDescritor> diffFields(Table newBaseTable, Table oldBaseTable) {
		
		List<FieldDescritor> fieldDescritors = new ArrayList<>();

		Map<String, Field> newTableFields = newBaseTable.getFields();
		
		for(String newFieldName: newTableFields.keySet()) {
			
			Field oldTableField = oldBaseTable.getFields().get(newFieldName);
			
			Field newTableField = newTableFields.get(newFieldName);
			
			if(oldTableField == null) {
				
				FieldDescritor descritor = new FieldDescritor();
				
				descritor.setFieldName(newFieldName);
				
				descritor.setTodo("CREATE");
				
				descritor.setType(newTableField.getType());
				
				fieldDescritors.add(descritor);
				
			} else {
				
				if(!oldTableField.getType().equals(newTableField.getType())) {
					
					FieldDescritor descritor = new FieldDescritor();
					
					descritor.setFieldName(newFieldName);
					
					descritor.setTodo("UPDATE");
					
					descritor.setType(newTableField.getType());
					
					fieldDescritors.add(descritor);
				}
			}
		}
		
		Map<String, Field> oldTableFields = oldBaseTable.getFields();
		
		for(String oldFieldName: oldTableFields.keySet()) {
			
			Field oldTableField = oldTableFields.get(oldFieldName);
			
			Field newTableField = newTableFields.get(oldFieldName);
			
			if(newTableField == null) {
				
				FieldDescritor descritor = new FieldDescritor();
				
				descritor.setFieldName(oldFieldName);
				
				descritor.setTodo("REMOVE");
				
				descritor.setType(oldTableField.getType());
				
				fieldDescritors.add(descritor);
			}
		}
		
		return fieldDescritors;
	}

	private static Map<String, Table> readTables(String fileName) throws Exception {

		Map<String, Table> tables = new TreeMap<>();
		
		try {

			BufferedReader reader = new BufferedReader(new FileReader(fileName));

			String line = reader.readLine();

			while (line != null) {

				if ("TABLE_NAME".equals(line)) {

					line = reader.readLine();
					
					String tableName = line;

					Table table = new Table();
					table.setName(tableName);
					
					line = reader.readLine();
					while(!line.equals("Field	Type	Null	Key	Default	Extra")) {
						line = reader.readLine();
					}
					
					line = reader.readLine();

					while (line != null  && !"TABLE_NAME".equals(line)) {

						String fieldDef[] = line.split("\t");
						String fieldName = fieldDef[0];
						String fieldType = fieldDef[1];
						Field field = new Field(fieldName, fieldType);
						table.getFields().put(fieldName, field);
						line = reader.readLine();
					}

					tables.put(tableName, table);
				}
			}

			reader.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return tables;
	}
	

	private static void printTableDescriptors(List<TableDescritor> tableDescritors) {

		for(TableDescritor tableDescritor: tableDescritors) {
			
			System.out.println(tableDescritor.getTodo() + "  " +tableDescritor.getTableName());
			
			for(FieldDescritor fieldDescritor: tableDescritor.getFieldDescritors()) {
				
				//System.out.println("\t"+ fieldDescritor.getTodo()+ "  " + fieldDescritor.getFieldName() + "  " + fieldDescritor.getType());
				
				if(fieldDescritor.getTodo().equals("CREATE")) {
					
					System.out.println("\t" + "ALTER TABLE " + tableDescritor.getTableName() + " ADD COLUMN " + fieldDescritor.getFieldName() +  " " + fieldDescritor.getType() + ";");
					
				} else if(fieldDescritor.getTodo().equals("REMOVE")) {
					
					System.out.println("\t" + "ALTER TABLE " + tableDescritor.getTableName() + " DROP COLUMN " + fieldDescritor.getFieldName() + ";");
					
				} else {
					
					System.out.println("\t"+ fieldDescritor.getTodo()+ "  " + fieldDescritor.getFieldName() + "  " + fieldDescritor.getType());
				}
			}
			
			System.out.println();
		}
	}

	private static void printTables(Map<String, Table> tables) {

		for (String tableName : tables.keySet()) {

			System.out.println(tableName);
			for (String fieldName : tables.get(tableName).getFields().keySet()) {
				System.out.println(tables.get(tableName).getFields().get(fieldName));
			}
			System.out.println("");
		}

		System.out.println(tables.size());
	}

}
