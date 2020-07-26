public class ProvisioningEntryBuilder {

	private ProvisioningEntry provisioningEntry = new ProvisioningEntry();

	public ProvisioningEntryBuilder serialVersionUID(long serialVersionUID) {
		provisioningEntry.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ProvisioningEntryBuilder id(Long id) {
		provisioningEntry.setId(id);
		return this;
	}

	public ProvisioningEntryBuilder date(Date date) {
		provisioningEntry.setDate(date);
		return this;
	}

	public ProvisioningEntryBuilder processDate(Date processDate) {
		provisioningEntry.setProcessDate(processDate);
		return this;
	}

	public ProvisioningEntryBuilder status(Status status) {
		provisioningEntry.setStatus(status);
		return this;
	}

	public ProvisioningEntryBuilder workflowId(Long workflowId) {
		provisioningEntry.setWorkflowId(workflowId);
		return this;
	}

	public ProvisioningEntryBuilder targetId(Long targetId) {
		provisioningEntry.setTargetId(targetId);
		return this;
	}

	public ProvisioningEntryBuilder targetType(Schema targetType) {
		provisioningEntry.setTargetType(targetType);
		return this;
	}

	public ProvisioningEntryBuilder entryType(ProvisioningEntryType entryType) {
		provisioningEntry.setEntryType(entryType);
		return this;
	}

	public ProvisioningEntryBuilder provisioningType(ProvisioningType provisioningType) {
		provisioningEntry.setProvisioningType(provisioningType);
		return this;
	}

	public ProvisioningEntryBuilder provisioningTypeObjectId(String provisioningTypeObjectId) {
		provisioningEntry.setProvisioningTypeObjectId(provisioningTypeObjectId);
		return this;
	}

	public ProvisioningEntryBuilder payload(String payload) {
		provisioningEntry.setPayload(payload);
		return this;
	}

	public ProvisioningEntryBuilder lockNumber(Long lockNumber) {
		provisioningEntry.setLockNumber(lockNumber);
		return this;
	}

	public ProvisioningEntryBuilder lockDate(Date lockDate) {
		provisioningEntry.setLockDate(lockDate);
		return this;
	}

	public ProvisioningEntryBuilder provisioningTaskQueueIdentifier(Long provisioningTaskQueueIdentifier) {
		provisioningEntry.setProvisioningTaskQueueIdentifier(provisioningTaskQueueIdentifier);
		return this;
	}

	public ProvisioningEntryBuilder provisioningTaskDefinitionIdentifier(Long provisioningTaskDefinitionIdentifier) {
		provisioningEntry.setProvisioningTaskDefinitionIdentifier(provisioningTaskDefinitionIdentifier);
		return this;
	}

	public ProvisioningEntryBuilder beneficiary(ProvisioningEntryUser beneficiary) {
		provisioningEntry.setBeneficiary(beneficiary);
		return this;
	}

	public ProvisioningEntryBuilder resource(ProvisioningEntryResource resource) {
		provisioningEntry.setResource(resource);
		return this;
	}

	public ProvisioningEntryBuilder provisioningInternalEntry(ProvisioningDirectoryEntry provisioningInternalEntry) {
		provisioningEntry.setProvisioningInternalEntry(provisioningInternalEntry);
		return this;
	}

	public ProvisioningEntry build() {
		return provisioningEntry;
	}

	public void create() {

		ProvisioningEntry provisioningEntry = new ProvisioningEntryBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.date(representation.getDate())
			.processDate(representation.getProcessDate())
			.status(representation.getStatus())
			.workflowId(representation.getWorkflowId())
			.targetId(representation.getTargetId())
			.targetType(representation.getTargetType())
			.entryType(representation.getEntryType())
			.provisioningType(representation.getProvisioningType())
			.provisioningTypeObjectId(representation.getProvisioningTypeObjectId())
			.payload(representation.getPayload())
			.lockNumber(representation.getLockNumber())
			.lockDate(representation.getLockDate())
			.provisioningTaskQueueIdentifier(representation.getProvisioningTaskQueueIdentifier())
			.provisioningTaskDefinitionIdentifier(representation.getProvisioningTaskDefinitionIdentifier())
			.beneficiary(representation.getBeneficiary())
			.resource(representation.getResource())
			.provisioningInternalEntry(representation.getProvisioningInternalEntry())
			.build();
	}

}
