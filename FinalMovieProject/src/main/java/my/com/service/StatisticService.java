package my.com.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.ejb.Local;

import my.com.entity.Bill;

public interface StatisticService {
	public List<Bill> findAll();
	public List<Bill> findBillByIdMovie(int idMovie);
	public List<Bill> findBillByDay(LocalDate date);
}
