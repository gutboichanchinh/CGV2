package my.com.dao;

import java.util.List;

import my.com.entity.TicketMovie;

public interface TicketMovieReponsitory {
	public void add(TicketMovie ticketMovie);
	public List<TicketMovie> findByIdShow(int id);
	public void update(int id);
	public TicketMovie findByIdShowAndNameSeat(int id, String name);
	public void delete(TicketMovie ticketMovie);
}
