package my.com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Event;

@Repository
public class EventDAOImpl implements EventDAO {
	
    @Autowired
    private SessionFactory sessionFactory;
	@Override
	
	public boolean saveOrUpdateEvent(Event entity) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(entity);
		return true;
	}
	
	@Override
	
    public List<Event> listAllEvent() {

        Session session = sessionFactory.getCurrentSession();

        String sql = "SELECT e.* FROM Event e";
        NativeQuery<Event> nativequeryHql = session.createNativeQuery(sql, Event.class);
        List<Event> datas = nativequeryHql.getResultList();
        return datas;
    }
    
	@Override
	
    public Event findEventById(int id) {
        Session session = sessionFactory.getCurrentSession();

        Event entity = session.get(Event.class, id);
        return entity;
    }
	
	@Override
  
	public boolean deleteEvent(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		Event entity =session.get(Event.class, id);
		if (entity != null) {
		session.remove(entity);
		return true;
		}
		 return false;
	}
	

	
}
