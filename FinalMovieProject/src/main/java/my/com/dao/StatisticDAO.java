package my.com.dao;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import my.com.entity.Bill;

public interface StatisticDAO {
	
	public List<Bill> findAll();
	public List<Bill> findBillByIdMovie(int idMovie);
	public List<Bill> findBillByDay(LocalDate date);
}
