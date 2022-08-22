package my.com.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Movie;
import my.com.entity.People;
import my.com.entity.TypeMovie;

@Repository
public class CategoryMovieImpl implements CategoryMovie {

	@Autowired
	SessionFactory sessionFactory;
	
	

	@Override
	public List<Movie> findAll() {
//		String hql = "from Movie  join movieTypes on Movie.IDMovie = movieTypes.movie_id order by Category asc";
		String hql = "select c from Movie c";
		Session session = sessionFactory.getCurrentSession();
		Query<Movie> q=session.createQuery(hql,Movie.class);
		List<Movie> list = q.getResultList(); 
		return list;
	}

	@Override
	public Set<Movie> finDistinsts() {
		Session session = sessionFactory.getCurrentSession();
		List<Movie> list = session.createQuery("select c from Movie c left outer join c.movieTypes order by c.category", Movie.class).getResultList();
		Set<Movie> set =  new HashSet<Movie>();
		for (Movie movie : list) {
			set.add(movie);
		}
		for (Movie movie : set) {
			System.out.println(movie);
		}
		return set;
	}

	
	@Override
	public List<Movie> findMovieShowing() {
		String hql = "from Movie c where c.category = 1 ";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<Movie> q=session.createQuery(hql,Movie.class);
		List<Movie> list = q.getResultList(); 
		
		return list;
	}

	@Override
	public List<Movie> findMovieComing() {
		String hql = "from Movie where category = 2 ";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<Movie> q=session.createQuery(hql,Movie.class);
		List<Movie> list = q.getResultList(); 
		
		return list;
	}

	@Override
	public boolean createMovie(Movie movie) {
		Session session = sessionFactory.getCurrentSession();
		session.save(movie);
		return true;
	}

	@Override
	public List<TypeMovie> findAllTypeMovie() {
		String hql = "from TypeMovie";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<TypeMovie> q=session.createQuery(hql,TypeMovie.class);
		List<TypeMovie> list = q.getResultList();
		return list;
	}

	@Override
	public TypeMovie findTypeById(int id) {
		String hql = "SELECT c FROM TypeMovie c WHERE c.id = :id";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<TypeMovie> q = session.createQuery(hql,TypeMovie.class);
		q.setParameter("id", id);
 		try {
 			return q.getSingleResult();
 		}catch (Exception e) {
			// TODO: handle exception
		}
 		return null;	
}

	@Override
	public boolean deleteMovie(int id) {
		Movie movie = findMovieById(id);
		movie.setCategory(3);
		Session session = sessionFactory.getCurrentSession();
		session.update(movie);
		return true;
	}


	@Override
	public boolean editMovie(Movie movie) {
		Session session = sessionFactory.getCurrentSession();
		session.update(movie);
		return true;
	}

	@Override
	public Movie findMovieById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Movie movie = session.get(Movie.class, id);
		return movie;
	}
	
	@Override
	public List<Movie> findDistinsts() {
		Session session = sessionFactory.getCurrentSession();
		List<Movie> list = session.createQuery("select c from Movie c left outer join c.movieTypes order by c.category desc", Movie.class).getResultList();
		Set<Movie> set1 =  new HashSet<Movie>();
		Set<Movie> set2 =  new HashSet<Movie>();
		Set<Movie> set3 =  new HashSet<Movie>();
//		for (Movie movie : list) {
//			System.out.println(movie);
//		}
		for (Movie movie : list) {
			if(movie.getCategory()==1) {
			set1.add(movie);
			}
			if (movie.getCategory()==2) {
				set2.add(movie);
			}
			if (movie.getCategory()==3) {
				set3.add(movie);
			}
		}
		
		
		
		List<Movie> listMovie = new ArrayList<Movie>();
		listMovie.addAll(set1);
		listMovie.addAll(set2);
		listMovie.addAll(set3);

		
		return  listMovie;
	}
	



	
	
}
