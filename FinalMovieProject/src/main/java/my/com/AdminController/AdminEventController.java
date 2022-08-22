package my.com.AdminController;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.paypal.base.codec.binary.Base64;

import my.com.entity.Event;
import my.com.service.EventService;

@Controller
@RequestMapping(path = { "/admin/event" })
public class AdminEventController {
	@Autowired
	private EventService eventService;

	@Autowired
	private ServletContext servletContext;

	// List event customer
	// List event admin
	@RequestMapping(path = { "/", "/list" })
	public String adminList(Model model) {
		List<Event> datas = eventService.listAllEvent();
		model.addAttribute("dto", datas);
		return "Admin/AdminListEvent";
	}

	@RequestMapping(path = { "/save" }, method = { RequestMethod.GET })
	public String showAdd(Model model) {
		return "Admin/CreateEvent";
	}

	@RequestMapping(path = { "/save" }, method = { RequestMethod.POST })
	public String addNewEvent(Model model, Event event, @RequestParam(name = "anh") MultipartFile file) {
		if (event.getDiscount() == null || event.getEndDay() == null || event.getEventDescription() == null
				|| event.getEventName() == null || event.getStartDay() == null) {
			model.addAttribute("msg", "Vui lòng điền đầy đủ các trường");
			return "Admin/CreateEvent";
		} else if (event.getEndDay().compareTo(event.getStartDay()) < 0) {
			model.addAttribute("msg", "Ngày kết thúc không thể nhỏ hơn ngày bắt đầu");
			return "Admin/CreateEvent";
		}else if (!file.getOriginalFilename().endsWith(".png") && !file.getOriginalFilename().endsWith(".gif")
				&& !file.getOriginalFilename().endsWith(".jpg") && !file.getOriginalFilename().endsWith(".jpeg")
				&& !file.getOriginalFilename().endsWith(".pmb")) {
			model.addAttribute("msg", "File của bạn không phải là ảnh");
			return "Admin/CreateEvent";
		}  else {
			String relativeWebPath = "/resourses/IMG";
			String absoluteFilePath = servletContext.getRealPath(relativeWebPath);
			File file2 = new File(absoluteFilePath + "/Qr2.png");
			try {
				file.transferTo(file2);
			} catch (Exception e) {
			}
			byte[] bs = new byte[(int) file2.length()];
			try {
				FileInputStream fileInputStream = new FileInputStream(file2);
				fileInputStream.read(bs);
				fileInputStream.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			eventService.saveOrUpdateEvent(new Event(event.getEventName(), event.getDiscount(), event.getStartDay(),
					event.getEndDay(), event.getEventDescription(), bs));
		}
		return "redirect:/admin/event/list";
	}

	private String encodeFileToBase64Binary(byte[] bytes) throws Exception {

		return new String(Base64.encodeBase64(bytes), "UTF-8");
	}

	@RequestMapping(path = { "/delete/{id}" })
	public String delete(Model model, @PathVariable(name = "id") String eventId) {
		try {
			int empIdInt = Integer.parseInt(eventId);
			eventService.deleteEvent(empIdInt);
		} catch (Exception ex) {
		}
		return "redirect:/admin/event/list";
	}

	@RequestMapping(path = { "/update/{id}" }, method = { RequestMethod.GET })
	public String findEventEdit(Model model, @PathVariable(name = "id") String eventId) {
		int empIdInt = 0;
		try {
			empIdInt = Integer.parseInt(eventId);
		} catch (Exception ex) {
			return "redirect:/admin/event/list";
		}
		Event data = eventService.findEventById(empIdInt);
		if (data == null) {
			return "redirect:/admin/listEvent";
		}
		try {
			String aString = encodeFileToBase64Binary(data.getImage());
			model.addAttribute("imageevent", aString);
		} catch (Exception e) {
			System.out.println(e);
		}
		model.addAttribute("dto", data);
		return "Admin/UpdateEvent";
	}

	@RequestMapping(path = { "/update/{id}" }, method = { RequestMethod.POST })
	public String doEdit(Model model, @PathVariable(name = "id") String eventId, @Valid Event event,
			@RequestParam(name = "anh") MultipartFile file) {

		if (event.getDiscount() == null || event.getEndDay() == null || event.getEventDescription() == null
				|| event.getEventName() == null || event.getStartDay() == null) {
			model.addAttribute("msg", "Vui lòng điền đầy đủ các trường");
			return "Admin/CreateEvent";
		} else if (event.getEndDay().compareTo(event.getStartDay()) < 0) {
			model.addAttribute("msg", "Ngày kết thúc không thể nhỏ hơn ngày bắt đầu");
			return "Admin/CreateEvent";
		}else if (!file.getOriginalFilename().endsWith(".png") && !file.getOriginalFilename().endsWith(".gif")
				&& !file.getOriginalFilename().endsWith(".jpg") && !file.getOriginalFilename().endsWith(".jpeg")
				&& !file.getOriginalFilename().endsWith(".pmb")) {
			model.addAttribute("msg", "File của bạn không phải là ảnh");
			return "Admin/CreateEvent";
		}
		else {
			String relativeWebPath = "/resourses/IMG";
			String absoluteFilePath = servletContext.getRealPath(relativeWebPath);
			File file2 = new File(absoluteFilePath + "/Qr2.png");
			try {
				file.transferTo(file2);
			} catch (Exception e) {
			}
			byte[] bs = new byte[(int) file2.length()];
			try {
				FileInputStream fileInputStream = new FileInputStream(file2);
				fileInputStream.read(bs);
				fileInputStream.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			eventService.saveOrUpdateEvent(new Event(Integer.parseInt(eventId), event.getEventName(),
					event.getDiscount(), event.getStartDay(), event.getEndDay(), event.getEventDescription(), bs));
		}
		return "redirect:/admin/event/list";
	}
}