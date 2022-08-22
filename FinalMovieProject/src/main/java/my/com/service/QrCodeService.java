package my.com.service;

import java.io.File;

import my.com.entity.Bill;
import my.com.entity.QrCode;


public interface QrCodeService {
	public void add(File file,Bill bill);
	public QrCode getCode();
}
