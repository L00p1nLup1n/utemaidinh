package ship.iu.controller;

import java.io.IOException;

import ship.iu.Services.IUserService;
import ship.iu.Services.Implement.IUserServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ship.iu.model.UserModel;

@WebServlet(urlPatterns = {"/forgotpassword"})
public class ForgotPasswordController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Forward to Forgot Password JSP
		RequestDispatcher rd = request.getRequestDispatcher("/views/Forgotpassword.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		// Initialize the user service
		IUserService service = new IUserServiceImpl();

		// Retrieve and trim input parameters
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String alertMsg = "";

		// Validate input fields
		if (username == null || username.trim().isEmpty() || email == null || email.trim().isEmpty()) {
			alertMsg = "Username or email cannot be empty!";
			request.setAttribute("alert", alertMsg);
			request.getRequestDispatcher("/views/Forgotpassword.jsp").forward(request, response);
			return;
		}

		try {
			// Find the user in the database
			UserModel user = service.findPassword(username.trim(), email.trim());

			// Check if the user exists
			if (user == null || !user.getUsername().equals(username.trim()) || !user.getEmail().equals(email.trim())) {
				alertMsg = "Account does not exist or invalid credentials.";
			} else {
				// Return the plain-text password for demonstration purposes
				alertMsg = "Your password is: " + user.getPassword();
			}

			// Set the alert message and forward the request
			request.setAttribute("alert", alertMsg);
			request.getRequestDispatcher("/views/Forgotpassword.jsp").forward(request, response);

		} catch (Exception e) {
			// Handle any potential exceptions
			alertMsg = "An error occurred while processing your request. Please try again.";
			request.setAttribute("alert", alertMsg);
			e.printStackTrace();
			request.getRequestDispatcher("/views/Forgotpassword.jsp").forward(request, response);
		}
	}
}
