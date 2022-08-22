package my.com.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;

import com.paypal.base.codec.binary.Base64;

import my.com.entity.ConvertImg;
import my.com.entity.Movie;
import my.com.service.CategoryMovieService;

@Controller
@RequestMapping(value = { "/home", "/" })
public class MovieController {

	@Autowired
	CategoryMovieService cateService;

	@RequestMapping(path = { "/showing" })
	public String Showing(Model model, Movie movie) {

//		System.out.println("1");
//		List<Movie> movie2 = cateService.findMovieShowing();
//		model.addAttribute("movie2",movie2);
		return "Customer/Home";
	}

//	@GetMapping(path = {"/showing"})
//	@ResponseBody
//	public  List<Movie> Showing() {
//		List<Movie> movie1 = cateService.findMovieShowing();
//		System.out.println(movie1);
//		return movie1;
//	}

	@RequestMapping(path = { "/coming" })
	public String Coming(Model model, Movie movie) {
//		System.out.println("1");
//		List<Movie> movie4 = cateService.findMovieComing();
//		System.out.println(movie4.toString());
//		model.addAttribute("movie4",movie4);
		return "Customer/Home";
	}

	@RequestMapping(path = { "/detail/{id}" })
	public String showAdd(Model model, @PathVariable(name = "id") String id) {
//		System.out.println(repoImpl.findMovie(2).getMovieTypes());
		int idInt = 0;
		try {
			idInt = Integer.parseInt(id);
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/home";
		}
		Movie movie = cateService.findMovieById(idInt);
		try {
			String convertImg = encodeFileToBase64Binary(movie.getPoster());
			model.addAttribute("anh",convertImg);
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("dto", movie);
		return "Customer/MovieDetail";

	}

	private String encodeFileToBase64Binary(byte[] bytes) throws Exception {

		return new String(Base64.encodeBase64(bytes), "UTF-8");
	}

}
