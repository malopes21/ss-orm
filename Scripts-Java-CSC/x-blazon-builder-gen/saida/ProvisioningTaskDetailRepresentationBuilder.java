public class ProvisioningTaskDetailRepresentationBuilder {

	private ProvisioningTaskDetailRepresentation representation = new ProvisioningTaskDetailRepresentation();

	public ProvisioningTaskDetailRepresentationBuilder identifier(Long identifier) {
		representation.setIdentifier(identifier);
		return this;
	}

	public ProvisioningTaskDetailRepresentationBuilder creation(Date creation) {
		representation.setCreation(creation);
		return this;
	}

	public ProvisioningTaskDetailRepresentationBuilder approvalDate(Date approvalDate) {
		representation.setApprovalDate(approvalDate);
		return this;
	}

	public ProvisioningTaskDetailRepresentationBuilder outcome(String outcome) {
		representation.setOutcome(outcome);
		return this;
	}

	public ProvisioningTaskDetailRepresentationBuilder taskId(Long taskId) {
		representation.setTaskId(taskId);
		return this;
	}

	public ProvisioningTaskDetailRepresentationBuilder provisioningEntry(ProvisioningEntryRepresentation provisioningEntry) {
		representation.setProvisioningEntry(provisioningEntry);
		return this;
	}

	public ProvisioningTaskDetailRepresentation build() {
		return representation;
	}

	public void create() {

		ProvisioningTaskDetailRepresentation provisioningTaskDetailRepresentation = new ProvisioningTaskDetailRepresentationBuilder() 
			.identifier(representation.getIdentifier())
			.creation(representation.getCreation())
			.approvalDate(representation.getApprovalDate())
			.outcome(representation.getOutcome())
			.taskId(representation.getTaskId())
			.provisioningEntry(representation.getProvisioningEntry())
			.build();
	}

}
