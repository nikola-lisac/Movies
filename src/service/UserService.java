package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.User;
import dao.UserDao;

@Component("userService")
public class UserService {
	@Autowired
	private UserDao userDao;
	
	public List<User> getAllUsers(){
		return userDao.getAllUsers();
	}

	public boolean isExisting(String username){
		return userDao.isExisting(username);
	}
	
	public boolean addUser(User user){
		user.setEnabled(true);
		user.setAuthority("ROLE_USER");
		return userDao.addUser(user);
	}
}
