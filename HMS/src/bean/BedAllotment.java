package bean;

public class BedAllotment {
	
	private int id;
	private int bedNumber;
	private String bedType;
	private String patientName;
	private String allotmentDate;
	private String dischargeDate;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBedNumber() {
		return bedNumber;
	}
	public void setBedNumber(int bedNumber) {
		this.bedNumber = bedNumber;
	}
	public String getBedType() {
		return bedType;
	}
	public void setBedType(String bedType) {
		this.bedType = bedType;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getAllotmentDate() {
		return allotmentDate;
	}
	public void setAllotmentDate(String allotmentDate) {
		this.allotmentDate = allotmentDate;
	}
	public String getDischargeDate() {
		return dischargeDate;
	}
	public void setDischargeDate(String dischargeDate) {
		this.dischargeDate = dischargeDate;
	}
}
