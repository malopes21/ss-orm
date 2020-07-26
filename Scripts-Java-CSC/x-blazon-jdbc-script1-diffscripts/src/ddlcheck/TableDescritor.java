package ddlcheck;

import java.util.ArrayList;
import java.util.List;

public class TableDescritor {

	private String tableName;

	private String todo;

	private List<FieldDescritor> fieldDescritors = new ArrayList<FieldDescritor>();

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	public List<FieldDescritor> getFieldDescritors() {
		return fieldDescritors;
	}

	public void setFieldDescritors(List<FieldDescritor> fieldDescritors) {
		this.fieldDescritors = fieldDescritors;
	}

}
