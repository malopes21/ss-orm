public class RoleRightEntryRoleBuilder {

	private RoleRightEntryRole role = new RoleRightEntryRole();

	public RoleRightEntryRoleBuilder serialVersionUID(long serialVersionUID) {
		role.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public RoleRightEntryRoleBuilder id(Long id) {
		role.setId(id);
		return this;
	}

	public RoleRightEntryRoleBuilder type(RoleRightSchema type) {
		role.setType(type);
		return this;
	}

	public RoleRightEntryRoleBuilder directoryIdentifier(Long directoryIdentifier) {
		role.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public RoleRightEntryRoleBuilder serialVersionUID(long serialVersionUID) {
		role.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public RoleRightEntryRoleBuilder name(String name) {
		role.setName(name);
		return this;
	}

	public RoleRightEntryRole build() {
		return role;
	}

	public void create() {

		RoleRightEntryRole roleRightEntryRole = new RoleRightEntryRoleBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.type(representation.getType())
			.directoryIdentifier(representation.getDirectoryIdentifier())
			.serialVersionUID(representation.getSerialVersionUID())
			.name(representation.getName())
			.build();
	}

}
