package com.customfit.demo.model;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "customizations")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Customization {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String typeVetement; // Chemise, Pantalon, Robe

    private String couleurHex; // Code couleur

    private String motifUrl; // URL de l'image du motif

    @Column(columnDefinition = "TEXT")
    private String textePerso; // Texte ajouté par le client

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User client;
}