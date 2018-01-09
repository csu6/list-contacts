package com.csu.contacts.listcontacts;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ListPersonneController {
	
    @RequestMapping("/list_personnes")
    public String getListPersonnes(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name) {
        model.addAttribute("name", name);
        return "liste_personnes"; // nom page jsp
    }
}
