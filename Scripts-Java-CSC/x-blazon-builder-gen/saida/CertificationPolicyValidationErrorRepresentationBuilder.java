public class CertificationPolicyValidationErrorRepresentationBuilder {

	private CertificationPolicyValidationErrorRepresentation representation = new CertificationPolicyValidationErrorRepresentation();

	public CertificationPolicyValidationErrorRepresentationBuilder error(String error) {
		representation.setError(error);
		return this;
	}

	public CertificationPolicyValidationErrorRepresentationBuilder message(String message) {
		representation.setMessage(message);
		return this;
	}

	public CertificationPolicyValidationErrorRepresentation build() {
		return representation;
	}

	public void create() {

		CertificationPolicyValidationErrorRepresentation certificationPolicyValidationErrorRepresentation = new CertificationPolicyValidationErrorRepresentationBuilder() 
			.error(representation.getError())
			.message(representation.getMessage())
			.build();
	}

}
