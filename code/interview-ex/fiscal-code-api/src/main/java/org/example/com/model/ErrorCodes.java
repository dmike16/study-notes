package org.example.com.model;

public enum ErrorCodes {
    GENERIC("BUISS-001", "Generic buisness error"),
    INVALID("BUISS-002", "Invalid request");

    public final String code;
    public final String msg;

    ErrorCodes(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public CommonError toError() {
        return CommonError.builder().errorCode(code).errorDescription(msg).build();
    }

    public CommonError toError(String info) {
        String details = info != null ? String.format("%s [%s]", info, msg) : msg;
        return CommonError.builder().errorCode(code).errorDescription(details).build();
    }
}
