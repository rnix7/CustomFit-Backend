package com.customfit.demo.service;


import com.customfit.demo.model.User;
import com.customfit.demo.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User inscription(User user) {
        // Logique simplifiée (plus tard, on ajoutera le hachage BCrypt)
        if(userRepository.findByEmail(user.getEmail()).isPresent()) {
            throw new RuntimeException("Cet email est déjà utilisé.");
        }
        return userRepository.save(user);
    }

    public User connexion(String email, String password) {
        return userRepository.findByEmail(email)
                .filter(user -> user.getMotDePasse().equals(password))
                .orElseThrow(() -> new RuntimeException("Email ou mot de passe incorrect."));
    }
}
