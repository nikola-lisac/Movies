package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Movie;
import dao.MovieDao;

@Service("movieService")
public class MovieService {
	private MovieDao movieDao;
	
	
	@Autowired
	public void setMovieDao(MovieDao movieDao) {
		this.movieDao = movieDao;
	}

	/**
	 * Get all movies from the database
	 * 
	 * @return list of all movies
	 */
	public List<Movie> getAllMovies() {
		return movieDao.getAllMovies();
	}

	/**
	 * Get all movies from the database which match the passed keyword
	 * 
	 * @return list of movies which match the passed keyword
	 */
	public List<Movie> searchByNameYearDirector(String keyword) {
		return movieDao.searchByNameYearDirector(keyword);
	}

	public Movie getMovieById(String id) {
		return movieDao.getMovieById(id);
	}

	public boolean addMovie(Movie movie) {
		return movieDao.addMovie(movie);
	}

	public boolean editMovie(Movie movie) {
		return movieDao.editMovie(movie);
	}

	public boolean deleteMovie(String id) {
		return movieDao.deleteMovie(id);
	}
}
