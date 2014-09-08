package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/ActorServlet")
public class ActorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actor1 = request.getParameter("actor1");
		String actor2 = request.getParameter("actor2");
		String actor3 = request.getParameter("actor3");
		String character1 = request.getParameter("character1");
		String character2 = request.getParameter("character2");
		String character3 = request.getParameter("character3");
		String username = request.getParameter("username");
		String id = request.getParameter("movieId");
		String title = request.getParameter("title");
		String image = request.getParameter("image");

		ActorDao actorDao = new ActorDao();
		CastDao castDao = new CastDao();
		UserDao userDao = new UserDao();
	    ReviewDao reviewDao = new ReviewDao();
	    MovieDao movieDao = new MovieDao();

		Actor actor_1 = new Actor();
		Actor actor_2 = new Actor();
		Actor actor_3 = new Actor();
		
		Cast character_1 = new Cast();
		Cast character_2 = new Cast();
		Cast character_3 = new Cast();
		
		actor_1.setName(actor1);
		actor_2.setName(actor2);
		actor_3.setName(actor3);

		
		if(actorDao.findActorId(actor1)==0){
		actorDao.createActor(actor_1);
		actorDao.createActor(actor_2);
		actorDao.createActor(actor_3);
		}
		
		int userId = userDao.findUserId(username);
		Movie movie = new Movie();
		movie.setRottenTomatoesId(id);
		movie.setTitle(title);
		movie.setPosterImage(image);
		reviewDao.likeMovie(userId, movie);
		
		int movieId = movieDao.findMovieIdForRottenTomatoesId(id);
		int actor1Id = actorDao.findActorId(actor1);
		int actor2Id = actorDao.findActorId(actor2);
		int actor3Id = actorDao.findActorId(actor3);

        Movie mymovie = movieDao.getMovieForId(movieId);
        
		character_1.setActor(actor_1);
		character_1.setCharactorName(character1);
		character_1.setMovie(mymovie);
		
		character_2.setActor(actor_2);
		character_2.setCharactorName(character2);
		character_2.setMovie(mymovie);
		
		character_3.setActor(actor_3);
		character_3.setCharactorName(character3);
		character_3.setMovie(mymovie);
		
		if(castDao.findcast(character1)==true && actorDao.findActorId(actor1)!=0){
			dispatcher = request.getRequestDispatcher("SearchDetail.jsp");
			dispatcher.forward(request, response);
			}else{
		   castDao.create3Cast(actor1Id, movieId, character_1, actor2Id, movieId, character_2, actor3Id, movieId, character_3);
			dispatcher = request.getRequestDispatcher("SearchDetail.jsp");
			dispatcher.forward(request, response);
			}		
		
	}

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
