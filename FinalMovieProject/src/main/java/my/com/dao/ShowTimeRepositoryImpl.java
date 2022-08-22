package my.com.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.ShowTime;

@Repository
public class ShowTimeRepositoryImpl implements ShowTimeRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(ShowTime showTime) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(showTime);
	}

	@Override
	@SuppressWarnings("unchecked")
	public ShowTime getLast() {
		List<ShowTime> showTimes = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		showTimes = session.createQuery("select p from ShowTime p order by p.Id desc").getResultList();
		return showTimes.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShowTime> findByShowTimeDayAndMovie(LocalDate day, int movie) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("select p from ShowTime p where p.Day = :ngay and p.IdMovie = :movie")
				.setParameter("movie", movie).setParameter("ngay", day).getResultList();

	}

	@Override
	public List<ShowTime> findByDay(LocalDate day) {
		Session session = sessionFactory.getCurrentSession();
		List<ShowTime> list = session.createQuery("select p from ShowTime p where p.Day = :ngay", ShowTime.class)
				.setParameter("ngay", day).getResultList();
		return list;
	}

	@Override
	public ShowTime find(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.find(ShowTime.class, id);
	}

	@Override
	public List<ShowTime> findAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("select p from ShowTime p order by p.Day desc", ShowTime.class).getResultList();
	}

	@Override
	public void delete(ShowTime showTime) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(showTime);
	}

}
