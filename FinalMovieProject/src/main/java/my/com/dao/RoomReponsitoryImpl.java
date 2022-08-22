package my.com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Room;

@Repository
public class RoomReponsitoryImpl implements RoomReponsitory{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Room findById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.find(Room.class, id);
	}

	@Override
	public void saveOrUpdate(Room room) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(room);
		
	}

	@Override
	public List<Room> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Room> lists = session.createQuery("SELECT p FROM Room p", Room.class).getResultList();
		return lists;
	}

	@Override
	public void delete(Room room) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(room);
	}

}
