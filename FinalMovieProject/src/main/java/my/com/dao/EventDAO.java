package my.com.dao;


import java.util.List;

import my.com.entity.Event;

public interface EventDAO {
	
	public boolean saveOrUpdateEvent(Event event);

	
	public boolean deleteEvent(int id);
	
	public Event findEventById(int id) ;
	
	public List<Event> listAllEvent();
}
