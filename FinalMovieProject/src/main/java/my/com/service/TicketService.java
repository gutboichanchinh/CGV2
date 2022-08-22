package my.com.service;

import java.util.List;

import my.com.entity.Ticket;

public interface TicketService {
	public void addTicket(Ticket ticket);
	public void delete(int id);
	public List<Ticket> findByRoomId(int id);
}
