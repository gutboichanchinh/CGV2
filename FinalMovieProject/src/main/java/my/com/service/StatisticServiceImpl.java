package my.com.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import my.com.dao.StatisticDAO;
import my.com.entity.Bill;

@Service
public class StatisticServiceImpl implements StatisticService {
	
	@Autowired
	private StatisticDAO staDao;
	
	@Override
	@Transactional
	public List<Bill> findAll() {
		
		return staDao.findAll();
	}

	@Override
	@Transactional
	public List<Bill> findBillByIdMovie(int idMovie) {
		// TODO Auto-generated method stub
		return staDao.findBillByIdMovie(idMovie);
	}

	@Override
	@Transactional
	public List<Bill> findBillByDay(LocalDate date) {
		// TODO Auto-generated method stub
		return staDao.findBillByDay(date);
	}


	
}
