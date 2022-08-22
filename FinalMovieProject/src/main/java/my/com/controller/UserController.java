package my.com.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import my.com.entity.People;
import my.com.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/openLogin")
	public String login() {
		return "Page/Login";

	}

	@RequestMapping("/access")
	public String denied() {
		return "Page/403";

	}

	@GetMapping("/openRegister")
	public String register(Model model) {
		People p = new People();
		model.addAttribute("form", p);
		return "Page/Register";
	}

	@PostMapping("/register")
	public ModelAndView register(Model model, @ModelAttribute("register") People people, BindingResult res) {
		LocalDate current = LocalDate.now();
		String pattern = "^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$";
		System.out.println(current);
		if (people.getName().isEmpty() || people.getBirthDay() == null || people.getAddress().isEmpty()) {

			return new ModelAndView("Page/Register", "message", "Vui lòng nhập đúng yêu cầu");
		} else if (userService.findByUsername(people.getUserName()) != null || people.getUserName().trim().isEmpty()
				|| people.getUserName().length() > 12) {

			System.out.println(people.getUserName());
			return new ModelAndView("Page/Register", "message", "Tài khoản không đúng định dạng");
		} else if (people.getPassword().trim().isEmpty() || people.getPassword().length() > 10) {
			return new ModelAndView("Page/Register", "message", "Mật khẩu không đúng định dạng");
		} else if (people.getGmail().isEmpty() || userService.findByGmail(people.getGmail()) != null) {

			return new ModelAndView("Page/Register", "message", "Gmail không đúng hoặc đã tồn tại");
		} else if (people.getPhone().isEmpty() || userService.findByPhone(people.getPhone()) != null
				|| people.getPhone().length() != 10) {

			return new ModelAndView("Page/Register", "message", "Số điện thoại không đúng hoặc đã tồn tại");
		} else if (people.getBirthDay().compareTo(current) > 0) {

			return new ModelAndView("Page/Register", "message", "Ngày sinh không đúng");
		} else if (!people.getPhone().matches(pattern)) {
			return new ModelAndView("Page/Register", "message", "Số điện thoại không đúng");
		} else {
			people.setIDRole("USER");

			userService.register(people);
			return new ModelAndView("Page/Login");
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, Model model, People people) {
		session.removeAttribute("acc");
		System.out.println("xoa dc");
		return "redirect:/home";
	}

}
