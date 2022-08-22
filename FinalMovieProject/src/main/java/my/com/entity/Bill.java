package my.com.entity;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity(name = "Bill")
public class Bill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "PriceCombo", columnDefinition = "float", unique = false, nullable = false)
	private float PriceCombo;
	@Column(name = "PriceSeat", columnDefinition = "float", unique = false, nullable = false)
	private float PriceSeat;
	@Column(name = "description_Seat", columnDefinition = "nvarchar(100)", unique = false, nullable = false)
	private String description_Seat;
	@Column(name = "description_Combo", columnDefinition = "nvarchar(100)", unique = false, nullable = false)
	private String description_Combo;
	@Column(name = "Total", columnDefinition = "float", unique = false, nullable = false)
	private float Total;

	@Column(name = "Day", columnDefinition = "date", unique = false, nullable = false)
	private LocalDate Day;

	@Column(name = "IdAccount", columnDefinition = "int", unique = false, nullable = false)
	private int IdAccount;

	@Column(name = "IdMovie", columnDefinition = "int", unique = false, nullable = false)
	private int IdMovie;

	@OneToOne(mappedBy = "billlist")
	private QrCode qrCode;

	@ManyToOne
	@JoinColumn(name = "IdAccount", insertable = false, updatable = false)
	private People bills;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "billSeats", joinColumns = {
			@JoinColumn(name = "bill_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "ticket_id", nullable = false, updatable = false) })
	private Set<TicketMovie> billSeats = new HashSet<>();

	public Bill() {
		// TODO Auto-generated constructor stub
	}

	public Bill(float priceCombo, float priceSeat, String description_Seat, String description_Combo, float total,
			LocalDate day, int idAccount, int idMovie) {
		super();
		PriceCombo = priceCombo;
		PriceSeat = priceSeat;
		this.description_Seat = description_Seat;
		this.description_Combo = description_Combo;
		Total = total;
		Day = day;
		IdAccount = idAccount;
		IdMovie = idMovie;
	}

	public Set<TicketMovie> getBillSeats() {
		return billSeats;
	}

	public void setBillSeats(Set<TicketMovie> billSeats) {
		this.billSeats = billSeats;
	}

	public int getIdMovie() {
		return IdMovie;
	}

	public void setIdMovie(int idMovie) {
		IdMovie = idMovie;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getPriceCombo() {
		return PriceCombo;
	}

	public void setPriceCombo(float priceCombo) {
		PriceCombo = priceCombo;
	}

	public float getPriceSeat() {
		return PriceSeat;
	}

	public void setPriceSeat(float priceSeat) {
		PriceSeat = priceSeat;
	}

	public String getDescription_Seat() {
		return description_Seat;
	}

	public void setDescription_Seat(String description_Seat) {
		this.description_Seat = description_Seat;
	}

	public String getDescription_Combo() {
		return description_Combo;
	}

	public void setDescription_Combo(String description_Combo) {
		this.description_Combo = description_Combo;
	}

	public float getTotal() {
		return Total;
	}

	public void setTotal(float total) {
		Total = total;
	}

	public LocalDate getDay() {
		return Day;
	}

	public void setDay(LocalDate day) {
		Day = day;
	}

	public int getIdAccount() {
		return IdAccount;
	}

	public void setIdAccount(int idAccount) {
		IdAccount = idAccount;
	}

	@Override
	public String toString() {
		return "Bill\n" + "ID bill=" + id + "\n" + "PriceCombo=" + PriceCombo + "\n" + "PriceSeat=" + PriceSeat + "\n"
				+ "description_Seat=" + description_Seat + "\n" + "description_Combo=" + description_Combo + "\n"
				+ "Total=" + Total;
	}

}
