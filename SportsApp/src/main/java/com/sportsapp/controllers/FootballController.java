package com.sportsapp.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;
import com.sportsapp.models.Comment;
import com.sportsapp.models.Team;
import com.sportsapp.models.User;
import com.sportsapp.repositories.CommentRepository;
import com.sportsapp.services.CommentService;
import com.sportsapp.services.UserService;

@Controller
public class FootballController {
	
	@Autowired
	private CommentRepository repository;
	
	@Autowired
	private CommentService service;
	
	@Autowired 
	private UserService userService;
	
	private String baseURL = "https://v3.football.api-sports.io/";
	
	//@Autowired
	//RestTemplate restTemplate;
	
	@GetMapping("/football")
	public String dashboard(Model model, HttpSession session) {
		User user = this.userService.findCurrentUser(session);
		if (user == null)
			return "redirect:/login";
		
//		Team team = restTemplate.getForObject(this.baseURL + "/standings?league=39&season=2021", Team.class);
//		model.addAttribute("team", team);
		model.addAttribute("allComments", this.repository.findAll());
		model.addAttribute("currentUser", user);
		model.addAttribute("newComment", new Comment());
		//model.addAttribute("updateComment", this.service.find(id));//Needs way to get the ID if its on the same page...
		return "dashboard.jsp";
	}
	
	@PostMapping("/add")
	public String add(@Valid @ModelAttribute("newComment") Comment comment, BindingResult result, HttpSession session) {
		User user = this.userService.findCurrentUser(session);
		if (user == null)
			return "redirect:/login";
		
		if (result.hasErrors()) {
			return "dashboard.jsp";
		}
		this.service.create(comment.getUser().getId(), comment);
		return "redirect:/football";
	}
	
	
	
	@GetMapping("/football/delete/{id}")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		User user = this.userService.findCurrentUser(session);
		if (user == null)
			return "redirect:/login";
			
		this.service.delete(id);
		return "redirect:/football";
	}
	

}
