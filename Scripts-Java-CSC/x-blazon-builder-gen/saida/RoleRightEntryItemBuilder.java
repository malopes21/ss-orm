public class RoleRightEntryItemBuilder {

	private RoleRightEntryItem item = new RoleRightEntryItem();

	public RoleRightEntryItemBuilder serialVersionUID(long serialVersionUID) {
		item.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public RoleRightEntryItemBuilder id(Long id) {
		item.setId(id);
		return this;
	}

	public RoleRightEntryItemBuilder entryName(String entryName) {
		item.setEntryName(entryName);
		return this;
	}

	public RoleRightEntryItemBuilder entryDescription(String entryDescription) {
		item.setEntryDescription(entryDescription);
		return this;
	}

	public RoleRightEntryItemBuilder entryType(String entryType) {
		item.setEntryType(entryType);
		return this;
	}

	public RoleRightEntryItemBuilder entryId(Long entryId) {
		item.setEntryId(entryId);
		return this;
	}

	public RoleRightEntryItemBuilder approvalStatus(APPROVAL_STATUS approvalStatus) {
		item.setApprovalStatus(approvalStatus);
		return this;
	}

	public RoleRightEntryItem build() {
		return item;
	}

	public void create() {

		RoleRightEntryItem roleRightEntryItem = new RoleRightEntryItemBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.entryName(representation.getEntryName())
			.entryDescription(representation.getEntryDescription())
			.entryType(representation.getEntryType())
			.entryId(representation.getEntryId())
			.approvalStatus(representation.getApprovalStatus())
			.build();
	}

}
