package my.com.service;

import java.util.List;
import java.util.Set;

import my.com.entity.Movie;
import my.com.entity.TypeMovie;

public interface CategoryMovieService {

	
	public List<Movie> findAll();
	public List<Movie> findMovieShowing();
	public List<Movie> findMovieComing();
	public Movie findMovieById(int id);
	public boolean createMovie(Movie movie);
	public boolean deleteMovie(int id);
	public boolean editMovie(Movie movie);
	public List<TypeMovie> findAllTypeMovie();
	public TypeMovie findTypeById(int id);
	public Set<Movie> finDistinsts();
	public List<Movie> findDistinsts();
}
