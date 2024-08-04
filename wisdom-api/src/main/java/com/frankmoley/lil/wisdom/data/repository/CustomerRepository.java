package com.frankmoley.lil.wisdom.data.repository;

import java.util.UUID;
import com.frankmoley.lil.wisdom.data.entity.Customer;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;


public interface CustomerRepository extends JpaRepository<Customer, UUID>{
  Optional<Customer> findByEmail(String email);
}
