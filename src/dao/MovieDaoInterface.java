package dao;

import java.util.List;

public interface MovieDaoInterface {

	public List<Movie> getAllMovies();
	
	public List<Movie> searchByNameYearDirector(String keyword);
	
	public Movie getMovieById(String id);
	
	public boolean addMovie(Movie movie);
	
	public boolean editMovie(Movie movie);
	
	public boolean deleteMovie(String id);
	
}
