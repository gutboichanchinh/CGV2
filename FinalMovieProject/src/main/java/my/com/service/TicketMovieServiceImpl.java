package my.com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.entity.TicketMovie;
import my.com.dao.TicketMovieReponsitory;

@Service
public class TicketMovieServiceImpl implements TicketMovieService{
	
	@Autowired
	private TicketMovieReponsitory movieReponsitory;
	

	

	@Override
	@Transactional
	public void add(TicketMovie ticketMovie) {
		movieReponsitory.add(ticketMovie);
	}

	@Override
	@Transactional
	public List<TicketMovie> findByIdShow(int id) {
		return movieReponsitory.findByIdShow(id);
	}

	@Override
	@Transactional
	public void update(int id) {
		movieReponsitory.update(id);
		
	}

	@Override
	@Transactional
	public TicketMovie findByIdShowAndNameSeat(int id, String name) {
		return movieReponsitory.findByIdShowAndNameSeat(id, name);
	}

	@Override
	@Transactional
	public void delete(int id) {
		List<TicketMovie> list = findByIdShow(id);
		for (TicketMovie ticketMovie : list) {
			movieReponsitory.delete(ticketMovie);
		}
	}
}
