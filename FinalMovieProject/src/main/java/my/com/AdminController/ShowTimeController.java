package my.com.AdminController;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.base.codec.binary.Base64;

import my.com.entity.Combo;
import my.com.entity.ConvertImg;
import my.com.entity.Movie;
import my.com.entity.Room;
import my.com.entity.ShowTime;
import my.com.entity.Ticket;
import my.com.entity.TicketMovie;
import my.com.service.CategoryMovieService;
import my.com.service.ComboService;
import my.com.service.MovieService;
import my.com.service.RoomService;
import my.com.service.ShowTimeService;
import my.com.service.TicketMovieService;
import my.com.service.TicketService;

@Controller
public class ShowTimeController {
	LocalDate dayDate = LocalDate.now();

	String session;
	String sessionGmail;

	@Autowired
	private ComboService comboService;

	@Autowired
	private ShowTimeService showTimeService;

	@Autowired
	private RoomService roomService;

	@Autowired
	private TicketMovieService movieService;

	@Autowired
	private TicketService ticketService;

	@Autowired
	private MovieService movieService2;

	@Autowired
	private CategoryMovieService categoryMovieService;

	@RequestMapping("/admin/showtime")
	public String viewShowTime(Model model, @RequestParam(name = "mess") int mess) {
		List<ShowTime> list = showTimeService.findAll();
		List<Movie> movies = categoryMovieService.findAll();
		model.addAttribute("listshowtime", list);
		model.addAttribute("listmovie", movies);
		switch (mess) {
		case 1:
			model.addAttribute("mess", "Xóa thành công");
			break;
		case 2:
			model.addAttribute("mess", "Xóa không thành công vì đã có người đặt vé");
			break;
		case 3:
			model.addAttribute("mess", "Chỉnh sửa thành công");
			break;
		case 4:
			model.addAttribute("mess", "Thêm thành công");
			break;
		default:
			model.addAttribute("mess", "");
			break;
		}
		return "Admin/ViewShowTime";
	}

	@RequestMapping("/deleteshowtime")
	public String delete(@RequestParam(name = "id") int id, Model model) {
		int count = 0;
		List<TicketMovie> list = movieService.findByIdShow(id);
		for (TicketMovie ticketMovie : list) {
			if (ticketMovie.isStatus() == true) {
				count++;
			}
		}

		if (count == 0) {
			movieService.delete(id);
			showTimeService.delete(id);
			List<ShowTime> list2 = showTimeService.findAll();
			model.addAttribute("listshowtime", list2);
			return "redirect:/admin/showtime?mess=1";
		} else {
			List<ShowTime> list2 = showTimeService.findAll();
			model.addAttribute("listshowtime", list2);
			return "redirect:/admin/showtime?mess=2";
		}

	}

	@PostMapping("/addshow")
	public String addShow(@RequestParam(name = "roomshow") int idroom, @RequestParam(name = "idmovie") int idmovie,
			@ModelAttribute(value = "roomform") @Valid ShowTime showTime) {
		System.out.println(showTime.getDay());
		List<Ticket> listSeat = ticketService.findByRoomId(idroom);
		showTimeService.add(new ShowTime(idroom, showTime.getTime(), idmovie, showTime.getDay()));
		ShowTime showTime2 = showTimeService.getLast();
		for (Ticket ticket : listSeat) {
			movieService
					.add(new TicketMovie(showTime2.getId(), idroom, false, ticket.isStatus(), ticket.getNameSeat()));
		}
		return "redirect:/admin/showtime?mess=4";
	}

	@PostMapping("/editshow")
	public String editShow(@RequestParam(name = "roomshow") int idroom, @RequestParam(name = "idmovie") int idmovie,
			@ModelAttribute(value = "roomform") @Valid ShowTime showTime) {
		List<Ticket> listSeat = ticketService.findByRoomId(idroom);
		showTimeService.add(new ShowTime(showTime.getId(), idroom, showTime.getTime(), idmovie, showTime.getDay()));
		return "redirect:/admin/showtime?mess=3";
	}

	@RequestMapping("/admin/addshowtimepage")
	public String showtimepage(Model model) {
		List<Movie> movies = movieService2.findMovie();
		List<Room> room = roomService.findAll();
		model.addAttribute("rooms", room);
		model.addAttribute("movie", movies);
		model.addAttribute("roomform", new ShowTime());
		return "Admin/AddShowTime";
	}

	@RequestMapping("/admin/edit/showtime")
	public String editShowtime(@RequestParam(name = "id") int id, Model model) {
		List<Movie> movies = movieService2.findMovie();
		List<Room> room = roomService.findAll();
		model.addAttribute("rooms", room);
		model.addAttribute("movie", movies);
		model.addAttribute("roomform", showTimeService.find(id));
		return "Admin/EditShowTime";
	}

