public class CampaignExecutionInstanceBuilder {

	private CampaignExecutionInstance instance = new CampaignExecutionInstance();

	public CampaignExecutionInstanceBuilder serialVersionUID(long serialVersionUID) {
		instance.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public CampaignExecutionInstanceBuilder id(Long id) {
		instance.setId(id);
		return this;
	}

	public CampaignExecutionInstanceBuilder name(String name) {
		instance.setName(name);
		return this;
	}

	public CampaignExecutionInstanceBuilder date(Date date) {
		instance.setDate(date);
		return this;
	}

	public CampaignExecutionInstanceBuilder finalizeDate(Date finalizeDate) {
		instance.setFinalizeDate(finalizeDate);
		return this;
	}

	public CampaignExecutionInstanceBuilder campaignId(Long campaignId) {
		instance.setCampaignId(campaignId);
		return this;
	}

	public CampaignExecutionInstanceBuilder deadline(Date deadline) {
		instance.setDeadline(deadline);
		return this;
	}

	public CampaignExecutionInstanceBuilder status(Status status) {
		instance.setStatus(status);
		return this;
	}

	public CampaignExecutionInstanceBuilder isAutoRevoke(boolean isAutoRevoke) {
		instance.setIsAutoRevoke(isAutoRevoke);
		return this;
	}

	public CampaignExecutionInstanceBuilder certificationWorkflowName(String certificationWorkflowName) {
		instance.setCertificationWorkflowName(certificationWorkflowName);
		return this;
	}

	public CampaignExecutionInstanceBuilder lockNumber(Long lockNumber) {
		instance.setLockNumber(lockNumber);
		return this;
	}

	public CampaignExecutionInstance build() {
		return instance;
	}

	public void create() {

		CampaignExecutionInstance campaignExecutionInstance = new CampaignExecutionInstanceBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.name(representation.getName())
			.date(representation.getDate())
			.finalizeDate(representation.getFinalizeDate())
			.campaignId(representation.getCampaignId())
			.deadline(representation.getDeadline())
			.status(representation.getStatus())
			.isAutoRevoke(representation.getIsAutoRevoke())
			.certificationWorkflowName(representation.getCertificationWorkflowName())
			.lockNumber(representation.getLockNumber())
			.build();
	}

}
