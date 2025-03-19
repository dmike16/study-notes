package org.example.com.controller;

import org.example.com.model.PersonMetadata;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

public interface CodiceFiscaleApi{
    @GetMapping(path = "extract/date_age", produces = {MediaType.APPLICATION_JSON_VALUE})
    ResponseEntity<PersonMetadata> extractBirthDayAndAge(@RequestParam(required = true) String cf);
}
