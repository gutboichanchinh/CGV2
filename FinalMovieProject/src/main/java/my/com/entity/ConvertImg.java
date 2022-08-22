package my.com.entity;

public class ConvertImg {
	private String imgString;
	public ConvertImg() {
		// TODO Auto-generated constructor stub
	}
	public ConvertImg(String imgString) {
		super();
		this.imgString = imgString;
	}
	public String getImgString() {
		return imgString;
	}
	public void setImgString(String imgString) {
		this.imgString = imgString;
	}
	@Override
	public String toString() {
		return "ConvertImg [imgString=" + imgString + "]";
	}
	
}
