public class UserRoleRightTaskBuilder {

	private UserRoleRightTask user = new UserRoleRightTask();

	public UserRoleRightTaskBuilder id(Long id) {
		user.setId(id);
		return this;
	}

	public UserRoleRightTaskBuilder directoryIdentifier(Long directoryIdentifier) {
		user.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public UserRoleRightTaskBuilder displayName(String displayName) {
		user.setDisplayName(displayName);
		return this;
	}

	public UserRoleRightTaskBuilder username(String username) {
		user.setUsername(username);
		return this;
	}

	public UserRoleRightTask build() {
		return user;
	}

	public void create() {

		UserRoleRightTask userRoleRightTask = new UserRoleRightTaskBuilder() 
			.id(representation.getId())
			.directoryIdentifier(representation.getDirectoryIdentifier())
			.displayName(representation.getDisplayName())
			.username(representation.getUsername())
			.build();
	}

}
