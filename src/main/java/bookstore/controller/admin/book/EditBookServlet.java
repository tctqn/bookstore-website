package bookstore.controller.admin.book;

import java.io.IOException;

import bookstore.controller.BaseServlet;
import bookstore.service.BookServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/edit_book")
@MultipartConfig(
		fileSizeThreshold = 1024 * 10, //10Kb
		maxFileSize = 1024 * 300, //300Kb
		maxRequestSize = 1024 * 1024 //1MB
	)
public class EditBookServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.editBook();
	}
}
