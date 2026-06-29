package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProdottoDAO;
import model.Carrello;
import model.ProdottoBean;

@WebServlet("/carrello")
public class CarrelloControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Carrello carrello = (Carrello) session.getAttribute("carrello");
		if (carrello == null) {
			carrello = new Carrello();
			session.setAttribute("carrello", carrello);
		}

		String action = request.getParameter("action");

		if ("add".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			try {
				ProdottoBean prodotto = new ProdottoDAO().doRetrieveByKey(id);
				if (prodotto != null) {
					carrello.aggiungi(prodotto);
				}
			} catch (SQLException e) {
				throw new ServletException("Errore nel recupero del prodotto", e);
			}
			response.sendRedirect(request.getContextPath() + "/carrello");
			return;
		}

		if ("remove".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			carrello.rimuovi(id);
			response.sendRedirect(request.getContextPath() + "/carrello");
			return;
		}

		request.getRequestDispatcher("/WEB-INF/views/common/carrello.jsp").forward(request, response);
	}
}
