public class UserAttributesChangeCertificationPolicyInstanceBuilder {

	private UserAttributesChangeCertificationPolicyInstance instance = new UserAttributesChangeCertificationPolicyInstance();

	public UserAttributesChangeCertificationPolicyInstanceBuilder serialVersionUID(long serialVersionUID) {
		instance.setSerialVersionUID(serialVersionUID);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder id(Long id) {
		instance.setId(id);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder date(Date date) {
		instance.setDate(date);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder finalizeDate(Date finalizeDate) {
		instance.setFinalizeDate(finalizeDate);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder deadline(Date deadline) {
		instance.setDeadline(deadline);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder status(Status status) {
		instance.setStatus(status);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder username(String username) {
		instance.setUsername(username);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder userId(Long userId) {
		instance.setUserId(userId);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder userDisplayName(String userDisplayName) {
		instance.setUserDisplayName(userDisplayName);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder isAutoRevoke(boolean isAutoRevoke) {
		instance.setIsAutoRevoke(isAutoRevoke);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstanceBuilder policy(CertificationPolicy policy) {
		instance.setPolicy(policy);
		return this;
	}

	public UserAttributesChangeCertificationPolicyInstance build() {
		return instance;
	}

	public void create() {

		UserAttributesChangeCertificationPolicyInstance userAttributesChangeCertificationPolicyInstance = new UserAttributesChangeCertificationPolicyInstanceBuilder() 
			.serialVersionUID(representation.getSerialVersionUID())
			.id(representation.getId())
			.date(representation.getDate())
			.finalizeDate(representation.getFinalizeDate())
			.deadline(representation.getDeadline())
			.status(representation.getStatus())
			.username(representation.getUsername())
			.userId(representation.getUserId())
			.userDisplayName(representation.getUserDisplayName())
			.isAutoRevoke(representation.getIsAutoRevoke())
			.policy(representation.getPolicy())
			.build();
	}

}
