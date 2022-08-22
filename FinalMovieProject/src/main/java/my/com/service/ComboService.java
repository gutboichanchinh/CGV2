package my.com.service;

import java.util.List;

import my.com.entity.*;

public interface ComboService {
	public boolean saveOrUpdateCombo(Combo combo);
	
	public List<Combo> listAllCombo();
	
	public Combo findComboById(int id);
	
	public boolean deleteCombo(int id);
	
	
}
