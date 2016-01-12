package util;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import dao.Movie;

@Component("rowMapper")
public class RowMapperImpl implements RowMapper<Movie> {

	@Override
	public Movie mapRow(ResultSet rs, int rowNum) throws SQLException {
		Movie movie = new Movie();
		movie.setId(rs.getInt("id"));
		movie.setName(rs.getString("name"));
		movie.setYear(rs.getInt("year"));
		movie.setGenre(rs.getString("genre"));
		movie.setDirector(rs.getString("director"));
		movie.setRuntime(rs.getInt("runtime"));
		return movie;
	}

}
