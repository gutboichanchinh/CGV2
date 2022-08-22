package my.com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.entity.Ticket;
import my.com.dao.TicketReponsitory;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketReponsitory reponsitory;

	@Override
	@Transactional
	public void addTicket(Ticket ticket) {
		reponsitory.addTicket(ticket);
	}

	@Override
	@Transactional
	public void delete(int id) {
		List<Ticket> list = findByRoomId(id);
		for (Ticket ticket : list) {
			reponsitory.delete(ticket);
		}
	}

	@Override
	@Transactional
	public List<Ticket> findByRoomId(int id) {
		return reponsitory.findByRoomId(id);
	}

}
