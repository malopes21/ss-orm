public class ProvisioningEntryResourceBuilder {

	private ProvisioningEntryResource resource = new ProvisioningEntryResource();

	public ProvisioningEntryResourceBuilder serialVersionUID(long serialVersionUID) {
		resource.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ProvisioningEntryResourceBuilder id(Long id) {
		resource.setId(id);
		return this;
	}

	public ProvisioningEntryResourceBuilder type(ProvisioningSchema type) {
		resource.setType(type);
		return this;
	}

	public ProvisioningEntryResourceBuilder directoryIdentifier(Long directoryIdentifier) {
		resource.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public ProvisioningEntryResourceBuilder serialVersionUID(long serialVersionUID) {
		resource.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ProvisioningEntryResourceBuilder name(String name) {
		resource.setName(name);
		return this;
	}

	public ProvisioningEntryResource build() {
		return resource;
	}

	public void create() {

		ProvisioningEntryResource provisioningEntryResource = new ProvisioningEntryResourceBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.type(representation.getType())
			.directoryIdentifier(representation.getDirectoryIdentifier())
			.serialVersionUID(representation.getSerialVersionUID())
			.name(representation.getName())
			.build();
	}

}
