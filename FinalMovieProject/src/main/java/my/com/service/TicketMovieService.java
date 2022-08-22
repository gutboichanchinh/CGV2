package my.com.service;

import java.util.List;

import my.com.entity.TicketMovie;

public interface TicketMovieService {
	public void add(TicketMovie ticketMovie);
	public List<TicketMovie> findByIdShow(int id);
	public void update(int id);
	public TicketMovie findByIdShowAndNameSeat(int id, String name);
	public void delete(int id);
}
