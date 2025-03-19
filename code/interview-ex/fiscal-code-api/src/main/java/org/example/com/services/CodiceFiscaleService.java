package org.example.com.services;

import java.time.LocalDate;

import org.example.com.model.PersonMetadata;
import org.example.com.utils.CodiceFiscaleFn;
import org.springframework.stereotype.Service;

@Service
public class CodiceFiscaleService {

    public PersonMetadata extractBirthDateAndAge(String cf) {
        CodiceFiscaleFn fn = new CodiceFiscaleFn(cf);

        CodiceFiscaleFn.ErrorCodes verror = fn.validate();
        if(verror != null) {
            throw new InvalidRequestException("cf", verror.toString());
        }
        LocalDate birthDate = fn.extractBirthDate();
        int age = LocalDate.now().getYear() - birthDate.getYear();

        return new PersonMetadata(birthDate, age);
    }
}
