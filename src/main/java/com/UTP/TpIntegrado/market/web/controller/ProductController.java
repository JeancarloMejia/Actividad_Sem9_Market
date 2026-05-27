package com.UTP.TpIntegrado.market.web.controller;

import com.UTP.TpIntegrado.market.domain.Product;
import com.UTP.TpIntegrado.market.domain.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
@CrossOrigin(origins = "*")
public class ProductController {

    @Autowired
    private ProductService productService;

    // GET /products/all → Lista todos los productos
    @GetMapping("/all")
    public ResponseEntity<List<Product>> getAll() {
        return ResponseEntity.ok(productService.getAll());
    }

    // GET /products/{id} → Busca por ID, 404 si no existe
    @GetMapping("/{id}")
    public ResponseEntity<Product> getProduct(@PathVariable("id") int productId) {
        return productService.getProduct(productId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // GET /products/category/{categoryId} → Productos por categoría
    @GetMapping("/category/{categoryId}")
    public ResponseEntity<List<Product>> getByCategory(@PathVariable("categoryId") int categoryId) {
        return productService.getByCategory(categoryId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // POST /products/save → Crea nuevo producto, retorna 201
    @PostMapping("/save")
    public ResponseEntity<Product> save(@RequestBody Product product) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(productService.save(product));
    }

    // PUT /products/update/{id} → Actualiza producto existente
    @PutMapping("/update/{id}")
    public ResponseEntity<Product> update(@PathVariable("id") int productId,
                                          @RequestBody Product product) {
        return productService.getProduct(productId)
                .map(existing -> {
                    product.setProductId(productId);
                    return ResponseEntity.ok(productService.save(product));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    // DELETE /products/delete/{id} → Elimina, 200 si ok, 404 si no existe
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") int productId) {
        if (productService.delete(productId)) {
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.notFound().build();
    }
}