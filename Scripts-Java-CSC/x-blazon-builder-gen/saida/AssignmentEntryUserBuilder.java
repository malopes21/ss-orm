public class AssignmentEntryUserBuilder {

	private AssignmentEntryUser entryUser = new AssignmentEntryUser();

	public AssignmentEntryUserBuilder serialVersionUID(long serialVersionUID) {
		entryUser.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public AssignmentEntryUserBuilder id(Long id) {
		entryUser.setId(id);
		return this;
	}

	public AssignmentEntryUserBuilder type(AssignmentSchema type) {
		entryUser.setType(type);
		return this;
	}

	public AssignmentEntryUserBuilder directoryIdentifier(Long directoryIdentifier) {
		entryUser.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public AssignmentEntryUserBuilder serialVersionUID(long serialVersionUID) {
		entryUser.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public AssignmentEntryUserBuilder displayName(String displayName) {
		entryUser.setDisplayName(displayName);
		return this;
	}

	public AssignmentEntryUserBuilder username(String username) {
		entryUser.setUsername(username);
		return this;
	}

	public AssignmentEntryUser build() {
		return entryUser;
	}

	public void create() {

		AssignmentEntryUser assignmentEntryUser = new AssignmentEntryUserBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.type(representation.getType())
			.directoryIdentifier(representation.getDirectoryIdentifier())
			.serialVersionUID(representation.getSerialVersionUID())
			.displayName(representation.getDisplayName())
			.username(representation.getUsername())
			.build();
	}

}
