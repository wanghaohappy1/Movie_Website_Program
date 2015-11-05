package controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String comment = request.getParameter("comment");
		String stars = request.getParameter("stars");
		String action = request.getParameter("action");
		int movieId = Integer.parseInt(request.getParameter("movieId"));

		if ("comment".equals(action)) {
			UserDao userDao = new UserDao();
			int userId = userDao.findUserId(username);
			User user = userDao.getUser(userId);

			ReviewDao reviewDao = new ReviewDao();
			Review review = new Review();

			review.setReviews(comment);
			review.setUser(user);
			review.setStar(stars);

			reviewDao.createReview(userId, movieId, review);
		} else {
			UserDao userDao = new UserDao();
			int userId = userDao.findUserId(username);
			User user = userDao.getUser(userId);

			ReviewDao reviewDao = new ReviewDao();
			Review review = new Review();

			review.setReviews("I like it!!!");
			review.setUser(user);
			review.setStar("5");

			reviewDao.createReview(userId, movieId, review);
		}
		dispatcher = request.getRequestDispatcher("MovieDeveloper.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
