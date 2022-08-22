package my.com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Ticket {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "NameSeat", columnDefinition = "nvarchar(100)", unique = false, nullable = false)
	private String NameSeat;

	@Column(name = "RoomId", columnDefinition = "int", unique = false, nullable = false)
	private int RoomId;

	@Column(name = "Status", columnDefinition = "bit", unique = false, nullable = false)
	private boolean Status;

	@ManyToOne
	@JoinColumn(name = "RoomId", insertable = false, updatable = false)
	private Room ticket;

	public int getRoomId() {
		return RoomId;
	}

	public void setRoomId(int roomId) {
		RoomId = roomId;
	}

	public Room getTicket() {
		return ticket;
	}

	public void setTicket(Room ticket) {
		this.ticket = ticket;
	}

	public Ticket() {

	}




	public Ticket(String nameSeat, int roomId, boolean status) {
		super();
		NameSeat = nameSeat;
		RoomId = roomId;
		Status = status;
	}

	public boolean isStatus() {
		return Status;
	}

	public void setStatus(boolean status) {
		Status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameSeat() {
		return NameSeat;
	}

	public void setNameSeat(String nameSeat) {
		NameSeat = nameSeat;
	}

	@Override
	public String toString() {
		return "Ticket [id=" + id + ", NameSeat=" + NameSeat + ", Status=" + Status + "]";
	}

}
