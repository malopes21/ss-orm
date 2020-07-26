package tests;

import java.util.List;
import java.util.stream.Collectors;
import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		
		List<String> listTags = new ArrayList<>();
		
		listTags.add("teste");
		listTags.add("malopes");
		
		if (listTags != null && !listTags.isEmpty()) {
			String tags = listTags.get(0);
			for (int i = 1; i < listTags.size(); i++) {
				tags = tags + ";" + listTags.get(i);
			}
			System.out.println(tags);
		}
		
		if (listTags != null && !listTags.isEmpty() ) {
				String tagsString = listTags.stream()
				.map(Object::toString)
				.collect(Collectors.joining(";"));
				System.out.println(tagsString);
		}
	}
}
