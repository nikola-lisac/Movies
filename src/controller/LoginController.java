package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.User;
import service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String showLogin(){
		return "login";
	}
	
	@RequestMapping("/denied")
	public String showDenied(){
		return "denied";
	}
	
	@RequestMapping("/register")
	public String showRegister(Model model){
		model.addAttribute("user",new User());
		return "register";
	}
	
	@RequestMapping(value="/newuser", method=RequestMethod.POST)
	public String createUser(Model model, User user, BindingResult result ){
		if(result.hasErrors()){
			model.addAttribute("message", "Error with registration, try again.");
			return "register";
		}
		
		if(userService.isExisting(user.getUsername())){
			result.rejectValue("username", "DuplicateKey.user.username", "Username already exists!");
			return "register";
		}
		userService.addUser(user);
		model.addAttribute("message", "Account has been created!");
		return "index";
	}
}
