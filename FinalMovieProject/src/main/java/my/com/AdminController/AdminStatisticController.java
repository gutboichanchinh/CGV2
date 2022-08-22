package my.com.AdminController;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import my.com.entity.Bill;
import my.com.entity.Movie;
import my.com.entity.People;
import my.com.service.CategoryMovieService;
import my.com.service.StatisticService;
import my.com.service.UserService;
@Controller
@RequestMapping(path = {"/admin/statistic"})
public class AdminStatisticController {

	@Autowired
	StatisticService staService;
	
	@Autowired
	CategoryMovieService caService;
	
	@Autowired
	UserService userService;
	
	@GetMapping(value = {"/list"})
	public String showStatistic(Model model)  {
		List<Bill> list = staService.findAll();
		List<Movie> m = caService.findAll();
		List<People> p = userService.findAll();
		List<Integer> listID = new ArrayList<Integer>();
		float sumCom = 0;
		float sumTic = 0;
		float sum = 0;
		Map<Integer,Float> map = new HashMap<Integer,Float>();
		for (Bill bill : list) {
			sumCom += bill.getPriceCombo();
			sumTic += bill.getPriceSeat();
			sum += bill.getTotal();
			listID.add(bill.getIdMovie());			
			if(!map.containsKey(bill.getIdMovie())) {
				map.put(bill.getIdMovie(), bill.getPriceSeat());
			}else {
				float a = map.get(bill.getIdMovie()) + bill.getPriceSeat();
				map.replace(bill.getIdMovie(), a);
				
			}
		}
		
		model.addAttribute("map",map);
		model.addAttribute("sumC",sumCom);
		model.addAttribute("sumT",sumTic);
		model.addAttribute("sum",sum);
		model.addAttribute("m",m);
		model.addAttribute("people",p);
		model.addAttribute("list",list);
		return "Admin/Statistic";
	}

}
