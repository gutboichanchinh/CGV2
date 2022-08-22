package my.com.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import my.com.entity.People;
@Repository
public class UserDaoImpl implements UserDao  {
	
	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	PasswordEncoder passwordEncoder;

	
	@Override
	public People checkLogin(String username,String password) {
		try {
			if(!sessionFactory.getCurrentSession().getTransaction().isActive())
				sessionFactory.getCurrentSession().getTransaction().begin();
			Query q = sessionFactory.getCurrentSession().createQuery(
					"from People c where c.UserName= :us and c.Password = :pwd"
					);
			q.setString("us",username);
			q.setString("pwd",password);
			return (People) q.getSingleResult();
		}catch (Exception e) {
			return null;
		}
}

	
	@Override
	public People register(People people) {
		Session session = sessionFactory.getCurrentSession();
		people.setPassword(passwordEncoder.encode(people.getPassword()));
		session.save(people);
		return people;
	}




	@Override
	public People findByUsername(String username) {
		String hql = "SELECT c FROM People c WHERE c.UserName = :us";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<People> q = session.createQuery(hql,People.class);
		q.setParameter("us", username);
 		try {
 			return q.getSingleResult();
 		}catch (Exception e) {
			// TODO: handle exception
		}
 		return null;
	}




	@Override
	public People findByGmail(String gmail) {
		String hql = "SELECT c FROM People c WHERE c.Gmail = :gm";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<People> q = session.createQuery(hql,People.class);
		q.setParameter("gm", gmail);
 		try {
 			return q.getSingleResult();
 		}catch (Exception e) {
			// TODO: handle exception
		}
 		return null;
	}




	@Override
	public People findByPhone(String phone) {
		String hql = "SELECT c FROM People c WHERE c.Phone = :ph";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<People> q = session.createQuery(hql,People.class);
		q.setParameter("ph", phone);
 		try {
 			return q.getSingleResult();
 		}catch (Exception e) {
			// TODO: handle exception
		}
 		return null;
	}
	@Override
	public List<People> findAll() {
		String hql = "from People p";
		Session session = sessionFactory.getCurrentSession();
		Query<People> q=session.createQuery(hql,People.class);
		List<People> list = q.getResultList(); 
		
		return list;
	}
}
