package my.com.AdminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import my.com.entity.TicketType;
import my.com.service.TicketTypeServiceImpl;

@Controller
@RequestMapping(path = "/admin/typeticket")
public class TicketController {

	@Autowired
	private TicketTypeServiceImpl repoImpl;

	@RequestMapping(path = "/list")
	public String showHome(Model model) {
		List<TicketType> list = repoImpl.listAll();
		model.addAttribute("dto", list);
		return "Admin/listtype";
	}

	@RequestMapping(path = { "/add" }, method = { RequestMethod.GET })
	public String showAdd(Model model) {
		return "/Admin/addtype";
	}

	@RequestMapping(path = { "/add" }, method = { RequestMethod.POST })
	public String doAdd(Model model, TicketType entity) {
		repoImpl.add(entity);
		return "redirect:/admin/typeticket/list";
	}

	@RequestMapping(path = { "/update/{id}" }, method = { RequestMethod.GET })
	public String showUpdate(Model model, @PathVariable(name = "id") String tkId) {
		int ticketIdInt = 0;
		try {
			ticketIdInt = Integer.parseInt(tkId);
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/admin/typeticket/list";
		}
		TicketType ticketType = repoImpl.findById(ticketIdInt);
		if (ticketType == null) {
			return "redirect:/admin/typeticket/list";
		}
		model.addAttribute("dto", ticketType);
		return "/Admin/updatetype";
	}

	@RequestMapping(path = { "/update/{id}" }, method = { RequestMethod.POST })
	public String doUpdate(Model model, @PathVariable(name = "id") String tkId, TicketType tType) {

		repoImpl.update(tType);

		return "redirect:/admin/typeticket/list";
	}

	@RequestMapping(path = { "/delete/{id}" })
	public String doDelete(Model model, @PathVariable(name = "id") String tkId) {

		repoImpl.delete(Integer.parseInt(tkId));

		return "redirect:/admin/typeticket/list";
	}
}
