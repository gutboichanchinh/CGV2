package my.com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.entity.Room;
import my.com.dao.RoomReponsitory;

@Service
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private RoomReponsitory reponsitory;

	@Override
	@Transactional
	public Room findById(int id) {
		return reponsitory.findById(id);
	}

	@Override
	@Transactional
	public void saveOrUpdate(Room room) {
		reponsitory.saveOrUpdate(room);
		
	}

	@Override
	@Transactional
	public List<Room> findAll() {
		return reponsitory.findAll();
	}

	@Override
	@Transactional
	public void delete(int id) {
		Room room = findById(id);
		if(room!=null) {
			reponsitory.delete(room);
		}
		
	}

}
