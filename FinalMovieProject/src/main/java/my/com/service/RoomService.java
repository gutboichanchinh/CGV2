package my.com.service;

import java.util.List;

import my.com.entity.Room;

public interface RoomService {
	public List<Room> findAll();
	public Room findById(int id);
	public void saveOrUpdate(Room room);
	public void delete(int id);
}
