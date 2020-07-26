package blazon.script.requests.domain;

public class BlazonRequestTemp {

	private Long request_id;

	private Long accountId;

	private Long entitlementId;

	private Long roleId;

	private Long resourceId;

	private Long beneficiary_id;

	private Long requester_id;

	private Long membershipId;

	private String requestType;

	public Long getRequest_id() {
		return request_id;
	}

	public void setRequest_id(Long request_id) {
		this.request_id = request_id;
	}

	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public Long getEntitlementId() {
		return entitlementId;
	}

	public void setEntitlementId(Long entitlementId) {
		this.entitlementId = entitlementId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getResourceId() {
		return resourceId;
	}

	public void setResourceId(Long resourceId) {
		this.resourceId = resourceId;
	}

	public Long getBeneficiary_id() {
		return beneficiary_id;
	}

	public void setBeneficiary_id(Long beneficiary_id) {
		this.beneficiary_id = beneficiary_id;
	}

	public Long getRequester_id() {
		return requester_id;
	}

	public void setRequester_id(Long requester_id) {
		this.requester_id = requester_id;
	}

	public Long getMembershipId() {
		return membershipId;
	}

	public void setMembershipId(Long membershipId) {
		this.membershipId = membershipId;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

}
