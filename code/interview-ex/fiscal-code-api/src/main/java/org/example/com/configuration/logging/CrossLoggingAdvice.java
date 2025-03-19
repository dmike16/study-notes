package org.example.com.configuration.logging;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j
public class CrossLoggingAdvice {
  final static String AROUND_POINT_CUT = "(org.example.com.configuration.logging.CrossLoggingPointCut.controllerPackage() " +
          "|| org.example.com.configuration.logging.CrossLoggingPointCut.servicePackage() " +
          "|| org.example.com.configuration.logging.CrossLoggingPointCut.integrationPackage()) " +
          "&& org.example.com.configuration.logging.CrossLoggingPointCut.buisnessBean()";

  @Around(AROUND_POINT_CUT)
  public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
    final StopWatch stopWatch = new StopWatch();
    if (log.isDebugEnabled()) {
      stopWatch.start();
      log.debug("Enter: {}.{}() with argument[s] = {}", joinPoint.getSignature().getDeclaringTypeName(),
              joinPoint.getSignature().getName(), Arrays.toString(joinPoint.getArgs()));
    }
    try {
      return joinPoint.proceed();
    } finally {
      if (log.isDebugEnabled()) {
        stopWatch.stop();
        log.debug("Exit: {}.{}() in {}ms", joinPoint.getSignature().getDeclaringTypeName(),
                joinPoint.getSignature().getName(), stopWatch.getTotalTimeMillis());
      }
    }
  }

  static final String AFTER_THROWING_POINTCUT = "(org.example.com.configuration.logging.CrossLoggingPointCut.controllerPackage() || org.example.com.configuration.logging.CrossLoggingPointCut.servicePackage()) " +
          "&& " +
          "(org.example.com.configuration.logging.CrossLoggingPointCut.buisnessBean() " +
          "|| org.example.com.configuration.logging.CrossLoggingPointCut.apiBean())";

  @AfterThrowing(pointcut = AFTER_THROWING_POINTCUT, throwing = "e")
  public void logAfterThrowing(JoinPoint joinPoint, Throwable e) {
    log.error("Exception in {}.{}() with cause = {}", joinPoint.getSignature().getDeclaringTypeName(),
            joinPoint.getSignature().getName(), e.getCause(), e);
  }
}
