package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.Movie;
import service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService movieService;

	public void setMovieService(MovieService movieService) {
		this.movieService = movieService;
	}


	@RequestMapping("/allmovies")
	public String showMovies(Model model){
		List<Movie> movies = movieService.getAllMovies();
		model.addAttribute("movies", movies);
		return "movies";
	}
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public String searchMovies(Model model, @RequestParam("keyword") String keyword){
		List<Movie> movies = movieService.searchByNameYearDirector(keyword);
		model.addAttribute("movies", movies);
		return "movies";
	}
	
	@RequestMapping("/newmovie")
	public String showAddMovie(){
		return "newmovie";
	}
	
	@RequestMapping(value="/addmovie",method=RequestMethod.POST)
	public String addNewMovie(Model model, Movie movie){
		if(movieService.addMovie(movie)){
			model.addAttribute("message", "Movie has been added!");
		} else {
			model.addAttribute("message", "Error adding the movie to the database, try again.");
		}
		return "index";
	}
	
	@RequestMapping("/editordelete")
	public String showEditOrDelete(Model model){
		List<Movie> movies = movieService.getAllMovies();
		model.addAttribute("movies", movies);
		return "editdelete";
	}
	
	@RequestMapping(value="/editdelete",params="edit",method = RequestMethod.POST)
	public String showEdit(Model model,@RequestParam("id") String id){
		Movie movie = movieService.getMovieById(id);
		model.addAttribute("movie", movie);
		return "edit";
	}
	
	@RequestMapping(value="/editdelete",params="delete",method = RequestMethod.POST)
	public String deleteMovie(Model model, @RequestParam("id") String id){
		if(movieService.deleteMovie(id)){
			model.addAttribute("message", "Movie has been deleted!");
		} else {
			model.addAttribute("message", "Error while deleting the movie, try again.");
		}
		return "index";
	}
	
	@RequestMapping(value="/edit",method = RequestMethod.POST)
	public String editMovie(Model model, Movie movie){
		if(movieService.editMovie(movie)){
			model.addAttribute("message", "Movie has been edited!");
		} else {
			model.addAttribute("message", "Error while editing the movie, try again.");
		}
		return "index";
	}
}
