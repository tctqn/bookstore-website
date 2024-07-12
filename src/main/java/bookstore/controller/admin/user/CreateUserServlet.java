package bookstore.controller.admin.user;

import java.io.IOException;

import bookstore.controller.BaseServlet;
import bookstore.service.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/admin/create_user")
public class CreateUserServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserServices userServices = new UserServices(entityManager, request, response);
		userServices.createUser()  ;
	}
}
