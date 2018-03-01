package bean;

import org.apache.tomcat.util.buf.StringCache;

public class AddDepartment {
	String depName;
	String description;
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
