package my.com.dao;

import java.io.File;

import my.com.entity.Bill;
import my.com.entity.QrCode;


public interface QrCodeReponsitory {
	public void add(File file,Bill bill);
	public QrCode getCode();
}
