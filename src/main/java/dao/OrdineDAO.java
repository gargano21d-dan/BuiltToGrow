package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.OrdineBean;
import storage.DBConnection;

public class OrdineDAO {

	public int doSave(OrdineBean ordine) throws SQLException {
		String sql = "INSERT INTO ordine (utente_id, prezzo_totale) VALUES (?, ?)";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, ordine.getUtenteId());
			ps.setDouble(2, ordine.getPrezzoTotale());
			ps.executeUpdate();

			try (ResultSet rs = ps.getGeneratedKeys()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		}

		return -1;
	}

	public List<OrdineBean> doRetrieveByUtente(int utenteId) throws SQLException {
		List<OrdineBean> ordini = new ArrayList<>();
		String sql = "SELECT * FROM ordine WHERE utente_id = ? ORDER BY data_ordine DESC";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, utenteId);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					OrdineBean o = new OrdineBean();
					o.setId(rs.getInt("id"));
					o.setUtenteId(rs.getInt("utente_id"));
					o.setDataOrdine(rs.getTimestamp("data_ordine"));
					o.setPrezzoTotale(rs.getDouble("prezzo_totale"));
					ordini.add(o);
				}
			}
		}

		return ordini;
	}
}
