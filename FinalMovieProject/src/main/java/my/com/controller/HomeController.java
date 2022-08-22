package my.com.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.paypal.base.codec.binary.Base64;

import my.com.entity.ConvertImg;
import my.com.entity.Movie;
import my.com.service.CategoryMovieService;
import my.com.service.MovieService;

@Controller
public class HomeController {

	@Autowired
	CategoryMovieService cateService;
	
	
	@Autowired
	MovieService movieService;

	@RequestMapping(value = { "/home", "/" })
	public String Home(Model model, HttpSession s, Principal principal) {
		List<Movie> movie1 = movieService.findMovie();
		List<Movie> movie2 = cateService.findMovieShowing();
		List<Movie> movie4 = cateService.findMovieComing();
		List<ConvertImg> list = new ArrayList<>();
		List<ConvertImg> list2 = new ArrayList<>();
		List<ConvertImg> list4 = new ArrayList<>();
		List<ConvertImg> listbaner = new ArrayList<>();
		for (Movie movie : movie1) {
			try {
				list.add(new ConvertImg(encodeFileToBase64Binary(movie.getPoster())));
				listbaner.add(new ConvertImg(encodeFileToBase64Binary(movie.getBanner())));
			} catch (Exception e) {
			}
		}
		for (Movie movie : movie2) {
			try {
				list2.add(new ConvertImg(encodeFileToBase64Binary(movie.getPoster())));
			} catch (Exception e) {
			}
		}
		for (Movie movie : movie4) {
			try {
				list4.add(new ConvertImg(encodeFileToBase64Binary(movie.getPoster())));
			} catch (Exception e) {
			}
		}
		for (Movie movie : movie4) {
			System.out.println(movie.toString());
		}
		model.addAttribute("listBanner", listbaner);
		model.addAttribute("listimage", list);
		model.addAttribute("listimage2", list2);
		model.addAttribute("listimage4", list4);
		model.addAttribute("movie1", movie1);
		model.addAttribute("movie2", movie2);
		model.addAttribute("movie4", movie4);
		return "Customer/Home";
	}

	private String encodeFileToBase64Binary(byte[] bytes) throws Exception {

		return new String(Base64.encodeBase64(bytes), "UTF-8");
	}

	@RequestMapping(value = { "/home/introdution" })
	public String intro() {
		return "Customer/Intro";
	}

	@RequestMapping(value = { "/home/contact" })
	public String contact() {
		return "Customer/Contact";
	}

}