	@RequestMapping("/viewshowtime")
	public String showtimehomepage(Model model, @RequestParam(name = "place") int place) {
		LocalDate day2Date;
		int a = dayDate.getDayOfMonth() + place;
		if (a > dayDate.lengthOfMonth()) {
			int b = a - dayDate.lengthOfMonth();
			int c = dayDate.getMonthValue() + 1;
			if (c > 12) {
				day2Date = LocalDate.of(dayDate.getYear() + 1, 1, b);
			} else {
				day2Date = LocalDate.of(dayDate.getYear(), c, b);
			}
		} else {
			day2Date = LocalDate.of(dayDate.getYear(), dayDate.getMonth(), dayDate.getDayOfMonth() + place);
		}
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		Date date = new Date(System.currentTimeMillis());
		String aString = formatter.format(date);
		List<ShowTime> listshowTimes = showTimeService.findByDay(day2Date);
		List<ShowTime> listshowTimes2 = new ArrayList<>();
		for (ShowTime showTime : listshowTimes) {
			if (aString.compareTo(showTime.getTime()) == (-1)) {
				listshowTimes2.add(showTime);
			}
		}
		List<Movie> listMovie = new ArrayList<>();
		for (ShowTime showTime : listshowTimes2) {
			Movie movie = movieService2.findMovieById(showTime.getIdMovie());
			System.out.println("!!!!2"+movie);
			listMovie.add(movie);
			
		}
		System.out.println("!!!!!!1"+listMovie);
		List<Room> room = roomService.findAll();
		List<ConvertImg> listanh = new ArrayList<>();
		for (Movie convertImg : listMovie) {
			try {
				listanh.add(new ConvertImg(encodeFileToBase64Binary(convertImg.getPoster())));
			} catch (Exception e) {
			}
		}
		model.addAttribute("linkanh", listanh);
		model.addAttribute("rooms", room);
		model.addAttribute("listmovies", listMovie);
		model.addAttribute("listshowtimes", listshowTimes2);
		return "Customer/ShowTime";
	}

	@PostMapping("/viewshowtime2")
	public String showtimehomepage2(Model model, @RequestParam(name = "place") int place) {
		LocalDate day2Date;

		int a = dayDate.getDayOfMonth() + place;
		if (a > dayDate.lengthOfMonth()) {
			int b = a - dayDate.lengthOfMonth();
			int c = dayDate.getMonthValue() + 1;
			if (c > 12) {
				day2Date = LocalDate.of(dayDate.getYear() + 1, 1, b);
			} else {
				day2Date = LocalDate.of(dayDate.getYear(), c, b);
			}
		} else {
			day2Date = LocalDate.of(dayDate.getYear(), dayDate.getMonth(), dayDate.getDayOfMonth() + place);
		}
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		Date date = new Date(System.currentTimeMillis());
		String aString = formatter.format(date);
		List<ShowTime> listshowTimes = showTimeService.findByDay(day2Date);
		List<ShowTime> listshowTimes2 = new ArrayList<>();
		for (ShowTime showTime : listshowTimes) {
			if (aString.compareTo(showTime.getTime()) == (-1)) {
				listshowTimes2.add(showTime);
			}
		}
		List<Movie> listMovie = new ArrayList<>();
		for (ShowTime showTime : listshowTimes2) {
			Movie movie = movieService2.findMovieById(showTime.getIdMovie());
			listMovie.add(movie);
		}
		List<Room> room = roomService.findAll();
		List<ConvertImg> listanh = new ArrayList<>();
		for (Movie convertImg : listMovie) {
			try {
				listanh.add(new ConvertImg(encodeFileToBase64Binary(convertImg.getPoster())));
			} catch (Exception e) {
			}
		}

		model.addAttribute("linkanh", listanh);
		model.addAttribute("rooms", room);
		model.addAttribute("listmovies", listMovie);
		model.addAttribute("listshowtimes", listshowTimes2);
		if (listshowTimes == null) {
			return "Customer/Ajaxnone";
		} else {
			return "Customer/AjaxShowTime";
		}
	}

