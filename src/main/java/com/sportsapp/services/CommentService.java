package com.sportsapp.services;

import java.util.Optional;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sportsapp.models.Comment;
import com.sportsapp.models.User;
import com.sportsapp.repositories.CommentRepository;
import com.sportsapp.repositories.UserRepository;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository repository;
	
	@Autowired
	private UserService userService;
	
	public CommentService(CommentRepository repository) {
		this.repository = repository;
	}
	
	public Comment create(Long userID, Comment c) {
		User user = this.userService.find(userID);
		if (user == null)
			return null;
		c.setUser(user);
		return this.repository.save(c);
	}
	
	public Comment save(Comment c) {
		return this.repository.save(c);
	}
	
	public Comment find (Long id) {
		Optional<Comment> optComment = this.repository.findById(id);
		
		if(optComment.isPresent())
			return optComment.get();
		return null;
	}
	
	public void delete(Long id) {
		this.repository.deleteById(id);
	}
}
