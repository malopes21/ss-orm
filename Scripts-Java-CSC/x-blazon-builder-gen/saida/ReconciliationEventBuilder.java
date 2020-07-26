public class ReconciliationEventBuilder {

	private ReconciliationEvent event = new ReconciliationEvent();

	public ReconciliationEventBuilder reconciliationProfileId(Long reconciliationProfileId) {
		event.setReconciliationProfileId(reconciliationProfileId);
		return this;
	}

	public ReconciliationEventBuilder data(String data) {
		event.setData(data);
		return this;
	}

	public ReconciliationEventBuilder effectiveDate(Date effectiveDate) {
		event.setEffectiveDate(effectiveDate);
		return this;
	}

	public ReconciliationEventBuilder schema(String schema) {
		event.setSchema(schema);
		return this;
	}

	public ReconciliationEventBuilder resourceAdapterId(String resourceAdapterId) {
		event.setResourceAdapterId(resourceAdapterId);
		return this;
	}

	public ReconciliationEvent build() {
		return event;
	}

	public void create() {

		ReconciliationEvent reconciliationEvent = new ReconciliationEventBuilder() 
			.reconciliationProfileId(representation.getReconciliationProfileId())
			.data(representation.getData())
			.effectiveDate(representation.getEffectiveDate())
			.schema(representation.getSchema())
			.resourceAdapterId(representation.getResourceAdapterId())
			.build();
	}

}
