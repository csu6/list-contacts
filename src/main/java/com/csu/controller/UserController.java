package com.csu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.csu.entites.Personne;
import com.csu.service.PersonneService;

@Controller
public class UserController {

	@Autowired
	private PersonneService personneService;
	
	@Autowired
	public UserController(PersonneService personneService) {
		this.personneService = personneService;
	}

	// Return registration form template
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public ModelAndView showRegistrationPage(ModelAndView modelAndView){
		//modelAndView.addObject("Personne", personne);
		/*
		modelAndView.addObject("personne", null);
		Personne personne = null;
		System.out.println("====>" + personne);
		*/
		modelAndView.addObject("personne", null);
		
		modelAndView.setViewName("register");
		return modelAndView;
	}

	/**
	 * Voir le détail d'un personne
	 * 
	 * @param modelAndView
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/user", method = RequestMethod.GET)
	public ModelAndView seeUserDetail(ModelAndView modelAndView, @RequestParam("id") Integer userId){

		Personne personne = personneService.findById(userId);

		modelAndView.addObject("personne", personne);
		modelAndView.setViewName("register");
		return modelAndView;
	}

	/**
	 * Editer une personne
	 * 
	 * @param modelAndView
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView editUser(ModelAndView modelAndView, @RequestParam("id") Integer userId){

		Personne personne = personneService.findById(userId);

		modelAndView.addObject("personne", personne);
		modelAndView.setViewName("register");
		return modelAndView;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView processRegistrationForm(ModelAndView modelAndView, @ModelAttribute("userForm") Personne userForm, BindingResult bindingResult, Model model) {
		System.out.println(""+userForm);
		
		personneService.saveUser(userForm);
		modelAndView.addObject(
				"confirmationMessage", 
				"La nouvelle personne " + userForm.getNom().toUpperCase() + " "+ 					userForm.getPrenom().toUpperCase() + " "
				+ "a été ajoutée !");

	
		modelAndView.setViewName("register");
		return modelAndView;
		
	}
	
	
}
