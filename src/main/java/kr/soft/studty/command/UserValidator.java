package kr.soft.studty.command;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kr.soft.study.dto.UserDto;

public class UserValidator implements Validator {
	
    @Override
    public boolean supports(Class<?> clazz) {
        return UserDto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user_id", "user_id.empty", "User ID is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.empty", "Password is required.");
    }

}
