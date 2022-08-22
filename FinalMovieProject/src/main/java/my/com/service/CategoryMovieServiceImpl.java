package my.com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import my.com.dao.CategoryMovie;
import my.com.entity.Movie;
import my.com.entity.TypeMovie;

@Service
public class CategoryMovieServiceImpl implements CategoryMovieService {
	
	@Autowired
	private CategoryMovie cateDao;
	
	

	@Override
	@Transactional
	public List<Movie> findAll() {

		return cateDao.findAll();
	}
	
	@Override
	@Transactional
	public Set<Movie> finDistinsts() {
		return cateDao.finDistinsts();
	}

	@Override
	@Transactional
	public List<Movie> findMovieShowing() {
		// TODO Auto-generated method stub
		return cateDao.findMovieShowing();
	}

	@Override
	@Transactional
	public List<Movie> findMovieComing() {
		// TODO Auto-generated method stub
		return cateDao.findMovieComing();
	}

	@Override
	@Transactional
	public boolean createMovie(Movie movie) {	
		return cateDao.createMovie(movie);
	}

	@Override
	@Transactional
	public List<TypeMovie> findAllTypeMovie() {
		
		return cateDao.findAllTypeMovie();
	}

	@Override
	@Transactional
	public TypeMovie findTypeById(int id) {
		// TODO Auto-generated method stub
		return cateDao.findTypeById(id);
	}

	@Override
	@Transactional
	public boolean deleteMovie(int id) {
		// TODO Auto-generated method stub
		return cateDao.deleteMovie(id);
	}

	@Override
	@Transactional
	public boolean editMovie(Movie movie) {
		// TODO Auto-generated method stub
		return cateDao.editMovie(movie);
	}

	@Override
	@Transactional
	public Movie findMovieById(int id) {
		// TODO Auto-generated method stub
		return cateDao.findMovieById(id);
	}

	@Override
	@Transactional
	public List<Movie> findDistinsts() {
		// TODO Auto-generated method stub
		return cateDao.findDistinsts();
	}
	
	
}
