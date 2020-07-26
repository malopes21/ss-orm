public class ReconciliationEventRepresentationBuilder {

	private ReconciliationEventRepresentation representation = new ReconciliationEventRepresentation();

	public ReconciliationEventRepresentationBuilder reconciliationProfileId(Long reconciliationProfileId) {
		representation.setReconciliationProfileId(reconciliationProfileId);
		return this;
	}

	public ReconciliationEventRepresentationBuilder data(String data) {
		representation.setData(data);
		return this;
	}

	public ReconciliationEventRepresentationBuilder effectiveDate(Date effectiveDate) {
		representation.setEffectiveDate(effectiveDate);
		return this;
	}

	public ReconciliationEventRepresentationBuilder schema(String schema) {
		representation.setSchema(schema);
		return this;
	}

	public ReconciliationEventRepresentationBuilder resourceAdapterId(String resourceAdapterId) {
		representation.setResourceAdapterId(resourceAdapterId);
		return this;
	}

	public ReconciliationEventRepresentation build() {
		return representation;
	}

	public void create() {

		ReconciliationEventRepresentation reconciliationEventRepresentation = new ReconciliationEventRepresentationBuilder() 
			.reconciliationProfileId(representation.getReconciliationProfileId())
			.data(representation.getData())
			.effectiveDate(representation.getEffectiveDate())
			.schema(representation.getSchema())
			.resourceAdapterId(representation.getResourceAdapterId())
			.build();
	}

}
