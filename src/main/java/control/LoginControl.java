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

@WebServlet("/login")
public class LoginControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/common/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			UtenteBean utente = new UtenteDAO().doLogin(email, password);
			if (utente != null) {
				request.getSession().setAttribute("utente", utente);
				response.sendRedirect(request.getContextPath() + "/home");
			} else {
				request.setAttribute("errore", "Email o password errati");
				request.getRequestDispatcher("/WEB-INF/views/common/login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			throw new ServletException("Errore durante il login", e);
		}
	}
}
