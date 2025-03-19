package org.example.com.controller;

import org.example.com.configuration.logging.CrossLogging;
import org.example.com.model.PersonMetadata;
import org.example.com.services.CodiceFiscaleService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossLogging
@RestController
@RequestMapping(path = "/codicefiscale")
public class CodiceFiscaleController implements CodiceFiscaleApi {

    public CodiceFiscaleController(CodiceFiscaleService codiceFiscaleService) {
        this.codiceFiscaleService = codiceFiscaleService;
    }

    @Override
    public ResponseEntity<PersonMetadata> extractBirthDayAndAge(String cf) {
        return ResponseEntity
                .ok(codiceFiscaleService.extractBirthDateAndAge(cf));
    }

    private final CodiceFiscaleService codiceFiscaleService;
}
