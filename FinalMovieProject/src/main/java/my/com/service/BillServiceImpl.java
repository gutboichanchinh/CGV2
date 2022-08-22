package my.com.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.entity.Bill;
import my.com.dao.BillReponsitory;

@Service
public class BillServiceImpl implements BillService {

	@Autowired
	BillReponsitory billReponsitory;

	@Override
	@Transactional
	public void add(Bill bill) {
		billReponsitory.add(bill);
	}

}
