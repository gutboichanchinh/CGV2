package my.com.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.entity.People;
import my.com.dao.PeopleRepository;

@Service
public class PeopleServiceImpl implements PeopleService {
	
	@Autowired
	private PeopleRepository peopleRepository;

	@Override
	@Transactional
	public People findById(int id) {
		return peopleRepository.findById(id);
	}

	@Override
	@Transactional
	public void saveOrUpdate(People people) {
		peopleRepository.saveOrUpdate(people);
	}

	@Override
	@Transactional
	public People findByGmail(String gmail) {
		return peopleRepository.findByGmail(gmail);
	}

	@Override
	@Transactional
	public void updatePassword(String pass, String gmail) {
		peopleRepository.updatePassword(pass, gmail);
	}
}
