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
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String title = request.getParameter("title");
		String posterImage = request.getParameter("posterImage");
		String releaseDate = request.getParameter("releaseDate");
		String description = request.getParameter("description");
		String rottenId = request.getParameter("rottenId");
		String classify = request.getParameter("classify");

		Movie newMovie = new Movie();
		newMovie.setTitle(title);
		newMovie.setPosterImage(posterImage);
		newMovie.setReleaseDate(releaseDate);
		newMovie.setDescription(description);
		newMovie.setRottenTomatoesId(rottenId);
		newMovie.setGeneric(classify);
		MovieDao movieDao = new MovieDao();

		if ("add".equals(action)) {
			movieDao.createMovie(newMovie);
			dispatcher = request.getRequestDispatcher("Update.jsp");
			dispatcher.forward(request, response);
		} else if ("update".equals(action)) {
			String id = request.getParameter("id");
			int movieId = Integer.parseInt(id);
			movieDao.updateMovie(movieId, newMovie);
			dispatcher = request.getRequestDispatcher("Update.jsp");
			dispatcher.forward(request, response);
		}
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
