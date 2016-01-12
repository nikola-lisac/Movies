package dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class UserDao implements UserDaoInterface {

	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	public void setJdbc(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	@Override
	public List<User> getAllUsers() {
		return jdbc.query("select * from users, authorities where users.username=authorities.username",
				BeanPropertyRowMapper.newInstance(User.class));
	}

	@Override
	public boolean isExisting(String username) {
		return jdbc.queryForObject("select count(*) from users where username=:username",
				new MapSqlParameterSource("username", username), Integer.class) > 0;
	}

	@Override
	public boolean addUser(User user) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", user.getUsername());
		params.addValue("password", passwordEncoder.encode(user.getPassword()));
		params.addValue("enabled", user.isEnabled());
		params.addValue("email", user.getEmail());
		params.addValue("authority", user.getAuthority());
		return (jdbc.update(
				"insert into users (username, password, enabled,email) values (:username, :password, :enabled,:email)",
				params) == 1
				&& jdbc.update("insert into authorities (username, authority) values (:username, :authority)",
						params) == 1);
	}

}
