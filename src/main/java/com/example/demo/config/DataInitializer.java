package com.example.demo.config;

import com.example.demo.model.Article;
import com.example.demo.model.Role;
import com.example.demo.model.User;
import com.example.demo.repository.ArticleRepository;
import com.example.demo.repository.RoleRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;
import java.util.HashSet;

@Component
public class DataInitializer {

    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private ArticleRepository articleRepository;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @PostConstruct
    public void init() {
        // Create roles
        Role adminRole = createRoleIfNotFound("ADMIN");
        Role contributorRole = createRoleIfNotFound("CONTRIBUTOR");
        createRoleIfNotFound("REVIEWER");
        createRoleIfNotFound("VIEWER");
        createRoleIfNotFound("EDITOR");
        
        // Create admin user - john with password123
        User johnUser = createUserIfNotFound("john", "password123", adminRole);
        System.out.println("Created admin user: john/password123");
        
        // Create contributor user
        User contributor = createUserIfNotFound("contributor_1", "password123", contributorRole);
        System.out.println("Created contributor user: contributor_1/password123");
        
        // Create sample articles
        createArticleIfNotFound("Admin Article", "This article was added by Admin", true, johnUser);
        createArticleIfNotFound("User Article", "User can only view articles", true, johnUser);
        createArticleIfNotFound("Pending Contributor Article", "Needs review before publish", false, contributor);
        createArticleIfNotFound("Reviewed Article", "This was approved by a reviewer", true, contributor);
        
        System.out.println("Created sample articles");
    }

    private Role createRoleIfNotFound(String roleName) {
        if (!roleRepository.existsByName(roleName)) {
            Role role = new Role();
            role.setName(roleName);
            return roleRepository.save(role);
        }
        return roleRepository.findByName(roleName).orElse(null);
    }
    
    private User createUserIfNotFound(String username, String password, Role role) {
        if (!userRepository.findByUsername(username).isPresent()) {
            User user = new User();
            user.setUsername(username);
            user.setPassword(passwordEncoder.encode(password));
            
            HashSet<Role> roles = new HashSet<>();
            roles.add(role);
            user.setRoles(roles);
            
            return userRepository.save(user);
        }
        return userRepository.findByUsername(username).get();
    }
    
    private Article createArticleIfNotFound(String title, String content, boolean approved, User author) {
        // We're not checking if article exists because titles can be duplicated
        // Just create a new article
        Article article = new Article();
        article.setTitle(title);
        article.setContent(content);
        article.setApproved(approved);
        article.setAuthor(author);
        return articleRepository.save(article);
    }
}
