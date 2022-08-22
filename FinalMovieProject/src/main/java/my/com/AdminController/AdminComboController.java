package my.com.AdminController;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.paypal.base.codec.binary.Base64;

import my.com.entity.Combo;
import my.com.entity.ConvertImg;
import my.com.service.ComboService;

@Controller
@RequestMapping(path = { "/admin/combo" })
public class AdminComboController {
	@Autowired
	private ComboService comboService;
	
	@Autowired
    private ServletContext servletContext;

	@RequestMapping(path = { "/save" }, method = { RequestMethod.GET })
	public String showAdd(Model model) {
		return "Admin/CreateCombo";
	}

	@RequestMapping(path = { "/save" }, method = { RequestMethod.POST })
	public String addNewEvent(Model model, Combo combo, @RequestParam(name = "anh") MultipartFile file) {
		if (combo.getComboName().trim().isEmpty() || combo.getComboPrice() == null || combo.getNumber() == null
				|| combo.getComboDescription().isEmpty()) {
			model.addAttribute("msg", "Vui lòng điền đầy đủ các trường");
			return "Admin/CreateCombo";
		} else if (!file.getOriginalFilename().endsWith(".png") && !file.getOriginalFilename().endsWith(".gif")
				&& !file.getOriginalFilename().endsWith(".jpg") && !file.getOriginalFilename().endsWith(".jpeg")
				&& !file.getOriginalFilename().endsWith(".pmb")) {
			model.addAttribute("msg", "File của bạn không phải là ảnh");
			return "Admin/CreateCombo";
		} else {
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
				System.out.println(e);
			}
			comboService.saveOrUpdateCombo(new Combo(combo.getComboName(), combo.getComboDescription(),
					combo.getComboPrice(), combo.getNumber(), bs));
		}
		return "redirect:/admin/combo/list";
	}

//List combo admin
	@RequestMapping(path = { "/", "/list" })
	public String adminList(Model model) {
		List<Combo> datas = comboService.listAllCombo();
		List<ConvertImg> list = new ArrayList<>();
		try {
			for (Combo combo : datas) {
				list.add(new ConvertImg(encodeFileToBase64Binary(combo.getComboImage())));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("listimg", list);
		model.addAttribute("dto", datas);
		return "Admin/AdminListCombo";
	}

	private String encodeFileToBase64Binary(byte[] bytes) throws Exception {
		return new String(Base64.encodeBase64(bytes), "UTF-8");
	}

	@RequestMapping(path = { "/delete/{id}" })
	public String delete(Model model, @PathVariable(name = "id") String eventId) {
		try {
			int comboIdInt = Integer.parseInt(eventId);
			comboService.deleteCombo(comboIdInt);
		} catch (Exception ex) {
		}
		return "redirect:/admin/combo/list";
	}

	@RequestMapping(path = { "/update/{id}" }, method = { RequestMethod.GET })
	public String findComboEdit(Model model, @PathVariable(name = "id") String Id) {
		int IdInt = 0;
		try {
			IdInt = Integer.parseInt(Id);
		} catch (Exception ex) {
			return "redirect:/admin/combo/list";
		}
		Combo data = comboService.findComboById(IdInt);
		if (data == null) {
			return "redirect:/admin/combo/list";
		}
		try {
			String aString = encodeFileToBase64Binary(data.getComboImage());
			model.addAttribute("image", aString);
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("dto", data);
		return "Admin/UpdateCombo";
	}

	@RequestMapping(path = { "/update/{id}" }, method = { RequestMethod.POST })
	public String doEdit(Model model, @PathVariable(name = "id") String comboId, @Valid Combo combo,
			@RequestParam(name = "anh") MultipartFile file) {
		Combo data = comboService.findComboById(combo.getIdCombo());
		model.addAttribute("dto", data);
		if (combo.getComboName().isEmpty() || combo.getComboPrice() == null || combo.getNumber() == null
				|| combo.getComboDescription().isEmpty()) {
			model.addAttribute("msg", "Vui lòng điền đầy đủ các trường");
			return "Admin/UpdateCombo";
		} else if (!file.getOriginalFilename().endsWith(".png") && !file.getOriginalFilename().endsWith(".gif")
				&& !file.getOriginalFilename().endsWith(".jpg") && !file.getOriginalFilename().endsWith(".jpeg")
				&& !file.getOriginalFilename().endsWith(".pmb")) {
			model.addAttribute("msg", "File của bạn không phải là ảnh");
			return "redirect:/admin/combo/update/"+combo.getIdCombo();
		} else {
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
				System.out.println(e);
			}
			comboService.saveOrUpdateCombo(new Combo(Integer.parseInt(comboId), combo.getComboName(), combo.getComboDescription(), combo.getComboPrice(), combo.getNumber(), bs));
		}
		return "redirect:/admin/combo/list";
	}
}