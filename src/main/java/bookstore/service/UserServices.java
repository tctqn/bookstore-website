package bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;

import bookstore.dao.UserDAO;
import bookstore.entity.Users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServices {
	private EntityManager entityManager;
	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public UserServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		this.entityManager = entityManager;
		this.request = request;
		this.response = response;
		userDAO = new UserDAO(entityManager);
	}

	public void listUser() throws ServletException, IOException {
		listUser(null);
	}

	public void listUser(String message) throws ServletException, IOException {
		List<Users> listUsers = userDAO.listAll();
		request.setAttribute("listUsers", listUsers);
		if (message != null) {
			request.setAttribute("message", message);
		}
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
	}

	public void createUser() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		Users existUser = userDAO.findByEmail(email);

		if (existUser != null) {
			String message = "Could not create user. A user with email " + email + "already exists";
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);
			;
		} else {
			Users newUser = new Users(email, fullName, password);
			userDAO.create(newUser);
			listUser("New user created successfully!!");
		}
	}

	public void editUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		Users user = userDAO.get(userId);
		request.setAttribute("user", user);
		request.getRequestDispatcher("user_form.jsp").forward(request, response);
	}

	public void updateUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");

		Users userById = userDAO.get(userId);
		Users userByEmail = userDAO.findByEmail(email);

		if (userByEmail != null && userByEmail.getUserId() != userById.getUserId()) {
			String message = "Could not update user. User with email " + email + " already exists.";
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);
		} else {
			Users user = new Users(userId, email, fullName, password);
			userDAO.update(user);
			String message = "User has been updated successfully";
			listUser(message);
		}
	}

	public void deleteUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		userDAO.delete(userId);
		String message = "User has been deleted successfully";
		listUser(message);
	}

	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		boolean loginResult = userDAO.checkLogin(email, password);
		if (loginResult) {
			System.out.println("User is authenticated");
			request.getSession().setAttribute("useremail", email);
			request.getRequestDispatcher("/admin/").forward(request, response);
			
		} else {
			String message ="Login failed!";
			request.setAttribute("message", message);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
