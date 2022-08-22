package my.com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.TicketMovie;

@Repository
public class TicketMovieReponsitoryImpl implements TicketMovieReponsitory {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(TicketMovie ticketMovie) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(ticketMovie);
	}

	@Override
	public List<TicketMovie> findByIdShow(int id) {
		Session session = sessionFactory.getCurrentSession();
		List<TicketMovie> list = session
				.createQuery("select p from TicketMovie p where showid = :id", TicketMovie.class).setParameter("id", id)
				.getResultList();
		return list;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void update(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query =  session.createQuery("update TicketMovie set status = true where id = :id").setParameter("id", id);
		System.out.println(query.executeUpdate());
	}

	@Override
	public TicketMovie findByIdShowAndNameSeat(int id, String name) {
		Session session = sessionFactory.getCurrentSession();
		TicketMovie ticketMovie = session.createQuery("select p from TicketMovie p where showid = :id and nameSeat = :name", TicketMovie.class).setParameter("id", id).setParameter("name", name).getSingleResult();
		return ticketMovie;
	}

	@Override
	public void delete(TicketMovie ticketMovie) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(ticketMovie);
	}

}
