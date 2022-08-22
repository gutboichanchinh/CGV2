package my.com.service;

import java.io.File;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.com.dao.QrCodeReponsitory;
import my.com.entity.Bill;
import my.com.entity.QrCode;

@Service
public class QrCodeServiceImpl implements QrCodeService {

	@Autowired
	QrCodeReponsitory codeReponsitory;

	@Override
	@Transactional
	public void add(File file, Bill bill) {
		codeReponsitory.add(file, bill);
	}

	@Override
	@Transactional
	public QrCode getCode() {
		return codeReponsitory.getCode();
	}

}
