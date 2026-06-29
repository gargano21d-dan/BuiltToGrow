package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.UtenteBean;
import storage.DBConnection;

public class UtenteDAO {

	public UtenteBean doLogin(String email, String password) throws SQLException {
		String sql = "SELECT * FROM utente WHERE email = ? AND password = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, email);
			ps.setString(2, password);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					UtenteBean u = new UtenteBean();
					u.setId(rs.getInt("id"));
					u.setNome(rs.getString("nome"));
					u.setEmail(rs.getString("email"));
					u.setPassword(rs.getString("password"));
					u.setRuolo(rs.getString("ruolo"));
					return u;
				}
			}
		}

		return null;
	}

	public boolean doSave(UtenteBean utente) throws SQLException {
		String sql = "INSERT INTO utente (nome, email, password, ruolo) VALUES (?, ?, ?, ?)";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, utente.getNome());
			ps.setString(2, utente.getEmail());
			ps.setString(3, utente.getPassword());
			ps.setString(4, utente.getRuolo());

			return ps.executeUpdate() > 0;
		}
	}

	public boolean doCheckEmail(String email) throws SQLException {
		String sql = "SELECT id FROM utente WHERE email = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, email);

			try (ResultSet rs = ps.executeQuery()) {
				return rs.next();
			}
		}
	}
}
