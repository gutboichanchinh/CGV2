package my.com.dao;

import java.util.List;

import my.com.entity.Movie;

public interface MovieReponsitory {
	public List<Movie> findMovie();
	public Movie findMovieById(int id);
	
}
