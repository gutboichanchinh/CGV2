package my.com.AdminController;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import my.com.entity.Bill;
public class testfuntion {
	private static LocalDate localDate = LocalDate.now();
	
	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws WriterException, IOException {
		Bill bill = new Bill(23, 32, "phim hay", "phim hay", 30, localDate, 1, 1);
	    QRCodeWriter qrCodeWriter = new QRCodeWriter();
	    BitMatrix matrix = qrCodeWriter.encode(bill.toString(), BarcodeFormat.QR_CODE, 200, 200);
	    File file = new File("C:\\Users\\ASUS\\eclipse-workspace\\FinalMovieProject\\src\\main\\webapp\\resourses\\IMG\\", "Qr2.png");
	    MatrixToImageWriter.writeToFile(matrix, "PNG", file);
	}

}
