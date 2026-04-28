package com.customfit.demo.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "orders")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "customization_id")
    private Customization customization;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private User client;

    private String statut; // "EN_ATTENTE", "EN_COURS", "TERMINE", "LIVRE"

    private Double prixTotal;

    private LocalDateTime dateCommande = LocalDateTime.now();

    private LocalDateTime delaiEstime; //
}