package org.example.com.controller;

import org.example.com.model.CommonError;
import org.example.com.model.ErrorCodes;
import org.example.com.services.InvalidRequestException;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@RestControllerAdvice(assignableTypes = { CodiceFiscaleController.class })
public class ApiErrorAdvice extends ResponseEntityExceptionHandler {
    @ExceptionHandler
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<ProblemDetail> handle(InvalidRequestException e, HandlerMethod javaMethod,
            HttpMethod httpMethod) {
        ProblemDetail problemDetail = ProblemDetail.forStatus(HttpStatus.BAD_REQUEST);
        CommonError error = ErrorCodes.INVALID.toError(String.format("%s : %s", e.getField(), e.getMessage()));
        problemDetail.setProperties(error.toProperties());
        return ResponseEntity.badRequest()
                .body(problemDetail);
    }

    @ExceptionHandler
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseEntity<ProblemDetail> handle(Exception e, HandlerMethod javaMethod, HttpMethod httpMethod) {
        ProblemDetail problemDetail = ProblemDetail.forStatus(HttpStatus.INTERNAL_SERVER_ERROR);
        CommonError error = ErrorCodes.GENERIC.toError(e.getMessage());
        problemDetail.setProperties(error.toProperties());
        return ResponseEntity.internalServerError()
                .body(problemDetail);
    }
}
