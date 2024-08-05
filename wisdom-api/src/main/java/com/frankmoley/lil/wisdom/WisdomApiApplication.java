package com.frankmoley.lil.wisdom;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.autoconfigure.metrics.MeterRegistryCustomizer;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import io.micrometer.core.instrument.MeterRegistry;

@SpringBootApplication
public class WisdomApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(WisdomApiApplication.class, args);
	}

	@Bean
	MeterRegistryCustomizer<MeterRegistry> metricsCommonTags(@Value("${spring.application.name}")String appName){
		return registry -> registry.config().commonTags("app", appName);
	}

}
