package my.com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import my.com.dao.ComboDAO;
import my.com.entity.Combo;

@Repository
public class ComboServiceImpl implements ComboService{
	@Autowired
	private ComboDAO comboDAO;
	
	@Override
	 @Transactional
	public boolean saveOrUpdateCombo(Combo Combo) {
		return comboDAO.saveOrUpdateCombo(Combo);
		
	}
	
	
	@Override
	 @Transactional
    public List<Combo> listAllCombo() {

        List<Combo> datas = comboDAO.listAllCombo();
        return datas;
    }
    
	@Override
	 @Transactional
    public Combo findComboById(int id) {

		Combo entity = comboDAO.findComboById(id);

        return entity;
    }
	
	@Override
	 @Transactional
	public boolean deleteCombo(int id) {
		boolean check = comboDAO.deleteCombo(id);
		return check;
	}
	
}
