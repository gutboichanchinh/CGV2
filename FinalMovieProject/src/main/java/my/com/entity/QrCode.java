package my.com.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

@Entity
public class QrCode {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	public byte[] getImage() {
		return Image;
	}

	public void setImage(byte[] image) {
		Image = image;
	}

	@Lob
	private byte[] Image;

	@Column(name = "Verify", columnDefinition = "nvarchar(100)", unique = false, nullable = false)
	private String Verify;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "bill_id", referencedColumnName = "id")
	private Bill billlist;

	public QrCode() {
		// TODO Auto-generated constructor stub
	}

	

	public QrCode(byte[] image, String verify, Bill billlist) {
		super();
		Image = image;
		Verify = verify;
		this.billlist = billlist;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVerify() {
		return Verify;
	}

	public void setVerify(String verify) {
		Verify = verify;
	}

	@Override
	public String toString() {
		return "QrCode [id=" + id + ", Image=" + Image + ", Verify=" + Verify + "]";
	}

}
