package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DettaglioOrdineDAO;
import dao.OrdineDAO;
import model.Carrello;
import model.CarrelloItem;
import model.DettaglioOrdineBean;
import model.OrdineBean;
import model.UtenteBean;

@WebServlet("/checkout")
public class CheckoutControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		UtenteBean utente = (UtenteBean) session.getAttribute("utente");

		if (utente == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		Carrello carrello = (Carrello) session.getAttribute("carrello");
		if (carrello == null || carrello.isVuoto()) {
			response.sendRedirect(request.getContextPath() + "/carrello");
			return;
		}

		try {
			OrdineBean ordine = new OrdineBean();
			ordine.setUtenteId(utente.getId());
			ordine.setPrezzoTotale(carrello.getTotale());
			int ordineId = new OrdineDAO().doSave(ordine);

			DettaglioOrdineDAO dettaglioDAO = new DettaglioOrdineDAO();
			for (CarrelloItem item : carrello.getItems()) {
				DettaglioOrdineBean dettaglio = new DettaglioOrdineBean();
				dettaglio.setOrdineId(ordineId);
				dettaglio.setProdottoId(item.getProdotto().getId());
				dettaglio.setQuantita(item.getQuantita());
				dettaglio.setPrezzoUnitario(item.getProdotto().getPrezzo());
				dettaglio.setIva(item.getProdotto().getIva());
				dettaglioDAO.doSave(dettaglio);
			}

			session.removeAttribute("carrello");
		} catch (SQLException e) {
			throw new ServletException("Errore durante il checkout", e);
		}

		response.sendRedirect(request.getContextPath() + "/ordini?success=true");
	}
}
