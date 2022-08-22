package my.com.service;

import java.util.List;

import my.com.entity.Movie;

public interface MovieService {
	public List<Movie> findMovie();
	public Movie findMovieById(int id);
}
