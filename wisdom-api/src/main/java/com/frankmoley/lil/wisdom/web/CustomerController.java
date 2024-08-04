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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.frankmoley.lil.wisdom.data.entity.Customer;
import com.frankmoley.lil.wisdom.data.repository.CustomerRepository;
import com.frankmoley.lil.wisdom.util.exception.BadRequestException;
import com.frankmoley.lil.wisdom.util.exception.NotFoundException;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PutMapping;


@RestController
@RequestMapping("customers")
@Slf4j
public class CustomerController {

  private final CustomerRepository customerRepository;

  public CustomerController(CustomerRepository customerRepository){
    super();
    this.customerRepository = customerRepository;
  }

  @GetMapping
  public Iterable<Customer> getAllCustomers(@RequestParam(required=false)String email){
    if(StringUtils.hasLength(email)){
      List<Customer> customers = new ArrayList<>();
      Optional<Customer> customer = this.customerRepository.findByEmail(email);
      if(customer.isPresent()){
        customers.add(customer.get());
      }
      return customers;
    }
    return this.customerRepository.findAll();
  }

  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  public Customer createCustomer(@RequestBody Customer customer){
    return this.customerRepository.save(customer);
  }

  @GetMapping("/{customerId}")
  public Customer getCustomer(@PathVariable UUID customerId){
    Optional<Customer> customer = this.customerRepository.findById(customerId);
    if(customer.isEmpty()){
      throw new NotFoundException("customer not found with id: " + customerId);
    }
    return customer.get();
  }

  @PutMapping("/{customerId}")
  public Customer putMethodName(@PathVariable UUID customerId, @RequestBody Customer customer) {
      if(!customerId.equals(customer.getCustomerId())){
        throw new BadRequestException("customerId on path must match body");
      }
      return this.customerRepository.save(customer);
  }

  @DeleteMapping("/{customerId}")
  @ResponseStatus(HttpStatus.RESET_CONTENT)
  public void deleteCustomer(@PathVariable UUID customerId){
    this.customerRepository.deleteById(customerId);
  }
}
