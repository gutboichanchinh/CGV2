package my.com.AdminController;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
import java.sql.Blob;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.codec.binary.Base64;

import my.com.entity.Bill;
import my.com.entity.Movie;
import my.com.entity.OrderDetail;
import my.com.entity.PayPalServer;
import my.com.entity.People;
import my.com.entity.QrCode;
import my.com.entity.Room;
import my.com.entity.ShowTime;
import my.com.entity.TicketMovie;
import my.com.service.BillService;
import my.com.service.MovieService;
import my.com.service.QrCodeService;
import my.com.service.RoomService;
import my.com.service.ShowTimeService;
import my.com.service.TicketMovieService;
import my.com.service.UserService;

@Controller
public class BillController {
	@Autowired
	UserService userService;
	@Autowired
	TicketMovieService movieService;

	@Autowired
	RoomService roomService;

	@Autowired
	MovieService movieService2;

	@Autowired
	QrCodeService codeService;

	@Autowired
	ShowTimeService showTimeService;

	@Autowired
	BillService billService;

	@Autowired
	private ServletContext servletContext;

	int countreview = 0;
	String aStringre = "";
	ShowTime isShowTimere = new ShowTime();
	List<Room> roomsreList = new ArrayList<>();
	List<Movie> moviesreList = new ArrayList<>();
	String aString2reString = "";
	String seatliString = "";
	String descripString = "";
	int pricecombo = 0;

	@RequestMapping("/checkbill")
	public String checkbill(@RequestParam(value = "listseatinput") String a, @RequestParam(value = "idshow") int idshow,
			@RequestParam(value = "descripcombo") String description, @RequestParam(value = "pricecombo") int price,
			Model model) {
		List<String> listseat = Arrays.asList(a.split(","));
		List<TicketMovie> list = new ArrayList<>();
		int normal = 0;
		int vip = 0;
		for (String string : listseat) {
			list.add(movieService.findByIdShowAndNameSeat(idshow, string));
		}
		for (TicketMovie ticketMovie : list) {
			if (ticketMovie.isIsVip() == true) {
				vip++;
			} else {
				normal++;
			}
		}
		int count = (vip * 60) + (normal * 45);
		countreview = count;
		String aString = "(x" + vip + "vip*60k)(x" + normal + " thường*45k)";
		aStringre = aString;
		ShowTime isShowTime = showTimeService.find(idshow);
		isShowTimere = isShowTime;
		List<Room> rooms = roomService.findAll();
		roomsreList = rooms;
		List<Movie> movies = movieService2.findMovie();
		moviesreList = movies;
		String aString2 = isShowTime.getDay().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
		aString2reString = aString2;
		seatliString = a;
		descripString = description;
		pricecombo = price;
		model.addAttribute("descrip", description);
		model.addAttribute("pricecombo", price);
		model.addAttribute("status", 1);
		model.addAttribute("listmovie", movies);
		model.addAttribute("roomlist", rooms);
		model.addAttribute("seatlist", a);
		model.addAttribute("count", count);
		model.addAttribute("typeseat", aString);
		model.addAttribute("day", aString2);
		model.addAttribute("idshow", isShowTime);
		return "Customer/Payment";
	}

	@RequestMapping("/sendpayment")
	public String checkPayment(@RequestParam(value = "payment") int a,
			@RequestParam(value = "description") String description, @RequestParam(value = "subtotal") String subtotal,
			@RequestParam(value = "fee") String fee, Model model) {

		float sup = Float.parseFloat(subtotal);
		float fee2 = Float.parseFloat(fee);
		sup = (float) (sup * 0.043);
		fee2 = (float) (fee2 * 0.043);
		float total = sup + fee2;
		String supString = String.valueOf(sup);
		String feeString = String.valueOf(fee2);
		String totalString = String.valueOf(total);
		if (a == 1) {
			String aString = paymentPayPal(
					new OrderDetail("thanh toan ve", description, supString, feeString, totalString), model);
			return "redirect:" + aString;
		} else {
			return "Customer/Home";
		}
	}

	private String paymentPayPal(OrderDetail orderDetail, Model model) {
		try {
			PayPalServer palServer = new PayPalServer();
			String appprovalLink = palServer.authorizePayment(orderDetail);
			return appprovalLink;
		} catch (Exception e) {
			model.addAttribute("mess", e);
			return "Customer/Error";
		}

	}

