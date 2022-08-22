package my.com.service;

import my.com.entity.People;

public interface PeopleService {
	public People findById(int id);
	public void saveOrUpdate(People people);
	public People findByGmail(String gmail);
	public void updatePassword(String pass, String gmail);
}
