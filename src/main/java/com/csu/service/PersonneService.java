package com.csu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.entites.Personne;
import com.csu.repository.PersonneRepository;

@Service("personneService")
public class PersonneService {

	private PersonneRepository personneRepository;

	@Autowired
	public PersonneService(PersonneRepository personneRepository) {
		this.personneRepository = personneRepository;
	}

	public Personne findByEmail(String nom) {
		return personneRepository.findByNom(nom);
	}

	public Iterable<Personne> findAll() {
		return personneRepository.findAll();
	}

	// public Personne findByConfirmationToken(String confirmationToken) {
	// return personneRepository.findByConfirmationToken(confirmationToken);
	// }

	public void saveUser(Personne user) {
		personneRepository.save(user);
	}

	public Personne findById(Integer userId) {
		return personneRepository.findOne(userId);
	}
}
