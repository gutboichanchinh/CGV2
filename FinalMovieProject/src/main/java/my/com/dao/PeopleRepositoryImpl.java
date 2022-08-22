package my.com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import my.com.entity.People;

@Repository
public class PeopleRepositoryImpl implements PeopleRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public People findById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.find(People.class, id);
	}

	@Override
	public void saveOrUpdate(People people) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(people);
	}

	@Override
	public People findByGmail(String gmail) {
		try {
			Session session = sessionFactory.getCurrentSession();
			return session.createQuery("select p from People p where p.Gmail = :gmail", People.class)
					.setParameter("gmail", gmail).getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void updatePassword(String pass, String gmail) {
		Session session = sessionFactory.getCurrentSession();
		String passen = passwordEncoder.encode(pass);
		@SuppressWarnings("rawtypes")
		Query query = session.createQuery("UPDATE People set Password=:password where Gmail=:email")
				.setParameter("password", passen).setParameter("email", gmail);
		System.out.println(query.executeUpdate());
	}
}
