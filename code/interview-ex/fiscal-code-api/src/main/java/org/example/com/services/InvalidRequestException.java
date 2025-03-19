package org.example.com.services;

import lombok.Getter;

@Getter
public class InvalidRequestException extends RuntimeException {
    public InvalidRequestException(String field, String message, Throwable cause) {
        super(message, cause);
        this.field = field;
    }

    public InvalidRequestException(String field, String message) {
        this(field, message, null);
    }

    private final String field;
}
