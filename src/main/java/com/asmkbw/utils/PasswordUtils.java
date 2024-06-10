package com.asmkbw.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PasswordUtils {
    
    private static final Logger logger = LoggerFactory.getLogger(PasswordUtils.class);

    public static String hashPassword(String password) {
        try {
            if (password == null || password.isEmpty()) {
                return null;
            }
            
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashedBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            
            String hashedPassword = hexString.toString();
            logger.info("Hashed Password: {}", hashedPassword);  // Log the hashed password
            return hashedPassword;
        } catch (NoSuchAlgorithmException e) {
            logger.warn("Exception during password hashing: ", e);
            return null;
        } catch (Exception e) {
            logger.warn("Unexpected exception: ", e);
            return null;
        }
    }
}