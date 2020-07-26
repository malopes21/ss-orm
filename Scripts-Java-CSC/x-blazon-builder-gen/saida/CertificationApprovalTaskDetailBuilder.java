public class CertificationApprovalTaskDetailBuilder {

	private CertificationApprovalTaskDetail taskDetail = new CertificationApprovalTaskDetail();

	public CertificationApprovalTaskDetailBuilder serialVersionUID(long serialVersionUID) {
		taskDetail.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public CertificationApprovalTaskDetailBuilder id(Long id) {
		taskDetail.setId(id);
		return this;
	}

	public CertificationApprovalTaskDetailBuilder levelName(String levelName) {
		taskDetail.setLevelName(levelName);
		return this;
	}

	public CertificationApprovalTaskDetailBuilder creation(Date creation) {
		taskDetail.setCreation(creation);
		return this;
	}

	public CertificationApprovalTaskDetailBuilder approvalDate(Date approvalDate) {
		taskDetail.setApprovalDate(approvalDate);
		return this;
	}

	public CertificationApprovalTaskDetailBuilder outcome(String outcome) {
		taskDetail.setOutcome(outcome);
		return this;
	}

	public CertificationApprovalTaskDetailBuilder taskId(Long taskId) {
		taskDetail.setTaskId(taskId);
		return this;
	}

	public CertificationApprovalTaskDetailBuilder certificationEntry(CertificationEntry certificationEntry) {
		taskDetail.setCertificationEntry(certificationEntry);
		return this;
	}

	public CertificationApprovalTaskDetail build() {
		return taskDetail;
	}

	public void create() {

		CertificationApprovalTaskDetail certificationApprovalTaskDetail = new CertificationApprovalTaskDetailBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.levelName(representation.getLevelName())
			.creation(representation.getCreation())
			.approvalDate(representation.getApprovalDate())
			.outcome(representation.getOutcome())
			.taskId(representation.getTaskId())
			.certificationEntry(representation.getCertificationEntry())
			.build();
	}

}
