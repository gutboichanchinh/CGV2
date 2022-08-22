package my.com.service;

import java.time.LocalDate;
import java.util.List;

import my.com.entity.ShowTime;

public interface ShowTimeService {
	public void add(ShowTime showTime);
	public ShowTime getLast();
	public List<ShowTime> findByShowTimeDayAndMovie(LocalDate day, int movie);
	public List<ShowTime> findByDay(LocalDate day);
	public ShowTime find(int id);
	public List<ShowTime> findAll();
	public void delete(int id);
}
