package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdottoDAO;
import model.ProdottoBean;

@WebServlet("/prodotto")
public class ProdottoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		try {
			ProdottoBean prodotto = new ProdottoDAO().doRetrieveByKey(id);
			request.setAttribute("prodotto", prodotto);
		} catch (SQLException e) {
			throw new ServletException("Errore nel recupero del prodotto", e);
		}

		request.getRequestDispatcher("/WEB-INF/views/common/prodotto.jsp").forward(request, response);
	}
}
