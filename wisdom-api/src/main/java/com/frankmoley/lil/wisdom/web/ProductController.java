package com.frankmoley.lil.wisdom.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.frankmoley.lil.wisdom.data.entity.Product;
import com.frankmoley.lil.wisdom.data.repository.ProductRepository;
import com.frankmoley.lil.wisdom.util.exception.BadRequestException;
import com.frankmoley.lil.wisdom.util.exception.NotFoundException;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/products")
@Slf4j
public class ProductController {

  private final ProductRepository productRepository;

  public ProductController(ProductRepository productRepository){
    super();
    this.productRepository = productRepository;
  }

  @GetMapping
  public Iterable<Product> getAllProducts(@RequestParam(required=false) String name){
    if(StringUtils.hasLength(name)){
      List<Product> products = new ArrayList<>();
      Optional<Product> product = this.productRepository.findByName(name);
      if(product.isPresent()){
        products.add(product.get());
      }
      return products;
    }
    return this.productRepository.findAll();
  }

  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  public Product addProduct(@RequestBody Product product){
    return this.productRepository.save(product);
  }

  @GetMapping("/{productId}")
  public Product getProduct(@PathVariable UUID productId){
    Optional<Product> product = this.productRepository.findById(productId);
    if(!product.isPresent()){
      throw new NotFoundException("product not found with id: " + productId);
    }
    return product.get();
  }

  @PutMapping("/{productId}")
  public Product updateProduct(@PathVariable UUID productId, @RequestBody Product product){
    if(!productId.equals(product.getProductId())){
      throw new BadRequestException("productId on path doesn't match request body");
    }
    return this.productRepository.save(product);
  }

  @DeleteMapping("/{productId}")
  @ResponseStatus(HttpStatus.RESET_CONTENT)
  public void deleteProduct(@PathVariable UUID productId){
    this.productRepository.deleteById(productId);
  }
}
