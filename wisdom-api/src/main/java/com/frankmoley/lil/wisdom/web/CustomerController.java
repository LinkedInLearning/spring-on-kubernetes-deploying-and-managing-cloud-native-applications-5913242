package com.frankmoley.lil.wisdom.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.frankmoley.lil.wisdom.data.entity.Customer;
import com.frankmoley.lil.wisdom.data.repository.CustomerRepository;

import lombok.extern.slf4j.Slf4j;

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
}