	@RequestMapping("/viewshowtime3")
	public String showtimehomepage3(Model model, @RequestParam(name = "place") int place,
			@RequestParam(name = "idmovie") int idmovie) {
		LocalDate day2Date;
		int a = dayDate.getDayOfMonth() + place;
		if (a > dayDate.lengthOfMonth()) {
			int b = a - dayDate.lengthOfMonth();
			int c = dayDate.getMonthValue() + 1;
			if (c > 12) {
				day2Date = LocalDate.of(dayDate.getYear() + 1, 1, b);
			} else {
				day2Date = LocalDate.of(dayDate.getYear(), c, b);
			}
		} else {
			day2Date = LocalDate.of(dayDate.getYear(), dayDate.getMonth(), dayDate.getDayOfMonth() + place);
		}

		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		Date date = new Date(System.currentTimeMillis());
		String aString = formatter.format(date);
		List<ShowTime> listshowTimes = showTimeService.findByDay(day2Date);
		List<ShowTime> listshowTimes2 = new ArrayList<>();
		for (ShowTime showTime : listshowTimes) {
			if (aString.compareTo(showTime.getTime()) == (-1)) {
				listshowTimes2.add(showTime);
			}
		}
		List<Movie> listMovie = new ArrayList<>();
		for (ShowTime showTime : listshowTimes2) {
			Movie movie = movieService2.findMovieById(showTime.getIdMovie());
			listMovie.add(movie);
		}
		List<Room> room = roomService.findAll();
		List<ConvertImg> listanh = new ArrayList<>();
		for (Movie convertImg : listMovie) {
			try {
				listanh.add(new ConvertImg(encodeFileToBase64Binary(convertImg.getPoster())));
			} catch (Exception e) {
			}
		}
		model.addAttribute("linkanh", listanh);
		model.addAttribute("rooms", room);
		model.addAttribute("listmovies", listMovie);
		model.addAttribute("listshowtimes", listshowTimes2);
		return "Customer/ShowTimeMovie";
	}

	@PostMapping("/viewshowtime4")
	public String showtimehomepage4(Model model, @RequestParam(name = "place") int place,
			@RequestParam(name = "idmovie") int idmovie) {
		LocalDate day2Date;
		int a = dayDate.getDayOfMonth() + place;
		if (a > dayDate.lengthOfMonth()) {
			int b = a - dayDate.lengthOfMonth();
			int c = dayDate.getMonthValue() + 1;
			if (c > 12) {
				day2Date = LocalDate.of(dayDate.getYear() + 1, 1, b);
			} else {
				day2Date = LocalDate.of(dayDate.getYear(), c, b);
			}
		} else {
			day2Date = LocalDate.of(dayDate.getYear(), dayDate.getMonth(), dayDate.getDayOfMonth() + place);
		}

		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		Date date = new Date(System.currentTimeMillis());
		String aString = formatter.format(date);
		List<ShowTime> listshowTimes = showTimeService.findByShowTimeDayAndMovie(day2Date, idmovie);
		List<ShowTime> listshowTimes2 = new ArrayList<>();
		for (ShowTime showTime : listshowTimes) {
			if (aString.compareTo(showTime.getTime()) == (-1)) {
				listshowTimes2.add(showTime);
			}
		}
		List<Movie> listMovie = new ArrayList<>();
		for (ShowTime showTime : listshowTimes2) {
			Movie movie = movieService2.findMovieById(showTime.getIdMovie());
			listMovie.add(movie);
		}
		List<Room> room = roomService.findAll();
		List<ConvertImg> listanh = new ArrayList<>();
		for (Movie convertImg : listMovie) {
			try {
				listanh.add(new ConvertImg(encodeFileToBase64Binary(convertImg.getPoster())));
			} catch (Exception e) {
			}
		}
		model.addAttribute("linkanh", listanh);
		model.addAttribute("rooms", room);
		model.addAttribute("listmovies", listMovie);
		model.addAttribute("listshowtimes", listshowTimes2);
		return "Customer/AjaxShowTime";

	}

	@RequestMapping("/viewseatchoice")
	public String viewSeatChoice(Model model, @RequestParam(name = "idshow") int idshow, Principal principal) {
//		if (principal == null) {
//			return "Page/Login";
//		} else {
		List<TicketMovie> list = movieService.findByIdShow(idshow);
		List<Combo> datas = comboService.listAllCombo();
		Room room = roomService.findById(list.get(0).getRoomId());
		ShowTime showTime = showTimeService.find(idshow);
		Movie movie = movieService2.findMovieById(showTime.getIdMovie());
		try {
			String aString = encodeFileToBase64Binary(movie.getBanner());
			model.addAttribute("anhphim", aString);
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<ConvertImg> convertImgs = new ArrayList<>();
		for (Combo convertImg : datas) {
			try {
				convertImgs.add(new ConvertImg(encodeFileToBase64Binary(convertImg.getComboImage())));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		model.addAttribute("listimg", convertImgs);
		model.addAttribute("show", showTime);
		model.addAttribute("idshow", idshow);
		model.addAttribute("listseat", list);
		model.addAttribute("row", room.getRow());
		model.addAttribute("coluum", room.getColuum());
		model.addAttribute("room", room);
		model.addAttribute("movie", movie);
		model.addAttribute("listcombo", datas);
		return "Customer/Seat";

	}

	private String encodeFileToBase64Binary(byte[] bytes) throws Exception {

		return new String(Base64.encodeBase64(bytes), "UTF-8");
	}

}
