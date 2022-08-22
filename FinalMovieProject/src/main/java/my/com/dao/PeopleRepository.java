package my.com.dao;


import my.com.entity.People;

public interface PeopleRepository {
	public People findById(int id);
	public void saveOrUpdate(People people);
	public People findByGmail(String gmail);
	public void updatePassword(String pass, String gmail);
}
