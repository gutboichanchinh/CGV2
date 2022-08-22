package my.com.dao;


import java.util.List;

import my.com.entity.*;

public interface ComboDAO {
	
	public boolean saveOrUpdateCombo(Combo combo);

	
	public boolean deleteCombo(int id);
	
	public Combo findComboById(int id) ;
	
	public List<Combo> listAllCombo();
}
