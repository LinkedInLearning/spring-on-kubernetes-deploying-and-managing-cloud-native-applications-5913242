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

import com.frankmoley.lil.wisdom.data.entity.Service;
import com.frankmoley.lil.wisdom.data.repository.ServiceRepository;
import com.frankmoley.lil.wisdom.util.exception.BadRequestException;
import com.frankmoley.lil.wisdom.util.exception.NotFoundException;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/services")
@Slf4j
public class ServiceController {
  private final ServiceRepository serviceRepository;

  public ServiceController(ServiceRepository serviceRepository){
    super();
    this.serviceRepository = serviceRepository;
  }

  @GetMapping
  public Iterable<Service> getAllServices(@RequestParam(required=false) String name){
    if(StringUtils.hasLength(name)){
      List<Service> Services = new ArrayList<>();
      Optional<Service> Service = this.serviceRepository.findByName(name);
      if(Service.isPresent()){
        Services.add(Service.get());
      }
      return Services;
    }
    return this.serviceRepository.findAll();
  }

  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  public Service addService(@RequestBody Service Service){
    return this.serviceRepository.save(Service);
  }

  @GetMapping("/{ServiceId}")
  public Service getService(@PathVariable UUID ServiceId){
    Optional<Service> Service = this.serviceRepository.findById(ServiceId);
    if(!Service.isPresent()){
      throw new NotFoundException("service not found with id: " + ServiceId);
    }
    return Service.get();
  }

  @PutMapping("/{ServiceId}")
  public Service updateService(@PathVariable UUID ServiceId, @RequestBody Service Service){
    if(!ServiceId.equals(Service.getServiceId())){
      throw new BadRequestException("serviceId on path doesn't match request body");
    }
    return this.serviceRepository.save(Service);
  }

  @DeleteMapping("/{ServiceId}")
  @ResponseStatus(HttpStatus.RESET_CONTENT)
  public void deleteService(@PathVariable UUID ServiceId){
    this.serviceRepository.deleteById(ServiceId);
  }
}
