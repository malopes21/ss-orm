public class CreatedByBuilder {

	private CreatedBy createdBy = new CreatedBy();

	public CreatedByBuilder serialVersionUID(long serialVersionUID) {
		createdBy.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public CreatedByBuilder id(Long id) {
		createdBy.setId(id);
		return this;
	}

	public CreatedByBuilder type(Type type) {
		createdBy.setType(type);
		return this;
	}

	public CreatedByBuilder objectId(Long objectId) {
		createdBy.setObjectId(objectId);
		return this;
	}

	public CreatedBy build() {
		return createdBy;
	}

	public void create() {

		CreatedBy createdBy = new CreatedByBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.type(representation.getType())
			.objectId(representation.getObjectId())
			.build();
	}

}
