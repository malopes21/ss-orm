public class UserProvisioningTaskBuilder {

	private UserProvisioningTask user = new UserProvisioningTask();

	public UserProvisioningTaskBuilder id(Long id) {
		user.setId(id);
		return this;
	}

	public UserProvisioningTaskBuilder directoryIdentifier(Long directoryIdentifier) {
		user.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public UserProvisioningTaskBuilder displayName(String displayName) {
		user.setDisplayName(displayName);
		return this;
	}

	public UserProvisioningTaskBuilder username(String username) {
		user.setUsername(username);
		return this;
	}

	public UserProvisioningTask build() {
		return user;
	}

	public void create() {

		UserProvisioningTask userProvisioningTask = new UserProvisioningTaskBuilder() 
			.id(representation.getId())
			.directoryIdentifier(representation.getDirectoryIdentifier())
			.displayName(representation.getDisplayName())
			.username(representation.getUsername())
			.build();
	}

}
