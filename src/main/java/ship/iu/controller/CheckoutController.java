package ship.iu.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ship.iu.Services.IUserService;
import ship.iu.Services.Implement.IUserServiceImpl;


@WebServlet(urlPatterns = {"/admin/checkout"})
public class CheckoutController extends HttpServlet {
	IUserService service = new IUserServiceImpl();
	private static final long serialVersionUID = 1L;

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
	req.getRequestDispatcher("/views/Checkout.jsp").forward(req, resp);
	}
}