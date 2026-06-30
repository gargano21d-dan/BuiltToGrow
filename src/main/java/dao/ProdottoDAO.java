package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ProdottoBean;
import storage.DBConnection;

public class ProdottoDAO {

	public List<ProdottoBean> doRetrieveAll() throws SQLException {
		List<ProdottoBean> prodotti = new ArrayList<>();
		String sql = "SELECT * FROM prodotto";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				ProdottoBean p = new ProdottoBean();
				p.setId(rs.getInt("id"));
				p.setNome(rs.getString("nome"));
				p.setDescrizione(rs.getString("descrizione"));
				p.setPrezzo(rs.getDouble("prezzo"));
				p.setQuantita(rs.getInt("quantita"));
				p.setCategoriaId(rs.getInt("categoria_id"));
				p.setIva(rs.getDouble("iva"));
				prodotti.add(p);
			}
		}

		return prodotti;
	}

	public ProdottoBean doRetrieveByKey(int id) throws SQLException {
		String sql = "SELECT * FROM prodotto WHERE id = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					ProdottoBean p = new ProdottoBean();
					p.setId(rs.getInt("id"));
					p.setNome(rs.getString("nome"));
					p.setDescrizione(rs.getString("descrizione"));
					p.setPrezzo(rs.getDouble("prezzo"));
					p.setQuantita(rs.getInt("quantita"));
					p.setCategoriaId(rs.getInt("categoria_id"));
					p.setIva(rs.getDouble("iva"));
					return p;
				}
			}
		}

		return null;
	}

	public boolean doSave(ProdottoBean p) throws SQLException {
		String sql = "INSERT INTO prodotto (nome, descrizione, prezzo, iva, quantita, categoria_id) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, p.getNome());
			ps.setString(2, p.getDescrizione());
			ps.setDouble(3, p.getPrezzo());
			ps.setDouble(4, p.getIva());
			ps.setInt(5, p.getQuantita());
			ps.setInt(6, p.getCategoriaId());

			return ps.executeUpdate() > 0;
		}
	}

	public boolean doUpdate(ProdottoBean p) throws SQLException {
		String sql = "UPDATE prodotto SET nome = ?, descrizione = ?, prezzo = ?, iva = ?, quantita = ?, categoria_id = ? WHERE id = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, p.getNome());
			ps.setString(2, p.getDescrizione());
			ps.setDouble(3, p.getPrezzo());
			ps.setDouble(4, p.getIva());
			ps.setInt(5, p.getQuantita());
			ps.setInt(6, p.getCategoriaId());
			ps.setInt(7, p.getId());

			return ps.executeUpdate() > 0;
		}
	}

	public boolean doDelete(int id) throws SQLException {
		String sql = "DELETE FROM prodotto WHERE id = ?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);
			return ps.executeUpdate() > 0;
		}
	}
}
