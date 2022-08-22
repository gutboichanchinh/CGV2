package my.com.service;

import java.util.List;

import my.com.entity.People;


public interface UserService {
	
	public  People checkLogin(String username,String password);
	public People register(People people);
	public People findByUsername(String username);
	public People findByGmail(String gmail);
	public People findByPhone(String phone);
	public List<People> findAll();
}
