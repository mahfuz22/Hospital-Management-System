package bean;

public class Bed {
	
	private int Id;
	private int totalBed;
	private String bedType;
	private String bedDescription;
	private int rate;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	
	public int getTotalBed() {
		return totalBed;
	}
	public void setTotalBed(int totalBed) {
		this.totalBed = totalBed;
	}
	public String getBedType() {
		return bedType;
	}
	public void setBedType(String bedType) {
		this.bedType = bedType;
	}
	public String getBedDescription() {
		return bedDescription;
	}
	public void setBedDescription(String bedDescription) {
		this.bedDescription = bedDescription;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	
}
