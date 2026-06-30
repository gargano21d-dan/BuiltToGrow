package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.DettaglioOrdineBean;
import storage.DBConnection;

public class DettaglioOrdineDAO {

	public boolean doSave(DettaglioOrdineBean dettaglio) throws SQLException {
		String sql = "INSERT INTO dettaglio_ordine (ordine_id, prodotto_id, quantita, prezzo_unitario, iva) VALUES (?, ?, ?, ?, ?)";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, dettaglio.getOrdineId());
			ps.setInt(2, dettaglio.getProdottoId());
			ps.setInt(3, dettaglio.getQuantita());
			ps.setDouble(4, dettaglio.getPrezzoUnitario());
			ps.setDouble(5, dettaglio.getIva());

			return ps.executeUpdate() > 0;
		}
	}
}
