package my.com.service;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.entity.ShowTime;
import my.com.dao.ShowTimeRepository;

@Service
public class ShowTimeServiceImpl implements ShowTimeService {

	@Autowired
	private ShowTimeRepository repository;

	@Override
	@Transactional
	public void add(ShowTime showTime) {
		repository.add(showTime);
	}

	@Override
	@Transactional
	public ShowTime getLast() {
		return repository.getLast();
	}

	@Override
	@Transactional
	public List<ShowTime> findByShowTimeDayAndMovie(LocalDate day,int movie) {
		return repository.findByShowTimeDayAndMovie(day, movie);
	}

	@Override
	@Transactional
	public List<ShowTime> findByDay(LocalDate day) {
		return repository.findByDay(day);
	}

	@Override
	@Transactional
	public ShowTime find(int id) {
		return repository.find(id);
	}

	@Override
	@Transactional
	public List<ShowTime> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional
	public void delete(int id) {
		repository.delete(find(id));
	}

}
