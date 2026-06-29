package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UtenteDAO;
import model.UtenteBean;

@WebServlet("/registrazione")
public class RegisterControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/common/registrazione.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			UtenteDAO dao = new UtenteDAO();

			if (dao.doCheckEmail(email)) {
				request.setAttribute("errore", "Email gia' registrata");
				request.getRequestDispatcher("/WEB-INF/views/common/registrazione.jsp").forward(request, response);
				return;
			}

			UtenteBean utente = new UtenteBean();
			utente.setNome(nome);
			utente.setEmail(email);
			utente.setPassword(password);
			utente.setRuolo("cliente");
			dao.doSave(utente);

			response.sendRedirect(request.getContextPath() + "/login");
		} catch (SQLException e) {
			throw new ServletException("Errore durante la registrazione", e);
		}
	}
}
