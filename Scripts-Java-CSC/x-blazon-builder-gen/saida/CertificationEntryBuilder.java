public class CertificationEntryBuilder {

	private CertificationEntry entry = new CertificationEntry();

	public CertificationEntryBuilder serialVersionUID(long serialVersionUID) {
		entry.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public CertificationEntryBuilder id(Long id) {
		entry.setId(id);
		return this;
	}

	public CertificationEntryBuilder creationDate(Date creationDate) {
		entry.setCreationDate(creationDate);
		return this;
	}

	public CertificationEntryBuilder processDate(Date processDate) {
		entry.setProcessDate(processDate);
		return this;
	}

	public CertificationEntryBuilder createdBy(String createdBy) {
		entry.setCreatedBy(createdBy);
		return this;
	}

	public CertificationEntryBuilder createdByObjectId(String createdByObjectId) {
		entry.setCreatedByObjectId(createdByObjectId);
		return this;
	}

	public CertificationEntryBuilder executionInstanceId(String executionInstanceId) {
		entry.setExecutionInstanceId(executionInstanceId);
		return this;
	}

	public CertificationEntryBuilder workflowCertificationName(String workflowCertificationName) {
		entry.setWorkflowCertificationName(workflowCertificationName);
		return this;
	}

	public CertificationEntryBuilder entryId(Long entryId) {
		entry.setEntryId(entryId);
		return this;
	}

	public CertificationEntryBuilder entryType(CertificationObjectType entryType) {
		entry.setEntryType(entryType);
		return this;
	}

	public CertificationEntryBuilder status(Status status) {
		entry.setStatus(status);
		return this;
	}

	public CertificationEntryBuilder workflowCertificationId(Long workflowCertificationId) {
		entry.setWorkflowCertificationId(workflowCertificationId);
		return this;
	}

	public CertificationEntryBuilder lockNumber(Long lockNumber) {
		entry.setLockNumber(lockNumber);
		return this;
	}

	public CertificationEntryBuilder lockDate(Date lockDate) {
		entry.setLockDate(lockDate);
		return this;
	}

	public CertificationEntryBuilder deadline(Date deadline) {
		entry.setDeadline(deadline);
		return this;
	}

	public CertificationEntryBuilder certificationInternalEntry(CertificationDirectoryEntry certificationInternalEntry) {
		entry.setCertificationInternalEntry(certificationInternalEntry);
		return this;
	}

	public CertificationEntryBuilder revokeIfDeadlineReached(boolean revokeIfDeadlineReached) {
		entry.setRevokeIfDeadlineReached(revokeIfDeadlineReached);
		return this;
	}

	public CertificationEntry build() {
		return entry;
	}

	public void create() {

		CertificationEntry certificationEntry = new CertificationEntryBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.creationDate(representation.getCreationDate())
			.processDate(representation.getProcessDate())
			.createdBy(representation.getCreatedBy())
			.createdByObjectId(representation.getCreatedByObjectId())
			.executionInstanceId(representation.getExecutionInstanceId())
			.workflowCertificationName(representation.getWorkflowCertificationName())
			.entryId(representation.getEntryId())
			.entryType(representation.getEntryType())
			.status(representation.getStatus())
			.workflowCertificationId(representation.getWorkflowCertificationId())
			.lockNumber(representation.getLockNumber())
			.lockDate(representation.getLockDate())
			.deadline(representation.getDeadline())
			.certificationInternalEntry(representation.getCertificationInternalEntry())
			.revokeIfDeadlineReached(representation.getRevokeIfDeadlineReached())
			.build();
	}

}
