package my.com.dao;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;
import javax.xml.transform.Result;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Bill;

@Repository
public class StatisticDAOImpl implements StatisticDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Bill> findAll() {
		String hql = "from Bill b order by b.Day desc";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<Bill> q = session.createQuery(hql,Bill.class);
		List<Bill> list = q.getResultList();
		return list;
	}

	@Override
	public List<Bill> findBillByIdMovie(int idMovie) {
		String hql = "from Bill b where b.IdMovie = :id";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<Bill> q = session.createQuery(hql,Bill.class);
		q.setParameter("id", idMovie);
		try {
			return q.getResultList();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public List<Bill> findBillByDay(LocalDate date) {
		String hql = "from Bill b where b.Day = :d";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<Bill> q = session.createQuery(hql,Bill.class);
		q.setParameter("d", date);
		try {
			return q.getResultList();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}



}
