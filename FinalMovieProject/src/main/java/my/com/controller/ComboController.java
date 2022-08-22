package my.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import my.com.entity.Combo;
import my.com.service.ComboService;


@Controller
@RequestMapping(path = { "/home/combo" })
public class ComboController {
	@Autowired
	private ComboService comboService;
	//List combo customer
	@RequestMapping(path = { "/", "/list" })
	public String list(Model model) {
	    List<Combo> datas = comboService.listAllCombo();
	    model.addAttribute("dto", datas);
	    return "Customer/ListCombo";
	}
}
