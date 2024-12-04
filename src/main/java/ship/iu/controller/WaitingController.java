package ship.iu.controller;

import java.io.IOException;

import ship.iu.model.UserModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/waiting" })
public class WaitingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("account") != null) {
			UserModel u = (UserModel) session.getAttribute("account");
			request.setAttribute("username", u.getUsername());
			if (u.getRoleid() == 2) {
				response.sendRedirect(request.getContextPath() + "/views/admin/home.jsp");
			} else if (u.getRoleid() == 3) {
				response.sendRedirect(request.getContextPath() + "/manager/home");
			} else if (u.getRoleid() == 4) {
				response.sendRedirect(request.getContextPath() + "/seller/home");
			} else {
				response.sendRedirect(request.getContextPath() + "/views/Home.jsp");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}
}
