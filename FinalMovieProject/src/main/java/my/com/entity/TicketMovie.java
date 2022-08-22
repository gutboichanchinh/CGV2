package my.com.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity(name = "TicketMovie")
public class TicketMovie {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	@Column(name = "ShowId", columnDefinition = "int", unique = false, nullable = false)
	private int ShowId;
	
	@Column(name = "RoomId", columnDefinition = "int", unique = false, nullable = false)
	private int RoomId;
	
	@Column(name = "Status", columnDefinition = "bit", unique = false, nullable = false)
	private boolean Status;
	
	@Column(name = "IsVip", columnDefinition = "bit", unique = false, nullable = false)
	private boolean IsVip;
	
	@Column(name = "NameSeat", columnDefinition = "nvarchar(100)", unique = false, nullable = false)
	private String NameSeat;
	
	@Column(name = "BillId", columnDefinition = "int", unique = false, nullable = true)
	private int BillId;
	
	@ManyToOne
	@JoinColumn(name = "ShowId", insertable = false, updatable = false)
	private ShowTime showtime;
	
	
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "billSeats")
    private Set<Bill> ticketMovies = new HashSet<>();
	
	
	
	public Set<Bill> getTicketMovies() {
		return ticketMovies;
	}



	public void setTicketMovies(Set<Bill> ticketMovies) {
		this.ticketMovies = ticketMovies;
	}



	public TicketMovie() {
		// TODO Auto-generated constructor stub
	}
	
	

	public int getBillId() {
		return BillId;
	}



	public void setBillId(int billId) {
		BillId = billId;
	}




	public TicketMovie(int showId, int roomId, boolean status, boolean isVip, String nameSeat) {
		super();
		ShowId = showId;
		RoomId = roomId;
		Status = status;
		IsVip = isVip;
		NameSeat = nameSeat;

	}

	
	
	public TicketMovie(int id, int showId, int roomId, boolean status, boolean isVip, String nameSeat, int billId) {
		super();
		Id = id;
		ShowId = showId;
		RoomId = roomId;
		Status = status;
		IsVip = isVip;
		NameSeat = nameSeat;
		BillId = billId;
	}



	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getShowId() {
		return ShowId;
	}

	public void setShowId(int showId) {
		ShowId = showId;
	}

	public int getRoomId() {
		return RoomId;
	}

	public void setRoomId(int roomId) {
		RoomId = roomId;
	}

	public boolean isStatus() {
		return Status;
	}

	public void setStatus(boolean status) {
		Status = status;
	}


	public String getNameSeat() {
		return NameSeat;
	}


	public void setNameSeat(String nameSeat) {
		NameSeat = nameSeat;
	}




	public boolean isIsVip() {
		return IsVip;
	}




	public void setIsVip(boolean isVip) {
		IsVip = isVip;
	}




	@Override
	public String toString() {
		return "TicketMovie [Id=" + Id + ", ShowId=" + ShowId + ", RoomId=" + RoomId + ", Status=" + Status + ", IsVip="
				+ IsVip + ", NameSeat=" + NameSeat + "]";
	}


	

	
	
}
