package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CategoriaBean;
import storage.DBConnection;

public class CategoriaDAO {

	public List<CategoriaBean> doRetrieveAll() throws SQLException {
		List<CategoriaBean> categorie = new ArrayList<>();
		String sql = "SELECT * FROM categoria";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				CategoriaBean c = new CategoriaBean();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setDescrizione(rs.getString("descrizione"));
				categorie.add(c);
			}
		}

		return categorie;
	}
}
