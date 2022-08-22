package my.com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import my.com.dao.EventDAO;
import my.com.entity.Event;

@Repository
public class EventServiceImpl implements EventService{
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	 @Transactional
	public boolean saveOrUpdateEvent(Event event) {
		System.out.println(event.getStartDay());
		return eventDAO.saveOrUpdateEvent(event);
		
	}
	
	
	@Override
	 @Transactional
    public List<Event> listAllEvent() {

        List<Event> datas = eventDAO.listAllEvent();
        return datas;
    }
    
	@Override
	 @Transactional
    public Event findEventById(int id) {

        Event entity = eventDAO.findEventById(id);

        return entity;
    }
	
	@Override
	 @Transactional
	public boolean deleteEvent(int id) {
		boolean check = eventDAO.deleteEvent(id);
		return check;
	}
	
}
