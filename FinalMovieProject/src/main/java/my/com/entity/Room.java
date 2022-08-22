package my.com.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Room {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "RoomName", columnDefinition = "nvarchar(100)", unique = false, nullable = false)
	private String RoomName;
	@Column(name = "Row", columnDefinition = "int", unique = false, nullable = false)
	private int Row;
	@Column(name = "Coluum", columnDefinition = "int", unique = false, nullable = false)
	private int Coluum;

	@OneToMany(mappedBy = "ticket")
	private List<Ticket> listTickets;
	
	@OneToMany(mappedBy = "showtime")
	private List<ShowTime> listShowTime;
	
	
	
	
	public List<ShowTime> getListShowTime() {
		return listShowTime;
	}

	public void setListShowTime(List<ShowTime> listShowTime) {
		this.listShowTime = listShowTime;
	}

	public List<Ticket> getListTickets() {
		return listTickets;
	}

	public void setListTickets(List<Ticket> listTickets) {
		this.listTickets = listTickets;
	}

	public Room() {

	}

	public Room(int id, String roomName, int row, int coluum) {
		super();
		this.id = id;
		RoomName = roomName;
		Row = row;
		Coluum = coluum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoomName() {
		return RoomName;
	}

	public void setRoomName(String roomName) {
		RoomName = roomName;
	}

	public int getRow() {
		return Row;
	}

	public void setRow(int row) {
		Row = row;
	}

	public int getColuum() {
		return Coluum;
	}

	public void setColuum(int coluum) {
		Coluum = coluum;
	}

	@Override
	public String toString() {
		return "Room [id=" + id + ", RoomName=" + RoomName + ", Row=" + Row + ", Coluum=" + Coluum + "]";
	}

}
