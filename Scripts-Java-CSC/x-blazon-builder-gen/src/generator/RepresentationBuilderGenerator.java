package generator;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.lang.reflect.Field;

import com.blazon.certification.domain.policy.userchangebased.UserAttributesChangeCertificationPolicyInstance;


public class RepresentationBuilderGenerator {

	@SuppressWarnings("rawtypes")
	public static void main(String[] args) throws FileNotFoundException {
		
		Class clazz = new UserAttributesChangeCertificationPolicyInstance().getClass();
		
		String varname = "instance";
		
		PrintWriter out = new PrintWriter("saida/" + clazz.getSimpleName()+"Builder.java");
		
		out.println("public class "+clazz.getSimpleName()+"Builder {");
		
		out.println("\n\tprivate "+clazz.getSimpleName() + " " + varname + " = new " + clazz.getSimpleName() + "();");
		
		Field[] fields = clazz.getSuperclass().getDeclaredFields();
		
		System.out.println(clazz.getSimpleName());
		
		System.out.println("");
		
		for(Field field: fields) {
			System.out.println(field.getName() + " " + field.getType().getSimpleName());
			
			out.println("\n\tpublic " + clazz.getSimpleName() + "Builder " + field.getName() + "("+ field.getType().getSimpleName() + " " + field.getName() + ") {");
			out.println("\t\t" + varname + ".set" + capitalize(field.getName()) + "(" + field.getName() + ");");
			out.println("\t\treturn this;");
			out.println("\t}");
		}
		
		fields = clazz.getDeclaredFields();
		
		for(Field field: fields) {
			System.out.println(field.getName() + " " + field.getType().getSimpleName());
			
			out.println("\n\tpublic " + clazz.getSimpleName() + "Builder " + field.getName() + "("+ field.getType().getSimpleName() + " " + field.getName() + ") {");
			out.println("\t\t" + varname + ".set" + capitalize(field.getName()) + "(" + field.getName() + ");");
			out.println("\t\treturn this;");
			out.println("\t}");
		}
		
		out.println("\n\tpublic " + clazz.getSimpleName() + " build() {");
		
		out.println("\t\treturn " + varname + ";");
		
		out.println("\t}");
		
		//print set method
		
		out.println("\n\tpublic void create() {");
		
		String varGetName = "representation";
		
		//String varSetName = "instance";
		
		out.println("\n\t\t" + clazz.getSimpleName() + " " + descapitalize(clazz.getSimpleName()) + " = new " + clazz.getSimpleName()+"Builder() ");
		
		fields = clazz.getSuperclass().getDeclaredFields();
		
		for(Field field: fields) {
			
			out.println("\t\t\t." + field.getName() + "(" + varGetName + ".get" + capitalize(field.getName()) + "())");
		}
		
		fields = clazz.getDeclaredFields();
		
		for(Field field: fields) {
			
			out.println("\t\t\t." + field.getName() + "(" + varGetName + ".get" + capitalize(field.getName()) + "())");
		}
		
		out.println("\t\t\t.build();");
		
		out.println("\t}");
		
		//print set method
		
		out.println("\n}");
		
		out.flush();
		out.close();
	}


	private static String capitalize(String name) {

		return ("" + name.charAt(0)).toUpperCase() + name.substring(1) ;
	}
	
	private static String descapitalize(String name) {

		return ("" + name.charAt(0)).toLowerCase() + name.substring(1) ;
	}

}
