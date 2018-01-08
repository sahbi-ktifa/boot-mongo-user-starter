package fr.efaya.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Map;

/**
 * @author Sahbi Ktifa
 * created on 21/12/2017
 */
@Controller
public class ApplicationViewController {

    @RequestMapping(path = {"login", "register"})
    public String login(Map<String, Object> model, @RequestParam(required = false) String error) {
        model.put("error", error);
        return "login";
    }

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public ModelAndView getIndexPage(Principal principal) {
        return new ModelAndView("index", "principal", principal.getName());
    }
}
