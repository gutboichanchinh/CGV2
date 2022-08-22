package my.com.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import my.com.entity.Event;
import my.com.service.EventService;

@Controller
@RequestMapping(path = {"/home/event"})
public class EventController {
	@Autowired
	private EventService eventService;
	
	@RequestMapping(path = { "/", "/list" })
    public String list(Model model) {

        List<Event> datas = eventService.listAllEvent();

        model.addAttribute("dto", datas);

        return "Customer/ListEvent";
    }
	@RequestMapping(path = { "/", "/show/{id}" })
    public String showEventDetail(Model model, @PathVariable(name = "id") String eventId) {
		 int eventIdInt = 0; 
		try {
	            eventIdInt = Integer.parseInt(eventId);
	        } catch (Exception ex) {
	            return "redirect:/home/event/list";
	        }
        Event datas = eventService.findEventById(eventIdInt);

        model.addAttribute("event", datas);

        return "Customer/EventInformation";
    }
}
