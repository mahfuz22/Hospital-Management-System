package bean;

public class Prescription {
	private int id;
	private String doctorName;
	private String patientName;
	private String caseHistory;
	private String medication;
	private String mediPherma;
	private String description;
	private String date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getCaseHistory() {
		return caseHistory;
	}
	public void setCaseHistory(String caseHistory) {
		this.caseHistory = caseHistory;
	}
	public String getMedication() {
		return medication;
	}
	public void setMedication(String medication) {
		this.medication = medication;
	}
	public String getMediPherma() {
		return mediPherma;
	}
	public void setMediPherma(String mediPherma) {
		this.mediPherma = mediPherma;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
