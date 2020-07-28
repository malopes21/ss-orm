package blazon.script.certification;

import java.io.Serializable;

public class CampaignKey implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String type;

	private Long resourceId;

	public CampaignKey() {
		super();
	}

	public CampaignKey(String type, Long resourceId) {
		super();
		this.type = type;
		this.resourceId = resourceId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getResourceId() {
		return resourceId;
	}

	public void setResourceId(Long resourceId) {
		this.resourceId = resourceId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((resourceId == null) ? 0 : resourceId.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CampaignKey other = (CampaignKey) obj;
		if (resourceId == null) {
			if (other.resourceId != null)
				return false;
		} else if (!resourceId.equals(other.resourceId))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CampaignKey [type=" + type + ", resourceId=" + resourceId + "]";
	}

}
