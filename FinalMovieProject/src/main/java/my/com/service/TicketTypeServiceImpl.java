package my.com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.dao.TicketTypeRepoImpl;
import my.com.entity.TicketType;

@Service
public class TicketTypeServiceImpl {

	@Autowired
	private TicketTypeRepoImpl ticketTypeRepoImpl;

	@Transactional
	public List<TicketType> listAll() {
		return ticketTypeRepoImpl.listAll();
	}

	@Transactional
	public TicketType findById(int id) {
		return ticketTypeRepoImpl.findById(id);
	}

	@Transactional
	public boolean add(TicketType entity) {
		return ticketTypeRepoImpl.add(entity);
	}

	@Transactional
	public boolean update(TicketType entity) {
		return ticketTypeRepoImpl.update(entity);
	}

	@Transactional
	public boolean delete(int id) {
		return ticketTypeRepoImpl.delete(id);
	}
}
