package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrdineDAO;
import model.OrdineBean;
import model.UtenteBean;

@WebServlet("/ordini")
public class OrdiniControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UtenteBean utente = (UtenteBean) request.getSession().getAttribute("utente");

		if (utente == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		try {
			List<OrdineBean> ordini = new OrdineDAO().doRetrieveByUtente(utente.getId());
			request.setAttribute("ordini", ordini);
		} catch (SQLException e) {
			throw new ServletException("Errore nel recupero degli ordini", e);
		}

		request.getRequestDispatcher("/WEB-INF/views/common/ordini.jsp").forward(request, response);
	}
}
