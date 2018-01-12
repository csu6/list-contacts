package com.csu.entites;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "personnes")
public class Personne {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;
	
	@NotNull
	@NotEmpty(message = "Please provide an nom")
	private String nom;
	
	@NotNull
	@NotEmpty(message = "Please provide your prenom")
	private String prenom;

	@Email
	private String email;
	
	// Champ qui est cense ne contenir que la date
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/YYYY")
	private Date dateNaissance;

	@Pattern(regexp = "\\d{2}\\d{2}\\d{2}\\d{2}\\d{2}",
			message = "{user.telephone.empty}")
	private String telephone;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Date getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(Date dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Override
	public String toString() {
		return "Personne [id=" + id + ", nom=" + nom + ", prenom=" + prenom + ", dateNaissance=" + dateNaissance
				+ ", telephone=" + telephone + "]";
	}

}
