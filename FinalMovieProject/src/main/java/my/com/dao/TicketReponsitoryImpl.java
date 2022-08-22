package my.com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Ticket;

@Repository
public class TicketReponsitoryImpl implements TicketReponsitory{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addTicket(Ticket ticket) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(ticket);
	}

	@Override
	public void delete(Ticket ticket) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(ticket);
	}

	@Override
	public List<Ticket> findByRoomId(int id) {
		Session session = sessionFactory.getCurrentSession();
		List<Ticket> list = session.createQuery("select p from Ticket p where p.RoomId = :roomid", Ticket.class).setParameter("roomid", id).getResultList();
		return list;
	}

}
