package com.myStorage.projectStorage.service;

import com.myStorage.projectStorage.model.Product;
import com.myStorage.projectStorage.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    public List<Product> listProducts(String productName) {
        if(productName != null) return productRepository.findByProductName(productName);
        return productRepository.findAll();
    }

    public void saveProduct (Product product) {
        log.info("Saving new {}", product);
        productRepository.save(product);
    }

    public void deleteProduct (Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById (Long id) {
        return productRepository.findById(id).orElse(null);
    }

}
