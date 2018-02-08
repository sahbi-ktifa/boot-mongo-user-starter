package fr.efaya.boot.controller.api;

import fr.efaya.boot.domain.User;
import fr.efaya.boot.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.management.InstanceAlreadyExistsException;

/**
 * @author Sahbi Ktifa
 * created on 21/12/2017
 */
@RestController
@RequestMapping("/register")
public class RegisterWebServiceController {

    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    public RegisterWebServiceController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping
    public String registrationProcess(@RequestBody MultiValueMap<String, String> formData) throws InstanceAlreadyExistsException {
        String username = formData.getFirst("username");
        String password = formData.getFirst("password");
        User user = userRepository.findOne(username);
        if (user != null) {
            throw new InstanceAlreadyExistsException(username);
        }
        if (password.equals(formData.getFirst("confirm"))) {
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPassword(passwordEncoder.encode(password));
            userRepository.save(newUser);
        }
        return "Registered successfully. <a href=\"/\">Go to login.</a>";
    }

    @ExceptionHandler(InstanceAlreadyExistsException.class)
    public ModelAndView userAlreadyExists() {
        return new ModelAndView("error", "error", "User already exists.");
    }
}
