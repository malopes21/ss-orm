public class AssignmentEntryRoleBuilder {

	private AssignmentEntryRole entryRole = new AssignmentEntryRole();

	public AssignmentEntryRoleBuilder serialVersionUID(long serialVersionUID) {
		entryRole.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public AssignmentEntryRoleBuilder id(Long id) {
		entryRole.setId(id);
		return this;
	}

	public AssignmentEntryRoleBuilder type(AssignmentSchema type) {
		entryRole.setType(type);
		return this;
	}

	public AssignmentEntryRoleBuilder directoryIdentifier(Long directoryIdentifier) {
		entryRole.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public AssignmentEntryRoleBuilder serialVersionUID(long serialVersionUID) {
		entryRole.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public AssignmentEntryRoleBuilder name(String name) {
		entryRole.setName(name);
		return this;
	}

	public AssignmentEntryRole build() {
		return entryRole;
	}

	public void create() {

		AssignmentEntryRole assignmentEntryRole = new AssignmentEntryRoleBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.type(representation.getType())
			.directoryIdentifier(representation.getDirectoryIdentifier())
			.serialVersionUID(representation.getSerialVersionUID())
			.name(representation.getName())
			.build();
	}

}
