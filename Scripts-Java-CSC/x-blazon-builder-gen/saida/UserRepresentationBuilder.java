public class UserRepresentationBuilder {

	private UserRepresentation user = new UserRepresentation();

	public UserRepresentationBuilder identifier(Long identifier) {
		user.setIdentifier(identifier);
		return this;
	}

	public UserRepresentationBuilder username(String username) {
		user.setUsername(username);
		return this;
	}

	public UserRepresentationBuilder password(String password) {
		user.setPassword(password);
		return this;
	}

	public UserRepresentationBuilder firstName(String firstName) {
		user.setFirstName(firstName);
		return this;
	}

	public UserRepresentationBuilder middleName(String middleName) {
		user.setMiddleName(middleName);
		return this;
	}

	public UserRepresentationBuilder lastName(String lastName) {
		user.setLastName(lastName);
		return this;
	}

	public UserRepresentationBuilder createdAt(Date createdAt) {
		user.setCreatedAt(createdAt);
		return this;
	}

	public UserRepresentationBuilder modifiedAt(Date modifiedAt) {
		user.setModifiedAt(modifiedAt);
		return this;
	}

	public UserRepresentationBuilder lastAccess(Date lastAccess) {
		user.setLastAccess(lastAccess);
		return this;
	}

	public UserRepresentationBuilder status(String status) {
		user.setStatus(status);
		return this;
	}

	public UserRepresentationBuilder email(String email) {
		user.setEmail(email);
		return this;
	}

	public UserRepresentationBuilder personalEmail(String personalEmail) {
		user.setPersonalEmail(personalEmail);
		return this;
	}

	public UserRepresentationBuilder displayName(String displayName) {
		user.setDisplayName(displayName);
		return this;
	}

	public UserRepresentationBuilder birthDate(Date birthDate) {
		user.setBirthDate(birthDate);
		return this;
	}

	public UserRepresentationBuilder mobilePhone(String mobilePhone) {
		user.setMobilePhone(mobilePhone);
		return this;
	}

	public UserRepresentationBuilder primaryPhone(String primaryPhone) {
		user.setPrimaryPhone(primaryPhone);
		return this;
	}

	public UserRepresentationBuilder justification(String justification) {
		user.setJustification(justification);
		return this;
	}

	public UserRepresentationBuilder additionalFields(List additionalFields) {
		user.setAdditionalFields(additionalFields);
		return this;
	}

	public UserRepresentationBuilder name(String name) {
		user.setName(name);
		return this;
	}

	public UserRepresentationBuilder effectiveDate(Date effectiveDate) {
		user.setEffectiveDate(effectiveDate);
		return this;
	}

	public UserRepresentationBuilder createdByType(String createdByType) {
		user.setCreatedByType(createdByType);
		return this;
	}

	public UserRepresentationBuilder createdByObjectId(String createdByObjectId) {
		user.setCreatedByObjectId(createdByObjectId);
		return this;
	}

	public UserRepresentationBuilder locked(Boolean locked) {
		user.setLocked(locked);
		return this;
	}

	public UserRepresentationBuilder expireAt(Date expireAt) {
		user.setExpireAt(expireAt);
		return this;
	}

	public UserRepresentationBuilder certificatedAt(Date certificatedAt) {
		user.setCertificatedAt(certificatedAt);
		return this;
	}

	public UserRepresentationBuilder risk(String risk) {
		user.setRisk(risk);
		return this;
	}

	public UserRepresentation build() {
		return user;
	}

	public void create() {

		UserRepresentation userRepresentation = new UserRepresentationBuilder() 
			.identifier(representation.getIdentifier())
			.username(representation.getUsername())
			.password(representation.getPassword())
			.firstName(representation.getFirstName())
			.middleName(representation.getMiddleName())
			.lastName(representation.getLastName())
			.createdAt(representation.getCreatedAt())
			.modifiedAt(representation.getModifiedAt())
			.lastAccess(representation.getLastAccess())
			.status(representation.getStatus())
			.email(representation.getEmail())
			.personalEmail(representation.getPersonalEmail())
			.displayName(representation.getDisplayName())
			.birthDate(representation.getBirthDate())
			.mobilePhone(representation.getMobilePhone())
			.primaryPhone(representation.getPrimaryPhone())
			.justification(representation.getJustification())
			.additionalFields(representation.getAdditionalFields())
			.name(representation.getName())
			.effectiveDate(representation.getEffectiveDate())
			.createdByType(representation.getCreatedByType())
			.createdByObjectId(representation.getCreatedByObjectId())
			.locked(representation.getLocked())
			.expireAt(representation.getExpireAt())
			.certificatedAt(representation.getCertificatedAt())
			.risk(representation.getRisk())
			.build();
	}

}
