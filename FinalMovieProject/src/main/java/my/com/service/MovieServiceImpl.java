package my.com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.dao.MovieRepoImpl;
import my.com.dao.MovieReponsitory;
import my.com.entity.Movie;
import my.com.entity.TicketType;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieRepoImpl impl;
	@Autowired
	private MovieReponsitory movieReponsitory;
	@Transactional
	public Movie findMovie(int id) {
		return impl.findMovie(id);
	}
	
	@Transactional
	public boolean delete(int id) {
		return impl.delete(id);
	}

	@Override
	@Transactional
	public List<Movie> findMovie() {
		return movieReponsitory.findMovie();
	}

	@Override
	@Transactional
	public Movie findMovieById(int id) {
		return movieReponsitory.findMovieById(id);
	}
}
