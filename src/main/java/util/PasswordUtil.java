package util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {

	public static String cifra(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));

			StringBuilder esadecimale = new StringBuilder();
			for (byte b : hash) {
				esadecimale.append(String.format("%02x", b));
			}

			return esadecimale.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("Algoritmo di cifratura non disponibile", e);
		}
	}
}
