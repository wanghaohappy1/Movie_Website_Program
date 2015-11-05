package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		MovieDao movieDao = new MovieDao();
		if ("delete".equals(action)) {
			String id = request.getParameter("id");
			int movieId = Integer.parseInt(id);
			movieDao.deleteMovie(movieId);
			dispatcher = request.getRequestDispatcher("MovieDeveloper.jsp");
			dispatcher.forward(request, response);
		} else if ("change".equals(action)) {
			String id = request.getParameter("id");
			String newId = request.getParameter("newIdd");
			int movieId = Integer.parseInt(id);
			int movieNewId = Integer.parseInt(newId);

			movieDao.changeMovie(movieId, movieNewId);
			dispatcher = request.getRequestDispatcher("MovieDeveloper.jsp");
			dispatcher.forward(request, response);

		} else if ("edit".equals(action)) {
			dispatcher = request.getRequestDispatcher("Update.jsp");
			dispatcher.forward(request, response);
		} else if ("description".equals(action)) {
			dispatcher = request.getRequestDispatcher("MovieDetail.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteServlet() {
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
