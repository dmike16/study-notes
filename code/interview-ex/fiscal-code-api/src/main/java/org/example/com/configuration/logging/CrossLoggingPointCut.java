package org.example.com.configuration.logging;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class CrossLoggingPointCut {
  @Pointcut("within(org.example.com.controller..*)")
  public void controllerPackage() {
  }

  @Pointcut("within(org.example.com.services..*)")
  public void servicePackage() {
  }

  @Pointcut("within(org.example.com.integration..*)")
  public void integrationPackage() {
  }

  @Pointcut("@within(org.springframework.stereotype.Repository)"
          + " || @within(org.springframework.stereotype.Service)"
          + " || @within(org.example.com.configuration.logging.CrossLogging)")
  public void buisnessBean() {
  }

  @Pointcut("@within(org.springframework.web.bind.annotation.RestController)")
  public void apiBean() {
  }
}
