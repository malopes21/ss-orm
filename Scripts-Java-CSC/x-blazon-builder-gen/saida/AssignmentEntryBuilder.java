public class AssignmentEntryBuilder {

	private AssignmentEntry assignmentEntry = new AssignmentEntry();

	public AssignmentEntryBuilder id(Long id) {
		assignmentEntry.setId(id);
		return this;
	}

	public AssignmentEntryBuilder assignmentPolicyId(Long assignmentPolicyId) {
		assignmentEntry.setAssignmentPolicyId(assignmentPolicyId);
		return this;
	}

	public AssignmentEntryBuilder action(AssignmentPolicyAction action) {
		assignmentEntry.setAction(action);
		return this;
	}

	public AssignmentEntryBuilder creationDate(Date creationDate) {
		assignmentEntry.setCreationDate(creationDate);
		return this;
	}

	public AssignmentEntryBuilder executionDate(Date executionDate) {
		assignmentEntry.setExecutionDate(executionDate);
		return this;
	}

	public AssignmentEntryBuilder status(AssignmentEntryStatus status) {
		assignmentEntry.setStatus(status);
		return this;
	}

	public AssignmentEntryBuilder lockNumber(Long lockNumber) {
		assignmentEntry.setLockNumber(lockNumber);
		return this;
	}

	public AssignmentEntryBuilder lockDate(Date lockDate) {
		assignmentEntry.setLockDate(lockDate);
		return this;
	}

	public AssignmentEntryBuilder beneficiary(AssignmentEntryUser beneficiary) {
		assignmentEntry.setBeneficiary(beneficiary);
		return this;
	}

	public AssignmentEntryBuilder role(AssignmentEntryRole role) {
		assignmentEntry.setRole(role);
		return this;
	}

	public AssignmentEntry build() {
		return assignmentEntry;
	}

	public void create() {

		AssignmentEntry assignmentEntry = new AssignmentEntryBuilder() 
			.id(representation.getId())
			.assignmentPolicyId(representation.getAssignmentPolicyId())
			.action(representation.getAction())
			.creationDate(representation.getCreationDate())
			.executionDate(representation.getExecutionDate())
			.status(representation.getStatus())
			.lockNumber(representation.getLockNumber())
			.lockDate(representation.getLockDate())
			.beneficiary(representation.getBeneficiary())
			.role(representation.getRole())
			.build();
	}

}
