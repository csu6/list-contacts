package com.csu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.csu.entites.Personne;
import com.csu.service.PersonneService;

@Controller
public class ListPersonneController {


	@Autowired
	private PersonneService personneService;
	
	@Autowired
	public ListPersonneController(PersonneService personneService) {
		this.personneService = personneService;
	}
	
    @RequestMapping("/list_personnes")
    public ModelAndView getListPersonnes(ModelAndView modelAndView) {

        
		//String dateNaissance = userForm.getDateNaissance().toString();
		Iterable<Personne> listPersonne = personneService.findAll();
		modelAndView.addObject("listPersonne", listPersonne);
		modelAndView.addObject("listPersonne2", "toto tototo to totoot ");
		
		for(Personne s: listPersonne) {
			System.out.println("\n===> "+s);
		}

		modelAndView.setViewName("liste_personnes");
		return modelAndView;
		
    }
    
}
