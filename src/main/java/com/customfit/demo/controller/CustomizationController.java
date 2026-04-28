package com.customfit.demo.controller;


import com.customfit.demo.model.Customization;
import com.customfit.demo.repository.CustomizationRepository;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/custom")
@CrossOrigin(origins = "*")
public class CustomizationController {

    private final CustomizationRepository customizationRepository;

    public CustomizationController(CustomizationRepository customizationRepository) {
        this.customizationRepository = customizationRepository;
    }

    @PostMapping("/create")
    public Customization createDesign(@RequestBody Customization customization) {
        return customizationRepository.save(customization);
    }
}