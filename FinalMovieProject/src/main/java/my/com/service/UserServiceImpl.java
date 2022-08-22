package my.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import my.com.dao.UserDao;
import my.com.entity.Movie;
import my.com.entity.People;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	@Override
	@Transactional
	public People checkLogin(String username,String password) {
		People people = userDao.checkLogin(username, password);		
		return people;
	}

	@Override
	@Transactional
	public People register(People people) {		
		return userDao.register(people);
	}

	@Override
	@Transactional
	public People findByUsername(String username) {
		// TODO Auto-generated method stub
		
		return userDao.findByUsername(username);
	}

	@Override
	@Transactional
	public People findByGmail(String gmail) {
		// TODO Auto-generated method stub
		return userDao.findByGmail(gmail);
	}

	@Override
	@Transactional
	public People findByPhone(String phone) {
		// TODO Auto-generated method stub
		return userDao.findByPhone(phone);
	}

	@Override
	@Transactional
	public List<People> findAll() {
		return userDao.findAll();
	}

	
	
}
