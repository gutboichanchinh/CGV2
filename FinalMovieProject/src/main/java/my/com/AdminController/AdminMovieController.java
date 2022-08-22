package my.com.AdminController;

import java.io.File;
import java.io.FileInputStream;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.paypal.base.codec.binary.Base64;

import my.com.entity.Movie;
import my.com.entity.TypeMovie;
import my.com.service.CategoryMovieService;

@Controller
@RequestMapping(path = { "/admin/movie" })
public class AdminMovieController {

	@Autowired
	CategoryMovieService cateService;
	  @Autowired
	    private ServletContext servletContext;

	@GetMapping(value = { "/show" })
	public String showMovie(Model model) {
//		List<Movie> list = cateService.findAll();
		List<Movie> list = cateService.findDistinsts();

		model.addAttribute("list", list);

		return "Admin/ListMovie";
	}

	@GetMapping(value = { "/add" })
	public String showEdit(Model model) {
		List<TypeMovie> type = cateService.findAllTypeMovie();
		model.addAttribute("type", type);
		for (TypeMovie typeMovie : type) {
			System.out.println(typeMovie.toString());
		}
		return "Admin/addMovie";
	}

	@PostMapping(value = { "/add" })
	public String doEdit(Model model, HttpServletRequest request, Movie movie,
			@RequestParam(name = "anhdoc") MultipartFile poster,
			@RequestParam(name = "anhngang") MultipartFile banner) {
		String time = "^[1-9]\\d*$";
		LocalDate current = LocalDate.now();
		Set<TypeMovie> newset = new HashSet<TypeMovie>();
		String[] a = request.getParameterValues("movieTypes1");
		if (a == null) {
			List<TypeMovie> type1 = cateService.findAllTypeMovie();
			model.addAttribute("type", type1);
			model.addAttribute("msg", "Vui lòng chọn thể loại");
			return "Admin/addMovie";
		} else {
			for (int i = 0; i < a.length; i++) {
				System.out.println(a[i]);
				newset.add(cateService.findTypeById(Integer.parseInt(a[i])));
			}
			if (movie.getName().trim().isEmpty() || movie.getTime().trim().isEmpty()
					|| movie.getActor().trim().isEmpty() || movie.getDirector().trim().isEmpty()
					|| movie.getCountry().equals("select country")) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Vui lòng điền đầy đủ thông tin");
				return "Admin/addMovie";
			} else if (movie.getTime().length() > 5 || !movie.getTime().matches(time)) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Vui lòng nhập đúng thời lượng");
				return "Admin/addMovie";
			} else if (movie.getDateOpen().compareTo(current) < 0) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Vui lòng nhập đúng ngày chiếu");
				return "Admin/addMovie";
			} else if (movie.getYear().length() > 5 && !movie.getYear().matches(time)) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Vui lòng nhập đúng năm");
				return "Admin/addMovie";
			} else if (!poster.getOriginalFilename().endsWith(".png") && !poster.getOriginalFilename().endsWith(".gif")
					&& !poster.getOriginalFilename().endsWith(".jpg") && !poster.getOriginalFilename().endsWith(".jpeg")
					&& !poster.getOriginalFilename().endsWith(".pmb")) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Poster không đúng định dạng");
				return "Admin/addMovie";
			} else if (!banner.getOriginalFilename().endsWith(".png") && !banner.getOriginalFilename().endsWith(".gif")
					&& !banner.getOriginalFilename().endsWith(".jpg") && !banner.getOriginalFilename().endsWith(".jpeg")
					&& !banner.getOriginalFilename().endsWith(".pmb")) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Banner không đúng định dạng");
				return "Admin/addMovie";
			} else {
				String relativeWebPath = "/resourses/IMG";
                String absoluteFilePath = servletContext.getRealPath(relativeWebPath);
                File file2 = new File(absoluteFilePath + "/Qr2.png");
				try {
					poster.transferTo(file2);
				} catch (Exception e) {
				}
				byte[] bs = new byte[(int) file2.length()];
				try {
					FileInputStream fileInputStream = new FileInputStream(file2);
					fileInputStream.read(bs);
					fileInputStream.close();
				} catch (Exception e) {

				}
				try {
					banner.transferTo(file2);
				} catch (Exception e) {
				}
				byte[] bs2 = new byte[(int) file2.length()];
				try {
					FileInputStream fileInputStream = new FileInputStream(file2);
					fileInputStream.read(bs2);
					fileInputStream.close();
				} catch (Exception e) {

				}
				cateService.createMovie(new Movie(movie.getName(), newset, movie.getCountry(), movie.getYear(),
						movie.getDateOpen(), movie.getTime(), movie.getLanguage(), movie.getDirector(),
						movie.getActor(), movie.getDescription(), bs, bs2, movie.getCategory(), movie.getTralier()));
			}
			return "redirect:/admin/movie/show";
		}
	}

	@RequestMapping(path = { "/delete/{id}" })
	public String deleteMovie(Model model, Movie movie) {
		System.out.println(movie.getId());
		cateService.deleteMovie(movie.getId());
		return "redirect:/admin/movie/show";

	}

	@GetMapping(path = { "/edit/{id}" })
	public String showEditMovie(Model model, Movie movie) {
		Movie a = cateService.findMovieById(movie.getId());
		System.out.println(a.toString());
		System.out.println(movie.getId());
		List<TypeMovie> type = cateService.findAllTypeMovie();

		try {
			String poster = encodeFileToBase64Binary(a.getPoster());
			String bannerString = encodeFileToBase64Binary(a.getBanner());
			model.addAttribute("banner", bannerString);
			model.addAttribute("poster", poster);
		} catch (Exception e) {
		}
		model.addAttribute("type", type);
		model.addAttribute("list", a);
		return "Admin/editMovie";

	}

	private String encodeFileToBase64Binary(byte[] bytes) throws Exception {
		return new String(Base64.encodeBase64(bytes), "UTF-8");
	}

	@PostMapping(path = { "/edit/{id}" })
	public String doEditMovie(Model model, Movie movie, HttpServletRequest request,
			@RequestParam(name = "anhdoc") MultipartFile poster,
			@RequestParam(name = "anhngang") MultipartFile banner) {
		Movie a = cateService.findMovieById(movie.getId());
		model.addAttribute("list", a);

		Set<TypeMovie> newset = new HashSet<TypeMovie>();
		String time = "^[1-9]\\d*$";
		LocalDate current = LocalDate.now();
		String[] a1 = request.getParameterValues("movieTypes1");
		if (a1 == null) {
			List<TypeMovie> type1 = cateService.findAllTypeMovie();
			model.addAttribute("type", type1);
			model.addAttribute("msg", "Vui lòng chọn thể loại");
			return "Admin/editMovie";

		} else {
			for (int i = 0; i < a1.length; i++) {
				System.out.println(a1[i]);
				newset.add(cateService.findTypeById(Integer.parseInt(a1[i])));
			}
			if (movie.getName().trim().isEmpty() || movie.getTime().trim().isEmpty()
					|| movie.getActor().trim().isEmpty() || movie.getDirector().trim().isEmpty()
					|| movie.getCountry().equals("select country")) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Vui lòng điền đầy đủ thông tin");
				return "Admin/editMovie";
			} else if (movie.getTime().length() > 5 || !movie.getTime().matches(time)) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Vui lòng nhập đúng thời lượng");
				return "Admin/editMovie";
			} else if (movie.getDateOpen().compareTo(current) < 0) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Vui lòng nhập đúng ngày chiếu");
				return "Admin/editMovie";
			} else if (movie.getYear().length() > 5 && !movie.getYear().matches(time)) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Vui lòng nhập đúng năm");
				return "Admin/editMovie";
			} else if (!poster.getOriginalFilename().endsWith(".png") && !poster.getOriginalFilename().endsWith(".gif")
					&& !poster.getOriginalFilename().endsWith(".jpg") && !poster.getOriginalFilename().endsWith(".jpeg")
					&& !poster.getOriginalFilename().endsWith(".pmb")) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Poster không đúng định dạng");
				return "Admin/editMovie";
			} else if (!banner.getOriginalFilename().endsWith(".png") && !banner.getOriginalFilename().endsWith(".gif")
					&& !banner.getOriginalFilename().endsWith(".jpg") && !banner.getOriginalFilename().endsWith(".jpeg")
					&& !banner.getOriginalFilename().endsWith(".pmb")) {
				List<TypeMovie> type1 = cateService.findAllTypeMovie();
				model.addAttribute("type", type1);
				model.addAttribute("msg", "Banner không đúng định dạng");
				return "Admin/editMovie";
			} else {
				movie.setMovieTypes(newset);

				String relativeWebPath = "/resourses/IMG";
                String absoluteFilePath = servletContext.getRealPath(relativeWebPath);
                File file2 = new File(absoluteFilePath + "/Qr2.png");
				try {
					poster.transferTo(file2);
				} catch (Exception e) {
				}
				byte[] bs = new byte[(int) file2.length()];
				try {
					FileInputStream fileInputStream = new FileInputStream(file2);
					fileInputStream.read(bs);
					fileInputStream.close();
				} catch (Exception e) {

				}
				try {
					banner.transferTo(file2);
				} catch (Exception e) {
				}
				byte[] bs2 = new byte[(int) file2.length()];
				try {
					FileInputStream fileInputStream = new FileInputStream(file2);
					fileInputStream.read(bs2);
					fileInputStream.close();
				} catch (Exception e) {

				}
				System.out.println(newset);
				cateService.editMovie(new Movie(movie.getId(), movie.getName(), newset, movie.getCountry(),
						movie.getYear(), movie.getDateOpen(), movie.getTime(), movie.getLanguage(), movie.getDirector(),
						movie.getActor(), movie.getDescription(), bs, bs2, movie.getCategory(), movie.getTralier()));
				return "redirect:/admin/movie/show";
			}
		}
	}
}
