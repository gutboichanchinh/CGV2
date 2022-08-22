package my.com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.TicketType;

@Repository
public class TicketTypeRepoImpl {

	@Autowired
	private SessionFactory sf;

	public List<TicketType> listAll() {
		Session session = sf.getCurrentSession();
		String sql = "SELECT t FROM TicketType t";
//		Query<TicketType> query = session.createNativeQuery(sql, TicketType.class);
		Query<TicketType> query = session.createQuery(sql, TicketType.class);
		List<TicketType> entities = query.getResultList();
		return entities;
	}

	public TicketType findById(int id) {
		Session session = sf.getCurrentSession();
		TicketType entity = session.get(TicketType.class, id);
		return entity;
	}

	public boolean add(TicketType entity) {

		Session session = sf.getCurrentSession();

		session.save(entity);
		// session.saveOrUpdate(entity);

		return true;
	}

	public boolean update(TicketType entity) {
		Session session = sf.getCurrentSession();
		session.update(entity);
		return true;
	}

	public boolean delete(int id) {
		Session session = sf.getCurrentSession();
		TicketType ticketType = session.get(TicketType.class, id);
		if (ticketType != null) {
			session.remove(ticketType);
		}
		return true;
	}
}
