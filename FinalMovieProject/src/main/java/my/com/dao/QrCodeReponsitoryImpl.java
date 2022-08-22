package my.com.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.com.entity.Bill;
import my.com.entity.QrCode;


@Repository
public class QrCodeReponsitoryImpl implements QrCodeReponsitory {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void add(File file, Bill bill) {
		Session session = sessionFactory.getCurrentSession();
		byte[] imageData = new byte[(int) file.length()];
		try {
		    FileInputStream fileInputStream = new FileInputStream(file);
		    fileInputStream.read(imageData);
		    fileInputStream.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
		QrCode qrCode = new QrCode(imageData, "a", bill);
		session.saveOrUpdate(qrCode);
	}

	@SuppressWarnings("unchecked")
	@Override
	public QrCode getCode() {
		List<QrCode> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		list = session.createQuery("select p from QrCode p order by p.id desc").getResultList();
		
		return list.get(0);
	}

}
