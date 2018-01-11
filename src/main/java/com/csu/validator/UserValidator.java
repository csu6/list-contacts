package com.csu.validator;

//import com.hellokoding.auth.model.User;
//import com.hellokoding.auth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.csu.entites.Personne;
import com.csu.service.PersonneService;

@Component
public class UserValidator implements Validator {
    @Autowired
    private PersonneService personneService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Personne.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Personne user = (Personne) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (user.getNom().length() < 6 || user.getPrenom().length() <10) {
            errors.rejectValue("username", "Size.userForm.username");
        }
//        if (personneService.findByUsername(user.getNom()) != null) {
//            errors.rejectValue("username", "Duplicate.userForm.nom");
//        }
        /*
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
        */
    }
}