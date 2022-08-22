package my.com.dao;

import java.util.List;

import my.com.entity.Room;

public interface RoomReponsitory {
	public List<Room> findAll();
	public Room findById(int id);
	public void saveOrUpdate(Room room);
	public void delete(Room room);
}
