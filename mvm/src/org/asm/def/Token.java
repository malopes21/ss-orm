package org.asm.def;

public class Token {

	private String image;
	private Clazz clazz;
	private Integer index;
	private Integer line;
	private Integer colum;

	public Token() {
		super();
	}

	public Token(String image, Clazz clazz, Integer index, Integer line,
			Integer colum) {
		super();
		this.image = image;
		this.clazz = clazz;
		this.index = index;
		this.line = line;
		this.colum = colum;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Clazz getClazz() {
		return clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public Integer getLine() {
		return line;
	}

	public void setLine(Integer line) {
		this.line = line;
	}

	public Integer getColum() {
		return colum;
	}

	public void setColum(Integer colum) {
		this.colum = colum;
	}

	@Override
	public String toString() {
		return "Token [image=" + image + ", clazz=" + clazz + ", index="
				+ index + ", line=" + line + ", colum=" + colum + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((clazz == null) ? 0 : clazz.hashCode());
		result = prime * result + ((image == null) ? 0 : image.hashCode());
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
		Token other = (Token) obj;
		if (clazz != other.clazz)
			return false;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		return true;
	}
	
	
	
}
