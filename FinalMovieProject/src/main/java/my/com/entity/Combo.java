package my.com.entity;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "Combo")
public class Combo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idCombo;

	@Column(name = "ComboName", columnDefinition = "nvarchar(400)", unique = false, nullable = false)
	private String comboName;

	@Column(name = "ComboDescription", columnDefinition = "nvarchar(400)", unique = false, nullable = false)
	private String comboDescription;

	@Column(name = "ComboPrice", columnDefinition = "nvarchar(20)", unique = false, nullable = false)
	private String comboPrice;

	@Column(name = "Number", columnDefinition = "nvarchar(10)", unique = false, nullable = false)
	private String number;

	@Lob
	private byte[] comboImage;

	public Combo() {
	}

	public Combo(int idCombo, String comboName, String comboDescription, String comboPrice, String number,
			byte[] comboImage) {
		super();
		this.idCombo = idCombo;
		this.comboName = comboName;
		this.comboDescription = comboDescription;
		this.comboPrice = comboPrice;
		this.number = number;
		this.comboImage = comboImage;
	}

	public Combo(String comboName, String comboDescription, String comboPrice, String number, byte[] comboImage) {
		super();
		this.comboName = comboName;
		this.comboDescription = comboDescription;
		this.comboPrice = comboPrice;
		this.number = number;
		this.comboImage = comboImage;
	}

	public int getIdCombo() {
		return idCombo;
	}

	public void setIdCombo(int idCombo) {
		this.idCombo = idCombo;
	}

	public String getComboName() {
		return comboName;
	}

	public void setComboName(String comboName) {
		this.comboName = comboName;
	}

	public String getComboDescription() {
		return comboDescription;
	}

	public void setComboDescription(String comboDescripion) {
		this.comboDescription = comboDescripion;
	}

	public String getComboPrice() {
		return comboPrice;
	}

	public void setComboPrice(String comboPrice) {
		this.comboPrice = comboPrice;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public byte[] getComboImage() {
		return comboImage;
	}

	public void setComboImage(byte[] comboImage) {
		this.comboImage = comboImage;
	}

	@Override
	public String toString() {
		return "Combo [idCombo=" + idCombo + ", comboName=" + comboName + ", comboDescription=" + comboDescription
				+ ", comboPrice=" + comboPrice + ", number=" + number + ", comboImage=" + Arrays.toString(comboImage)
				+ "]";
	}

}
