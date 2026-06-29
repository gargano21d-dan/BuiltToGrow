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
				prodotti.add(p);
			}
		}

		return prodotti;
	}
}
