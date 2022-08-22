package my.com.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Movie;
import my.com.entity.TicketType;
import my.com.entity.TypeMovie;

@Repository
public class MovieRepoImpl {

	@Autowired
	private SessionFactory sf;

//	@Transactional
//	public List<Movie> findAll() {
//		Session session = sf.getCurrentSession();
//
//		String hql = "SELECT m FROM Movie m";
//		Query<Movie> queryHql = session.createQuery(hql, Movie.class);
//		List<Movie> datas = queryHql.getResultList();
////		return session.createQuery("SELECT a FROM Movie a", Movie.class).getResultList();
//		for (Movie movie : datas) {
//			for (TypeMovie movie2 : movie.getMovieTypes()) {
//				movie2.getName();
//			}
//		}
//		return datas;
//	}

	public Movie findMovie(int id) {
		Session session = sf.getCurrentSession();
//		Movie entityMovie = session.get(Movie.class, id);
		String hql = "select c from Movie c join c.movieTypes f where c.id = :id";
		Query<Movie> movieQuery = session.createQuery(hql, Movie.class);
		movieQuery.setParameter("id", id);
		Movie movie = (Movie) movieQuery.uniqueResult();
		for (TypeMovie typeMovie : movie.getMovieTypes()) {
			typeMovie.getName();
		}
		return movie;
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
