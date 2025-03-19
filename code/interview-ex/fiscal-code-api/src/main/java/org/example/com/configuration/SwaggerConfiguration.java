package org.example.com.configuration;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;

@Configuration(proxyBeanMethods = false)
public class SwaggerConfiguration {
  @Bean
  public GroupedOpenApi api() {
    return GroupedOpenApi
            .builder()
            .group("codice-fiscale")
            .pathsToMatch("/codicefiscale/**")
            .build();
  }

  @Bean
  public OpenAPI springSiteOpenApi(@Value("${spring.application.name}") String name, @Value("${spring.application.version}") String version) {
    return new OpenAPI()
            .info(
                    new Info()
                            .title(name.toUpperCase())
                            .description("Api resto to config edge services")
                            .version(version)
            );
  }
}