	@RequestMapping("/reviewpayment")
	public String reviewPatment(Model model, @RequestParam(value = "paymentId") String paymentid,
			@RequestParam(value = "PayerID") String payerid) {
		try {
			PayPalServer palServer = new PayPalServer();
			Payment payment = palServer.getPaymentDetails(paymentid);
			System.out.println(payerid);
			System.out.println(paymentid);
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			model.addAttribute("descrip", descripString);
			model.addAttribute("pricecombo", pricecombo);
			model.addAttribute("payer", payerInfo);
			model.addAttribute("transaction", transaction);
			model.addAttribute("status", 2);
			model.addAttribute("listmovie", moviesreList);
			model.addAttribute("roomlist", roomsreList);
			model.addAttribute("seatlist", seatliString);
			model.addAttribute("count", countreview);
			model.addAttribute("typeseat", aStringre);
			model.addAttribute("day", aString2reString);
			model.addAttribute("idshow", isShowTimere);
			model.addAttribute("paymentId", paymentid);
			model.addAttribute("PayerID", payerid);
			return "Customer/Payment";
		} catch (Exception e) {
			return "Customer/Error";
		}
	}

	String ticString = "";
	String comString = "";
	String seatString = "";
	String paymentString = "";
	String payString = "";
	int a,b,c,d = 0;

	@RequestMapping("/excusepayment")
	public String excusePayment(Model model, @RequestParam(value = "ticket") String ticket,
			@RequestParam(value = "idshow") int id, @RequestParam(value = "combodes") String combodes,
			@RequestParam(value = "seatdes") String seatdes, @RequestParam(value = "fee") int fee,
			@RequestParam(value = "subtotal") int suptotal, @RequestParam(value = "paymentId") String paymentid,
			@RequestParam(value = "PayerID") String payerid, @RequestParam(value = "idmovie") int idmovie) {
		PayPalServer palServer = new PayPalServer();
		try {
			Payment payment = palServer.executePayment(paymentid, payerid);
			ticString = ticket;
			comString = combodes;
			seatString = seatdes;
			paymentString = paymentid;
			payString = payerid;
			a=id;
			b=fee;
			c=suptotal;
			d=idmovie;
		} catch (Exception e) {
			return "Customer/Error";
		}
		return "redirect:/finishpayment";
	}

	@SuppressWarnings("deprecation")
	@RequestMapping("/finishpayment")
	public String excusePayment22(Model model, Principal principal) {
		List<String> aList = Arrays.asList(ticString.split(","));
		List<TicketMovie> list = new ArrayList<>();
		LocalDate day = LocalDate.now();
		try {
			float total = b + c;
			String user = null;
			user = principal.getName();
			People people = userService.findByUsername(user);
			Bill listBill = new Bill(b, c, seatString, comString, total, day, people.getIDUser(), d);
			for (String string : aList) {
				TicketMovie ticketMovie = movieService.findByIdShowAndNameSeat(a, string);
				list.add(ticketMovie);
				listBill.getBillSeats().add(ticketMovie);
				ticketMovie.getTicketMovies().add(listBill);
			}
			this.billService.add(listBill);
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix matrix = qrCodeWriter.encode(listBill.toString(), BarcodeFormat.QR_CODE, 200, 200);
			String relativeWebPath = "/resourses/IMG";
			String absoluteFilePath = servletContext.getRealPath(relativeWebPath);
			File file = new File(absoluteFilePath + "/Qr2.png");
			System.out.println(file);
			MatrixToImageWriter.writeToFile(matrix, "PNG", file);
			codeService.add(file, listBill);
			QrCode qrCode = codeService.getCode();
			System.out.println(qrCode);

			try {
				FileOutputStream fileOutputStream = new FileOutputStream(file);
				fileOutputStream.write(qrCode.getImage());
				fileOutputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			String aString = encodeFileToBase64Binary(qrCode.getImage());
			changeStatus(list);
			model.addAttribute("imagebase", aString);
			model.addAttribute("listmovie", moviesreList);
			model.addAttribute("roomlist", roomsreList);
			model.addAttribute("seatlist", seatliString);
			model.addAttribute("day", aString2reString);
			model.addAttribute("idshow", isShowTimere);
			return "Customer/Finish";
		} catch (Exception e) {
			model.addAttribute("mess", e);
			return "Customer/Error";
		}

	}

	@SuppressWarnings("unused")
	private void changeStatus(List<TicketMovie> list) {
		for (TicketMovie ticketMovie : list) {
			this.movieService.update(ticketMovie.getId());
		}
	}

	private String encodeFileToBase64Binary(byte[] bytes) throws Exception {

		return new String(Base64.encodeBase64(bytes), "UTF-8");
	}
}
