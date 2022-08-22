package my.com.AdminController;

import java.security.Principal;
import java.time.LocalDate;
import java.util.Random;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import my.com.entity.People;
import my.com.service.PeopleService;
import my.com.service.UserService;

@Controller
public class PeopleController {
	LocalDate dayDate = LocalDate.now();

	String session;
	String sessionGmail;
	int string;
	int forgot = 0;

	@Autowired
	UserService userService;

	@Autowired
	private PeopleService peopleService;

	@Autowired
	private JavaMailSender mailSender;

//	@RequestMapping("/home")
//	public String homePage() {
//		return "Customer/Home";
//	}

	@RequestMapping("/forgotpage")
	public String getPageForgot(Model model) {
		model.addAttribute("codeform", 1);
		forgot = 10;
		string = 0;
		return "Page/ForgotPassPage";
	}

	@RequestMapping("/changepassword")
	public String changePassWordPage(Model model, @RequestParam(name = "emailchange") String gmail) {
		model.addAttribute("codeform", 1);
		model.addAttribute("gmail", gmail);
		forgot = 0;
		string = 1;
		return "Page/ForgotPassPage";
	}

	@RequestMapping("/changeinfo")
	public String getMessage(Model model, Principal principal) {
		String user = null;
		user = principal.getName();
		People people = userService.findByUsername(user);
		model.addAttribute("peoples", people);
		return "Customer/ChangeInfo";
	}

	@PostMapping("/forgotpassword")
	public String checkEmail(@RequestParam(name = "emailforgot") String gmail, Model model) {
		People people = peopleService.findByGmail(gmail);

		if (people == null) {
			model.addAttribute("message", "Email không tồn tại");
			model.addAttribute("codeform", 1);
			return "Page/ForgotPassPage";
		} else {
			int len = 6;
			String chars = "0123456789";
			Random rnd = new Random();
			StringBuilder sb = new StringBuilder(len);
			for (int i = 0; i < len; i++)
				sb.append(chars.charAt(rnd.nextInt(chars.length())));
			session = sb.toString();
			sessionGmail = gmail;
			try {
				sendEmail(gmail, session);
				model.addAttribute("codeform", 2);
				model.addAttribute("message", "đã gửi mail");
				System.out.println(session);
				System.out.println(sessionGmail);
				return "Page/ForgotPassPage";
			} catch (Exception e) {
				model.addAttribute("message", e);
				model.addAttribute("codeform", 1);
				return "Page/ForgotPassPage";
			}

		}
	}

	@PostMapping("/checkverify")
	public String checkVerify(@RequestParam(name = "verifycode") String verify, Model model) {
		if (verify.equals(session) == true) {
			model.addAttribute("codeform", 3);
			model.addAttribute("string", string);
			return "Page/ForgotPassPage";
		} else {
			model.addAttribute("codeform", 2);
			model.addAttribute("message", "Verify Code không đúng");
			return "Page/ForgotPassPage";
		}

	}

	@PostMapping("/checkpassword")
	public String checkPasword(@RequestParam(name = "password") String pass,
			@RequestParam(name = "repassword") String repass, Model model, Principal principal) {
		System.out.println(pass);
		peopleService.updatePassword(pass, sessionGmail);
		System.out.println(forgot);

		if (pass.equals(repass) != true) {
			model.addAttribute("mess", "repassword không trùng khớp");
			model.addAttribute("codeform", 3);
			model.addAttribute("string", string);
			return "Page/ForgotPassPage";
		} else {
			if (forgot == 10) {
				model.addAttribute("message", "Thay đổi mật khẩu thành công");
				return "redirect:/openLogin";
			} else {
				String user = null;
				user = principal.getName();
				People people = userService.findByUsername(user);
				model.addAttribute("peoples", people);
				model.addAttribute("mess", "Thay đổi mật khẩu thành công");
				return "Customer/ChangeInfo";
			}
		}
	}

	public void sendEmail(String email, String token) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setFrom("t1@gmail.com", "Tai Gui Gmail");
			helper.setTo(email);
			String subjectString = "here to the code";
			String content = token;
			helper.setSubject(subjectString);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

	@PostMapping("/save")
	public String changeForm(@ModelAttribute(name = "peoples") @Valid People people, Model model) {
		if (people.getName().trim().isEmpty()) {
			model.addAttribute("messErrorName", "Đừng để trống tên");
			model.addAttribute("peoples", people);
			return "Customer/ChangeInfo";
		}
		if (people.getAddress().trim().isEmpty()) {
			model.addAttribute("messErrorAddress", "Đừng để trống địa chỉ");
			model.addAttribute("peoples", people);
			return "Customer/ChangeInfo";
		}
		if (people.getPhone().trim().isEmpty() || people.getPhone().length() != 10) {
			model.addAttribute("messErrorPhone", "Không đúng format điện thoại");
			model.addAttribute("peoples", people);
			return "Customer/ChangeInfo";
		}
		if (people.getBirthDay() == null || people.getBirthDay().compareTo(dayDate) > 0) {
			model.addAttribute("messErrorDay", "Ngày sinh không chính xác");
			model.addAttribute("peoples", people);
			return "Customer/ChangeInfo";
		}
		peopleService.saveOrUpdate(people);
		model.addAttribute("mess", "Thay đổi thành công");
		return "Customer/ChangeInfo";
	}
}
