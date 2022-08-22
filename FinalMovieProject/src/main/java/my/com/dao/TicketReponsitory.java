package my.com.dao;

import java.util.List;

import my.com.entity.Ticket;

public interface TicketReponsitory {
	public void addTicket(Ticket ticket);
	public void delete(Ticket ticket);
	public List<Ticket> findByRoomId(int id);
}
