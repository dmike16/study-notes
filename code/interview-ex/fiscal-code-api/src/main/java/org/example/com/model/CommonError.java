package org.example.com.model;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Builder;
import lombok.Value;
import lombok.extern.jackson.Jacksonized;

@Jacksonized
@Builder
@Value
public class CommonError {
    String errorCode;
    String errorDescription;

    @JsonIgnore
    public Map<String, Object> toProperties() {
        HashMap<String, Object> map = new HashMap<>();
        map.put("errorCode", errorCode);
        map.put("errorDescription", errorDescription);

        return map;
    }
}
