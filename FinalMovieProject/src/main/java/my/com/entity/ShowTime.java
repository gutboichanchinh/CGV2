package my.com.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class ShowTime {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	@Column(name = "RoomId", columnDefinition = "int", unique = false, nullable = false)
	private int RoomId;
	@Column(name = "Time", columnDefinition = "nvarchar(100)", unique = false, nullable = false)
	private String Time;
	@Column(name = "IdMovie", columnDefinition = "int", unique = false, nullable = false)
	private int IdMovie;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "Day", columnDefinition = "date", unique = false, nullable = false)
	private LocalDate Day;

	@OneToMany(mappedBy = "showtime")
	private List<TicketMovie> listTicketMovies;

	public List<TicketMovie> getListTicketMovies() {
		return listTicketMovies;
	}

	public void setListTicketMovies(List<TicketMovie> listTicketMovies) {
		this.listTicketMovies = listTicketMovies;
	}

	@ManyToOne
	@JoinColumn(name = "RoomId", insertable = false, updatable = false)
	private Room showtime;

	@ManyToOne
	@JoinColumn(name = "IdMovie", insertable = false, updatable = false)
	private Movie showtimemovie;

	public ShowTime() {
		// TODO Auto-generated constructor stub
	}

	public ShowTime(int roomId, String time, int idMovie, LocalDate day) {
		super();

		RoomId = roomId;
		Time = time;
		IdMovie = idMovie;
		Day = day;
	}

	public ShowTime(int id, int roomId, String time, int idMovie, LocalDate day) {
		super();
		Id = id;
		RoomId = roomId;
		Time = time;
		IdMovie = idMovie;
		Day = day;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getRoomId() {
		return RoomId;
	}

	public void setRoomId(int roomId) {
		RoomId = roomId;
	}

	public String getTime() {
		return Time;
	}

	public void setTime(String time) {
		Time = time;
	}

	public int getIdMovie() {
		return IdMovie;
	}

	public void setIdMovie(int idMovie) {
		IdMovie = idMovie;
	}

	public LocalDate getDay() {
		return Day;
	}

	public void setDay(LocalDate day) {
		Day = day;
	}

}
