package bookstore.controller.frontend;

import java.io.IOException;
import java.util.List;

import bookstore.controller.BaseServlet;
import bookstore.dao.CategoryDAO;
import bookstore.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "")
public class HomeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO categoryDAO = new CategoryDAO(entityManager);
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);

		request.getRequestDispatcher("frontend/index.jsp").forward(request, response);
	}

}
