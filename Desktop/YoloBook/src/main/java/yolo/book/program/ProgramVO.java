package yolo.book.program;

public class ProgramVO {
	int pnumber;
	String pname;
	String starttime;
	String endtime;
	String day;
	String price;
	int limit;
	
	public int getPnumber() {
		return pnumber;
	}
	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	@Override
	public String toString() {
		return "ProgramVO [pnumber=" + pnumber + ", pname=" + pname + ", starttime=" + starttime + ", endtime="
				+ endtime + ", day=" + day + ", price=" + price + ", limit=" + limit + "]";
	}
}
