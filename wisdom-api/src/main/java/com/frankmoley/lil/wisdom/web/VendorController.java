package com.frankmoley.lil.wisdom.web;

import com.frankmoley.lil.wisdom.data.entity.Vendor;
import com.frankmoley.lil.wisdom.data.repository.VendorRepository;
import com.frankmoley.lil.wisdom.util.exception.BadRequestException;
import com.frankmoley.lil.wisdom.util.exception.NotFoundException;
import lombok.extern.slf4j.Slf4j;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("vendors")
@Slf4j
public class VendorController {
private final VendorRepository vendorRepository;

  public VendorController(VendorRepository vendorRepository){
    super();
    this.vendorRepository = vendorRepository;
  }

  @GetMapping
  public Iterable<Vendor> getAllVendors(@RequestParam(required=false)String email){
    if(StringUtils.hasLength(email)){
      List<Vendor> vendors = new ArrayList<>();
      Optional<Vendor> vendor = this.vendorRepository.findByEmail(email);
      vendor.ifPresent(vendors::add);
      return vendors;
    }
    return this.vendorRepository.findAll();
  }

  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  public Vendor createVendor(@RequestBody Vendor vendor){
    return this.vendorRepository.save(vendor);
  }

  @GetMapping("/{vendorId}")
  public Vendor getVendor(@PathVariable UUID vendorId){
    Optional<Vendor> vendor = this.vendorRepository.findById(vendorId);
    if(vendor.isEmpty()){
      throw new NotFoundException("Vendor not found with id: " + vendorId);
    }
    return vendor.get();
  }

  @PutMapping("/{vendorId}")
  public Vendor putMethodName(@PathVariable UUID vendorId, @RequestBody Vendor vendor) {
      if(!vendorId.equals(vendor.getVendorId())){
        throw new BadRequestException("vendorId on path must match body");
      }
      return this.vendorRepository.save(vendor);
  }

  @DeleteMapping("/{vendorId}")
  @ResponseStatus(HttpStatus.RESET_CONTENT)
  public void deleteVendor(@PathVariable UUID vendorId){
    this.vendorRepository.deleteById(vendorId);
  }
}