package blazon.script;

public class TesteClone {

	public static void main(String[] args) {

		UserTeste teste1 = new UserTeste();
		teste1.setId(Long.valueOf(null));
		teste1.setName("malopes");

		System.out.println(teste1);

		UserTeste teste2 = new UserTeste();
		teste2.setId(teste1.getId());
		teste2.setName(teste1.getName());
		
		System.out.println(teste2);
		
		teste1.setId(15l);
		teste1.setName("Mudado");
		
		System.out.println(teste1);
		
		System.out.println(teste2);

	}
}

class UserTeste {

	private Long id;

	private String name;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "UserTeste [id=" + id + ", name=" + name + "]";
	}

}