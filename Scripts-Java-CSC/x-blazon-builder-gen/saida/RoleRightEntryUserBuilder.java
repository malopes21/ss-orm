public class RoleRightEntryUserBuilder {

	private RoleRightEntryUser user = new RoleRightEntryUser();

	public RoleRightEntryUserBuilder serialVersionUID(long serialVersionUID) {
		user.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public RoleRightEntryUserBuilder id(Long id) {
		user.setId(id);
		return this;
	}

	public RoleRightEntryUserBuilder type(RoleRightSchema type) {
		user.setType(type);
		return this;
	}

	public RoleRightEntryUserBuilder directoryIdentifier(Long directoryIdentifier) {
		user.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public RoleRightEntryUserBuilder serialVersionUID(long serialVersionUID) {
		user.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public RoleRightEntryUserBuilder displayName(String displayName) {
		user.setDisplayName(displayName);
		return this;
	}

	public RoleRightEntryUserBuilder username(String username) {
		user.setUsername(username);
		return this;
	}

	public RoleRightEntryUser build() {
		return user;
	}

	public void create() {

		RoleRightEntryUser roleRightEntryUser = new RoleRightEntryUserBuilder() 
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
