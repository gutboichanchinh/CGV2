package my.com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.*;

@Repository
public class ComboDAOImpl implements ComboDAO {
	
    @Autowired
    private SessionFactory sessionFactory;
	@Override
	
	public boolean saveOrUpdateCombo(Combo entity) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(entity);
		return true;
	}
	
	@Override
	
    public List<Combo> listAllCombo() {

        Session session = sessionFactory.getCurrentSession();

        String sql = "SELECT e.* FROM Combo e";
        NativeQuery<Combo> nativequeryHql = session.createNativeQuery(sql, Combo.class);
        List<Combo> datas = nativequeryHql.getResultList();
        return datas;
    }
    
	@Override
	
    public Combo findComboById(int id) {
        Session session = sessionFactory.getCurrentSession();

        Combo entity = session.get(Combo.class, id);
        return entity;
    }
	
	@Override
  
	public boolean deleteCombo(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		Combo entity =session.get(Combo.class, id);
		if (entity != null) {
		session.remove(entity);
		return true;
		}
		 return false;
	}
	

	
}
