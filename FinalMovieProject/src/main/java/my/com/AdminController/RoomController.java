package my.com.AdminController;

import java.time.LocalDate;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import my.com.entity.Room;
import my.com.entity.Ticket;

import my.com.service.RoomService;
import my.com.service.TicketService;

@Controller
@RequestMapping(path = { "/admin" })
public class RoomController {
	LocalDate dayDate = LocalDate.now();

	String session;
	String sessionGmail;

	@Autowired
	private RoomService roomService;

	@Autowired
	private TicketService ticketService;

	@RequestMapping("/roominfo")
	public String getRoom(Model model) {
		List<Room> room = roomService.findAll();
		model.addAttribute("rooms", room);
		return "Admin/AddRoomAndSeat";
	}

	@RequestMapping("/addroompage")
	public String addRoomPage(Model model) {
		model.addAttribute("thisroom", new Room());
		return "Admin/AddRoom";
	}

	@PostMapping("/addroom")
	public String addRoom(@ModelAttribute(name = "thisroom") @Valid Room room, Model model) {
		String[] arr = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O" };
		if (room.getRoomName() == null || room.getColuum() == 0 || room.getRow() == 0) {
			model.addAttribute("mess", "Điền đầy đủ thông tin");
			model.addAttribute("thisroom", new Room());
			return "Admin/AddRoom";
		} else {
			roomService.saveOrUpdate(room);
			int a = room.getRow() / 3;

			for (int i = 0; i < room.getRow(); i++) {
				for (int j = 1; j <= room.getColuum(); j++) {
					if (i >= a && i <= (a * 2)) {
						ticketService.addTicket(new Ticket(arr[i] + j, room.getId(), true));
					} else {
						ticketService.addTicket(new Ticket(arr[i] + j, room.getId(), false));
					}
				}
			}
			return "redirect:/admin/roominfo";
		}
	}

	@GetMapping("/delete")
	public String delete(@RequestParam(name = "id") int id) {
		ticketService.delete(id);
		roomService.delete(id);
		return "redirect:/admin/roominfo";
	}

	@RequestMapping("/update/{id}")
	public String update(@PathVariable(name = "id") int id, Model model) {
		Room room = roomService.findById(id);
		ticketService.delete(id);
		model.addAttribute("thisroom", room);
		return "Admin/AddRoom";
	}

	@RequestMapping("/viewroom/{id}")
	public String viewRoom(@PathVariable(name = "id") int id, Model model) {
		Room room = roomService.findById(id);
		List<Ticket> listTicket = ticketService.findByRoomId(id);
		model.addAttribute("coluum", room.getColuum());
		model.addAttribute("rowww", room.getRow());
		model.addAttribute("list", listTicket);
		return "Admin/ViewRoom";
	}
}
