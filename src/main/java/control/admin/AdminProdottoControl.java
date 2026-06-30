package control.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdottoDAO;
import model.ProdottoBean;
import model.UtenteBean;

@WebServlet("/admin/prodotto")
public class AdminProdottoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private boolean isAdmin(HttpServletRequest request) {
		UtenteBean utente = (UtenteBean) request.getSession().getAttribute("utente");
		return utente != null && "admin".equals(utente.getRuolo());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!isAdmin(request)) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		String action = request.getParameter("action");

		try {
			if ("nuovo".equals(action)) {
				request.getRequestDispatcher("/WEB-INF/views/admin/formProdotto.jsp").forward(request, response);
			} else if ("modifica".equals(action)) {
				int id = Integer.parseInt(request.getParameter("id"));
				ProdottoBean prodotto = new ProdottoDAO().doRetrieveByKey(id);
				request.setAttribute("prodotto", prodotto);
				request.getRequestDispatcher("/WEB-INF/views/admin/formProdotto.jsp").forward(request, response);
			} else if ("elimina".equals(action)) {
				int id = Integer.parseInt(request.getParameter("id"));
				new ProdottoDAO().doDelete(id);
				response.sendRedirect(request.getContextPath() + "/admin");
			} else {
				response.sendRedirect(request.getContextPath() + "/admin");
			}
		} catch (SQLException e) {
			throw new ServletException("Errore nella gestione del prodotto", e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!isAdmin(request)) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		ProdottoBean prodotto = new ProdottoBean();
		prodotto.setNome(request.getParameter("nome"));
		prodotto.setDescrizione(request.getParameter("descrizione"));
		prodotto.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
		prodotto.setIva(Double.parseDouble(request.getParameter("iva")));
		prodotto.setQuantita(Integer.parseInt(request.getParameter("quantita")));
		prodotto.setCategoriaId(Integer.parseInt(request.getParameter("categoria_id")));

		String idParam = request.getParameter("id");

		try {
			ProdottoDAO dao = new ProdottoDAO();
			if (idParam != null && !idParam.isEmpty()) {
				prodotto.setId(Integer.parseInt(idParam));
				dao.doUpdate(prodotto);
			} else {
				dao.doSave(prodotto);
			}
		} catch (SQLException e) {
			throw new ServletException("Errore nel salvataggio del prodotto", e);
		}

		response.sendRedirect(request.getContextPath() + "/admin");
	}
}
