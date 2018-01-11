package com.csu.repository;

import org.springframework.data.repository.CrudRepository;

import com.csu.entites.Personne;

public interface PersonneRepository extends CrudRepository<Personne, Integer> {
	Personne findByNom(String nom);
	//Personne[] findAll();
	//Personne findByConfirmationToken(String confirmationToken);
}
