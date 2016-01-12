package dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import util.RowMapperImpl;

@Component("movieDao")
public class MovieDao implements MovieDaoInterface {

	private NamedParameterJdbcTemplate jdbc;
	private RowMapperImpl rowMapper;

	@Autowired
	public void setRowMapper(RowMapperImpl rowMapper) {
		this.rowMapper = rowMapper;
	}

	@Autowired
	public void setJdbc(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	/**
	 * Get all movies from the database
	 * 
	 * @return list of all movies
	 */
	@Override
	public List<Movie> getAllMovies() {
		return jdbc.query("select * from movies", rowMapper);
	}

	/**
	 * Get all movies from the database which match the passed keyword
	 * 
	 * @return list of movies which match the passed keyword
	 */
	@Override
	public List<Movie> searchByNameYearDirector(String keyword) {
		MapSqlParameterSource params = new MapSqlParameterSource("keyword", "%" + keyword + "%");
		return jdbc.query(
				"select * from movies where name like :keyword or director like :keyword or year like :keyword", params,
				rowMapper);
	}

	@Override
	public Movie getMovieById(String id) {
		MapSqlParameterSource params = new MapSqlParameterSource("id", id);
		return jdbc.queryForObject("select * from movies where id=:id", params, rowMapper);
	}

	@Override
	public boolean addMovie(Movie movie) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(movie);
		return jdbc.update(
				"insert into movies(name,year,genre,director,runtime) values (:name,:year,:genre,:director,:runtime)",
				params) == 1;
	}

	@Override
	public boolean editMovie(Movie movie) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(movie);
		return jdbc.update(
				"update movies set name=:name,year=:year,genre=:genre,director=:director,runtime=:runtime where id=:id",
				params) == 1;
	}

	@Override
	public boolean deleteMovie(String id) {
		MapSqlParameterSource params = new MapSqlParameterSource("id", id);
		return jdbc.update("delete from movies where id=:id", params)==1;
	}

}
