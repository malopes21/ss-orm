public class UserCertificationTaskBuilder {

	private UserCertificationTask user = new UserCertificationTask();

	public UserCertificationTaskBuilder id(Long id) {
		user.setId(id);
		return this;
	}

	public UserCertificationTaskBuilder directoryIdentifier(Long directoryIdentifier) {
		user.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public UserCertificationTaskBuilder displayName(String displayName) {
		user.setDisplayName(displayName);
		return this;
	}

	public UserCertificationTaskBuilder username(String username) {
		user.setUsername(username);
		return this;
	}

	public UserCertificationTask build() {
		return user;
	}

	public void create() {

		UserCertificationTask userCertificationTask = new UserCertificationTaskBuilder() 
			.id(representation.getId())
			.directoryIdentifier(representation.getDirectoryIdentifier())
			.displayName(representation.getDisplayName())
			.username(representation.getUsername())
			.build();
	}

}
