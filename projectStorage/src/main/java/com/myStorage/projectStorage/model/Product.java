package com.myStorage.projectStorage.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "products")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "productName")
    private String productName;

    @Column(name = "productQuantity")
    private int productQuantity;

    @Column(name = "serialNumber")
    private String serialNumber;

    @Column(name = "productPrice")
    private int productPrice;

    @Column(name = "storageConditions")
    private String storageConditions;
}
