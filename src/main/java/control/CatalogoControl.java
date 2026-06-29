package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdottoDAO;
import model.ProdottoBean;

@WebServlet("/catalogo")
public class CatalogoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProdottoDAO dao = new ProdottoDAO();

		try {
			List<ProdottoBean> prodotti = dao.doRetrieveAll();
			request.setAttribute("prodotti", prodotti);
		} catch (SQLException e) {
			throw new ServletException("Errore nel recupero dei prodotti", e);
		}

		request.getRequestDispatcher("/WEB-INF/views/common/catalogo.jsp").forward(request, response);
	}
}
