public class ProvisioningTaskDetailBuilder {

	private ProvisioningTaskDetail taskDetail = new ProvisioningTaskDetail();

	public ProvisioningTaskDetailBuilder serialVersionUID(long serialVersionUID) {
		taskDetail.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public ProvisioningTaskDetailBuilder id(Long id) {
		taskDetail.setId(id);
		return this;
	}

	public ProvisioningTaskDetailBuilder creation(Date creation) {
		taskDetail.setCreation(creation);
		return this;
	}

	public ProvisioningTaskDetailBuilder approvalDate(Date approvalDate) {
		taskDetail.setApprovalDate(approvalDate);
		return this;
	}

	public ProvisioningTaskDetailBuilder outcome(String outcome) {
		taskDetail.setOutcome(outcome);
		return this;
	}

	public ProvisioningTaskDetailBuilder taskId(Long taskId) {
		taskDetail.setTaskId(taskId);
		return this;
	}

	public ProvisioningTaskDetailBuilder provisioningEntry(ProvisioningEntry provisioningEntry) {
		taskDetail.setProvisioningEntry(provisioningEntry);
		return this;
	}

	public ProvisioningTaskDetail build() {
		return taskDetail;
	}

	public void create() {

		ProvisioningTaskDetail provisioningTaskDetail = new ProvisioningTaskDetailBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.creation(representation.getCreation())
			.approvalDate(representation.getApprovalDate())
			.outcome(representation.getOutcome())
			.taskId(representation.getTaskId())
			.provisioningEntry(representation.getProvisioningEntry())
			.build();
	}

}
