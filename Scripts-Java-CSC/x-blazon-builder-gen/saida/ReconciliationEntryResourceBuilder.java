public class ReconciliationEntryResourceBuilder {

	private ReconciliationEntryResource reconciliationEntryResource = new ReconciliationEntryResource();

	public ReconciliationEntryResourceBuilder serialVersionUID(long serialVersionUID) {
		reconciliationEntryResource.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ReconciliationEntryResourceBuilder id(Long id) {
		reconciliationEntryResource.setId(id);
		return this;
	}

	public ReconciliationEntryResourceBuilder type(Schema type) {
		reconciliationEntryResource.setType(type);
		return this;
	}

	public ReconciliationEntryResourceBuilder directoryIdentifier(Long directoryIdentifier) {
		reconciliationEntryResource.setDirectoryIdentifier(directoryIdentifier);
		return this;
	}

	public ReconciliationEntryResourceBuilder serialVersionUID(long serialVersionUID) {
		reconciliationEntryResource.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ReconciliationEntryResourceBuilder name(String name) {
		reconciliationEntryResource.setName(name);
		return this;
	}

	public ReconciliationEntryResource build() {
		return reconciliationEntryResource;
	}

	public void create() {

		ReconciliationEntryResource reconciliationEntryResource = new ReconciliationEntryResourceBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.type(representation.getType())
			.directoryIdentifier(representation.getDirectoryIdentifier())
			.serialVersionUID(representation.getSerialVersionUID())
			.name(representation.getName())
			.build();
	}

}
