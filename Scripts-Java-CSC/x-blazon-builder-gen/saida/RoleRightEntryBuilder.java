public class RoleRightEntryBuilder {

	private RoleRightEntry roleRightEntry = new RoleRightEntry();

	public RoleRightEntryBuilder serialVersionUID(long serialVersionUID) {
		roleRightEntry.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public RoleRightEntryBuilder id(Long id) {
		roleRightEntry.setId(id);
		return this;
	}

	public RoleRightEntryBuilder roleRightPolicyId(Long roleRightPolicyId) {
		roleRightEntry.setRoleRightPolicyId(roleRightPolicyId);
		return this;
	}

	public RoleRightEntryBuilder items(Set items) {
		roleRightEntry.setItems(items);
		return this;
	}

	public RoleRightEntryBuilder creationDate(Date creationDate) {
		roleRightEntry.setCreationDate(creationDate);
		return this;
	}

	public RoleRightEntryBuilder executionDate(Date executionDate) {
		roleRightEntry.setExecutionDate(executionDate);
		return this;
	}

	public RoleRightEntryBuilder status(RightEntryStatus status) {
		roleRightEntry.setStatus(status);
		return this;
	}

	public RoleRightEntryBuilder action(RightAction action) {
		roleRightEntry.setAction(action);
		return this;
	}

	public RoleRightEntryBuilder lockNumber(Long lockNumber) {
		roleRightEntry.setLockNumber(lockNumber);
		return this;
	}

	public RoleRightEntryBuilder lockDate(Date lockDate) {
		roleRightEntry.setLockDate(lockDate);
		return this;
	}

	public RoleRightEntryBuilder approvalWorkflowId(Long approvalWorkflowId) {
		roleRightEntry.setApprovalWorkflowId(approvalWorkflowId);
		return this;
	}

	public RoleRightEntryBuilder requester(RoleRightEntryUser requester) {
		roleRightEntry.setRequester(requester);
		return this;
	}

	public RoleRightEntryBuilder role(RoleRightEntryRole role) {
		roleRightEntry.setRole(role);
		return this;
	}

	public RoleRightEntryBuilder justification(String justification) {
		roleRightEntry.setJustification(justification);
		return this;
	}

	public RoleRightEntry build() {
		return roleRightEntry;
	}

	public void create() {

		RoleRightEntry roleRightEntry = new RoleRightEntryBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.roleRightPolicyId(representation.getRoleRightPolicyId())
			.items(representation.getItems())
			.creationDate(representation.getCreationDate())
			.executionDate(representation.getExecutionDate())
			.status(representation.getStatus())
			.action(representation.getAction())
			.lockNumber(representation.getLockNumber())
			.lockDate(representation.getLockDate())
			.approvalWorkflowId(representation.getApprovalWorkflowId())
			.requester(representation.getRequester())
			.role(representation.getRole())
			.justification(representation.getJustification())
			.build();
	}

}
