public class RoleRightApprovalTaskDetailBuilder {

	private RoleRightApprovalTaskDetail taskDetail = new RoleRightApprovalTaskDetail();

	public RoleRightApprovalTaskDetailBuilder serialVersionUID(long serialVersionUID) {
		taskDetail.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public RoleRightApprovalTaskDetailBuilder id(Long id) {
		taskDetail.setId(id);
		return this;
	}

	public RoleRightApprovalTaskDetailBuilder levelName(String levelName) {
		taskDetail.setLevelName(levelName);
		return this;
	}

	public RoleRightApprovalTaskDetailBuilder creation(Date creation) {
		taskDetail.setCreation(creation);
		return this;
	}

	public RoleRightApprovalTaskDetailBuilder approvalDate(Date approvalDate) {
		taskDetail.setApprovalDate(approvalDate);
		return this;
	}

	public RoleRightApprovalTaskDetailBuilder outcome(String outcome) {
		taskDetail.setOutcome(outcome);
		return this;
	}

	public RoleRightApprovalTaskDetailBuilder taskId(Long taskId) {
		taskDetail.setTaskId(taskId);
		return this;
	}

	public RoleRightApprovalTaskDetailBuilder roleRightEntry(RoleRightEntry roleRightEntry) {
		taskDetail.setRoleRightEntry(roleRightEntry);
		return this;
	}

	public RoleRightApprovalTaskDetail build() {
		return taskDetail;
	}

	public void create() {

		RoleRightApprovalTaskDetail roleRightApprovalTaskDetail = new RoleRightApprovalTaskDetailBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.levelName(representation.getLevelName())
			.creation(representation.getCreation())
			.approvalDate(representation.getApprovalDate())
			.outcome(representation.getOutcome())
			.taskId(representation.getTaskId())
			.roleRightEntry(representation.getRoleRightEntry())
			.build();
	}

}
