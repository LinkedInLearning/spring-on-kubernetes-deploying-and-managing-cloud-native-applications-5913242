package com.frankmoley.lil.wisdom.web;

import com.frankmoley.lil.wisdom.data.entity.Service;
import com.frankmoley.lil.wisdom.data.repository.ServiceRepository;
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
      List<Service> services = new ArrayList<>();
      Optional<Service> service = this.serviceRepository.findByName(name);
      service.ifPresent(services::add);
      return services;
    }
    return this.serviceRepository.findAll();
  }

  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  public Service addService(@RequestBody Service service){
    return this.serviceRepository.save(service);
  }

  @GetMapping("/{serviceId}")
  public Service getService(@PathVariable UUID serviceId){
    Optional<Service> service = this.serviceRepository.findById(serviceId);
    if(service.isEmpty()){
      throw new NotFoundException("service not found with id: " + serviceId);
    }
    return service.get();
  }

  @PutMapping("/{serviceId}")
  public Service updateService(@PathVariable UUID serviceId, @RequestBody Service service){
    if(!serviceId.equals(service.getServiceId())){
      throw new BadRequestException("serviceId on path doesn't match request body");
    }
    return this.serviceRepository.save(service);
  }

  @DeleteMapping("/{serviceId}")
  @ResponseStatus(HttpStatus.RESET_CONTENT)
  public void deleteService(@PathVariable UUID serviceId){
    this.serviceRepository.deleteById(serviceId);
  }
}