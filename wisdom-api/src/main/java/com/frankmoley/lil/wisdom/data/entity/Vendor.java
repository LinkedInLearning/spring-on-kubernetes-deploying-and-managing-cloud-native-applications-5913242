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
@Table(name="vendors")
@Data
public class Vendor {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private UUID vendorId;
  private String name;
  private String contact;
  private String phone;
  @Column(unique=true)
  private String email;
  private String address;
}
