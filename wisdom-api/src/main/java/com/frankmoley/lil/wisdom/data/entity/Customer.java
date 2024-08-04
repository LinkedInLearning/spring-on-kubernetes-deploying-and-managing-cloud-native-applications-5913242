package com.frankmoley.lil.wisdom.data.entity;

import java.util.UUID;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name="customers")
@Data
public class Customer {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private UUID customerId;
  private String firstName;
  private String lastName;
  @Column(unique=true)
  private String email;
  private String phone;
  private String address;
}
