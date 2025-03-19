package org.example.com.utils;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Objects;

public class CodiceFiscaleFn {

    public CodiceFiscaleFn(String cf) {
        Objects.requireNonNull(cf);
        this.cf = cf.toUpperCase();
    }

    public LocalDate extractBirthDate() {
        int year = extractYear();
        int month = extractMonth();
        int day = extractDay();

        return LocalDate.of(year, month, day);
    }

    public int extractYear() {
        int currentYear = LocalDate.now().getYear();
        int yearP2 = Integer.parseInt(cf.substring(6, 8));
        int currentYarP1 = currentYear / 100;
        int year = currentYarP1 * 100 + yearP2;

        if (year > currentYear) {
            return year - 100;
        }

        return year;
    }

    public int extractDay() {
        int day = Integer.parseInt(cf.substring(9, 11));
        if (day > 40) {
            return day - 40;
        }

        return day;
    }

    public int extractMonth() {
        char m = cf.charAt(8);
        return switch (m) {
            case 'A' -> 1;
            case 'B' -> 2;
            case 'C' -> 3;
            case 'D' -> 4;
            case 'E' -> 5;
            case 'H' -> 6;
            case 'L' -> 7;
            case 'M' -> 8;
            case 'P' -> 9;
            case 'R' -> 10;
            case 'S' -> 11;
            case 'T' -> 12;
            default ->
                throw new IllegalArgumentException(String.format("Char %s not supported", m), null);
        };
    }

    public ErrorCodes validate() {
        if (cf.length() != 16) {
            return ErrorCodes.INVALID_LEN;
        }
        ErrorCodes chCheck = checkControlCharacter();
        if (chCheck != null) {
            return chCheck;
        }
        return null;
    }

    public ErrorCodes checkControlCharacter() {
        int sum = 0;
        for (int i = 1, len = cf.length(); i < len; i++) {
            sum += conversionTable.get(cf.charAt(i - 1))[i & 1];
        }
        char checkChar = checkCharacterTable[sum % 26];
        if (checkChar != cf.charAt(cf.length() - 1)) {
            return ErrorCodes.INVALID_CHECK_CHAR;
        }
        return null;
    }

    public enum ErrorCodes {
        INVALID_LEN("CF-001", "Length must be 16 characters"),
        INVALID_CHECK_CHAR("CF-002", "Invalid control character");

        public final String code;
        public final String msg;

        ErrorCodes(String code, String msg) {
            this.code = code;
            this.msg = msg;
        }

        @Override
        public String toString() {
            return String.format("%s:%s", code, msg);
        }

    }

    static HashMap<Character, Short[]> conversionTable = new HashMap<>(26);
    static Character[] checkCharacterTable = new Character[] {
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
            'V', 'W', 'X', 'Y', 'Z'
    };

    static {
        // Character check table
        conversionTable.put('A', new Short[] { 0, 1 });
        conversionTable.put('0', new Short[] { 0, 1 });
        conversionTable.put('B', new Short[] { 1, 0 });
        conversionTable.put('1', new Short[] { 1, 0 });
        conversionTable.put('C', new Short[] { 2, 5 });
        conversionTable.put('2', new Short[] { 2, 5 });
        conversionTable.put('D', new Short[] { 3, 7 });
        conversionTable.put('3', new Short[] { 3, 7 });
        conversionTable.put('E', new Short[] { 4, 9 });
        conversionTable.put('4', new Short[] { 4, 9 });
        conversionTable.put('F', new Short[] { 5, 13 });
        conversionTable.put('5', new Short[] { 5, 13 });
        conversionTable.put('G', new Short[] { 6, 15 });
        conversionTable.put('6', new Short[] { 6, 15 });
        conversionTable.put('H', new Short[] { 7, 17 });
        conversionTable.put('7', new Short[] { 7, 17 });
        conversionTable.put('I', new Short[] { 8, 19 });
        conversionTable.put('8', new Short[] { 8, 19 });
        conversionTable.put('J', new Short[] { 9, 21 });
        conversionTable.put('9', new Short[] { 9, 21 });
        conversionTable.put('K', new Short[] { 10, 2 });
        conversionTable.put('L', new Short[] { 11, 4 });
        conversionTable.put('M', new Short[] { 12, 18 });
        conversionTable.put('N', new Short[] { 13, 20 });
        conversionTable.put('O', new Short[] { 14, 11 });
        conversionTable.put('P', new Short[] { 15, 3 });
        conversionTable.put('Q', new Short[] { 16, 6 });
        conversionTable.put('R', new Short[] { 17, 8 });
        conversionTable.put('S', new Short[] { 18, 12 });
        conversionTable.put('T', new Short[] { 19, 14 });
        conversionTable.put('U', new Short[] { 20, 16 });
        conversionTable.put('V', new Short[] { 21, 10 });
        conversionTable.put('W', new Short[] { 22, 22 });
        conversionTable.put('X', new Short[] { 23, 25 });
        conversionTable.put('Y', new Short[] { 24, 24 });
        conversionTable.put('Z', new Short[] { 25, 23 });

    }

    private final String cf;
}
