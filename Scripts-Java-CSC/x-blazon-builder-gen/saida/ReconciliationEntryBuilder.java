public class ReconciliationEntryBuilder {

	private ReconciliationEntry reconciliationEntry = new ReconciliationEntry();

	public ReconciliationEntryBuilder serialVersionUID(long serialVersionUID) {
		reconciliationEntry.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ReconciliationEntryBuilder id(Long id) {
		reconciliationEntry.setId(id);
		return this;
	}

	public ReconciliationEntryBuilder data(String data) {
		reconciliationEntry.setData(data);
		return this;
	}

	public ReconciliationEntryBuilder processedData(String processedData) {
		reconciliationEntry.setProcessedData(processedData);
		return this;
	}

	public ReconciliationEntryBuilder matchedEntriesIds(List matchedEntriesIds) {
		reconciliationEntry.setMatchedEntriesIds(matchedEntriesIds);
		return this;
	}

	public ReconciliationEntryBuilder matchedOwnersIds(List matchedOwnersIds) {
		reconciliationEntry.setMatchedOwnersIds(matchedOwnersIds);
		return this;
	}

	public ReconciliationEntryBuilder ownersType(String ownersType) {
		reconciliationEntry.setOwnersType(ownersType);
		return this;
	}

	public ReconciliationEntryBuilder date(Date date) {
		reconciliationEntry.setDate(date);
		return this;
	}

	public ReconciliationEntryBuilder processDate(Date processDate) {
		reconciliationEntry.setProcessDate(processDate);
		return this;
	}

	public ReconciliationEntryBuilder effectiveDate(Date effectiveDate) {
		reconciliationEntry.setEffectiveDate(effectiveDate);
		return this;
	}

	public ReconciliationEntryBuilder situation(SituationDef situation) {
		reconciliationEntry.setSituation(situation);
		return this;
	}

	public ReconciliationEntryBuilder status(Status status) {
		reconciliationEntry.setStatus(status);
		return this;
	}

	public ReconciliationEntryBuilder profile(ReconciliationProfile profile) {
		reconciliationEntry.setProfile(profile);
		return this;
	}

	public ReconciliationEntryBuilder schema(Schema schema) {
		reconciliationEntry.setSchema(schema);
		return this;
	}

	public ReconciliationEntryBuilder reconciliationActionBeanName(String reconciliationActionBeanName) {
		reconciliationEntry.setReconciliationActionBeanName(reconciliationActionBeanName);
		return this;
	}

	public ReconciliationEntryBuilder lockNumber(Long lockNumber) {
		reconciliationEntry.setLockNumber(lockNumber);
		return this;
	}

	public ReconciliationEntryBuilder lockDate(Date lockDate) {
		reconciliationEntry.setLockDate(lockDate);
		return this;
	}

	public ReconciliationEntryBuilder batchId(String batchId) {
		reconciliationEntry.setBatchId(batchId);
		return this;
	}

	public ReconciliationEntryBuilder resourceAdapterId(String resourceAdapterId) {
		reconciliationEntry.setResourceAdapterId(resourceAdapterId);
		return this;
	}

	public ReconciliationEntryBuilder reconciliationMatchedInternalEntry(ReconciliationDirectoryEntry reconciliationMatchedInternalEntry) {
		reconciliationEntry.setReconciliationMatchedInternalEntry(reconciliationMatchedInternalEntry);
		return this;
	}

	public ReconciliationEntryBuilder resource(ReconciliationEntryResource resource) {
		reconciliationEntry.setResource(resource);
		return this;
	}

	public ReconciliationEntry build() {
		return reconciliationEntry;
	}

	public void create() {

		ReconciliationEntry reconciliationEntry = new ReconciliationEntryBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.data(representation.getData())
			.processedData(representation.getProcessedData())
			.matchedEntriesIds(representation.getMatchedEntriesIds())
			.matchedOwnersIds(representation.getMatchedOwnersIds())
			.ownersType(representation.getOwnersType())
			.date(representation.getDate())
			.processDate(representation.getProcessDate())
			.effectiveDate(representation.getEffectiveDate())
			.situation(representation.getSituation())
			.status(representation.getStatus())
			.profile(representation.getProfile())
			.schema(representation.getSchema())
			.reconciliationActionBeanName(representation.getReconciliationActionBeanName())
			.lockNumber(representation.getLockNumber())
			.lockDate(representation.getLockDate())
			.batchId(representation.getBatchId())
			.resourceAdapterId(representation.getResourceAdapterId())
			.reconciliationMatchedInternalEntry(representation.getReconciliationMatchedInternalEntry())
			.resource(representation.getResource())
			.build();
	}

}
