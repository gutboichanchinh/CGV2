package my.com.service;

import java.util.List;

import my.com.entity.Event;

public interface EventService {
	public boolean saveOrUpdateEvent(Event event);
	
	public List<Event> listAllEvent();
	
	public Event findEventById(int id);
	
	public boolean deleteEvent(int id);
	
	
}
