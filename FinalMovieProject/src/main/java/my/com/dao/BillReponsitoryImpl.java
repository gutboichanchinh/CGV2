package my.com.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Bill;

@Repository
public class BillReponsitoryImpl implements BillReponsitory {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(Bill bill) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(bill);
	}

}
