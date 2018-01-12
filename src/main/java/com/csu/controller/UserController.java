package com.csu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.csu.entites.Personne;
import com.csu.service.PersonneService;

import javax.validation.Valid;

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
	 * Voir le d�tail d'un personne
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
	@RequestMapping(value="/edit", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView editUser(ModelAndView modelAndView, @RequestParam("id") Integer userId, @RequestBody(required = false) Personne userForm){

		Personne personne = null;

		if( userForm == null ) {
			personne = personneService.findById(userId);
		} else {
			personne = userForm;
			personneService.saveUser(userForm);
			modelAndView.addObject(
					"confirmationMessage",
					"La nouvelle personne " + userForm.getNom().toUpperCase() + " "
							+  userForm.getPrenom().toUpperCase() + " "
							+ "a ete modifie !");

			//modelAndView.setViewName("register");
		}

		modelAndView.addObject("edit", true);
		modelAndView.addObject("personne", personne);
		modelAndView.setViewName("register");
		return modelAndView;
	}


	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateUser(ModelAndView modelAndView, @ModelAttribute("userForm") Personne userForm, BindingResult bindingResult, Model model) {

		personneService.saveUser(userForm);
		modelAndView.addObject(
				"confirmationMessage",
				"La nouvelle personne " + userForm.getNom().toUpperCase() + " "
						+  userForm.getPrenom().toUpperCase() + " "
						+ "a ete ajoutee !");


		modelAndView.setViewName("liste_personnes");

		//return "redirect:/results";
		return modelAndView;

	}

	@RequestMapping( value = "edit_save", method = RequestMethod.PUT)
	public ModelAndView updateUser(ModelAndView modelAndView, @RequestBody Personne personne) {
		//Personne modifiedPersonne
		modelAndView.addObject(
				"confirmationMessage",
				"Les informations de " + personne.getNom().toUpperCase() + " "
						+  personne.getPrenom().toUpperCase() + " "
						+ "a ete modifiee !");

		modelAndView.setViewName("liste_personnes");
		return modelAndView;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView processRegistrationForm(ModelAndView modelAndView, @Valid @ModelAttribute("userForm") Personne userForm, BindingResult bindingResult, Model model) {
		System.out.println(""+userForm);
		if( bindingResult.hasErrors() ) {
			modelAndView.addObject("userForm", userForm);
			modelAndView.addObject(
					"confirmationMessage",
					"La nouvelle personne " + userForm.getNom().toUpperCase() + " "
							+  userForm.getPrenom().toUpperCase() + " "
							+ "a ete ajoutee !");


			modelAndView.setViewName("register");
			return modelAndView;
		} else {
			personneService.saveUser(userForm);
			modelAndView.addObject(
					"confirmationMessage",
					"La nouvelle personne " + userForm.getNom().toUpperCase() + " "
							+  userForm.getPrenom().toUpperCase() + " "
							+ "a ete ajoutee !");


			modelAndView.setViewName("register");
			return modelAndView;
		}
		
	}
	
	
}
