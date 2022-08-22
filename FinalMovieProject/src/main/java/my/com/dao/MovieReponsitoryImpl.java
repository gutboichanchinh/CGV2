package my.com.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Movie;

@Repository
public class MovieReponsitoryImpl implements MovieReponsitory{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Movie> findMovie() {
		Session session = sessionFactory.getCurrentSession();
		List<Movie> list = session.createQuery("Select p from Movie p where p.category = 1 or p.category = 2", Movie.class).getResultList();
		return list;
	}

	@Override
	public Movie findMovieById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("Select p from Movie p where p.id = :idmovie",Movie.class).setParameter("idmovie", id).getSingleResult();
	}

}
