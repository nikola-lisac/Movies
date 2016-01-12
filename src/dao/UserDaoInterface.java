package dao;

import java.util.List;

public interface UserDaoInterface {
	
	public List<User> getAllUsers();
	
	public boolean isExisting(String username);
	
	public boolean addUser(User user);
}
