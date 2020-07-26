public class ProvisioningEntryUserBuilder {

	private ProvisioningEntryUser user = new ProvisioningEntryUser();

	public ProvisioningEntryUserBuilder serialVersionUID(long serialVersionUID) {
		user.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ProvisioningEntryUserBuilder id(Long id) {
		user.setId(id);
		return this;
	}

	public ProvisioningEntryUserBuilder type(ProvisioningSchema type) {
		user.setType(type);
		return this;
	}

	public ProvisioningEntryUserBuilder directoryIdentifier(Long directoryIdentifier) {
		user.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public ProvisioningEntryUserBuilder serialVersionUID(long serialVersionUID) {
		user.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ProvisioningEntryUserBuilder displayName(String displayName) {
		user.setDisplayName(displayName);
		return this;
	}

	public ProvisioningEntryUserBuilder username(String username) {
		user.setUsername(username);
		return this;
	}

	public ProvisioningEntryUser build() {
		return user;
	}

	public void create() {

		ProvisioningEntryUser provisioningEntryUser = new ProvisioningEntryUserBuilder() 
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
