package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class MovieDao {
	
	EntityManagerFactory factory=Persistence.createEntityManagerFactory("Movie");
	
	public List<Movie> listAllMovies(){
		List<Movie> movies=new ArrayList<Movie>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select movie from Movie movie");
		movies = query.getResultList();

		em.getTransaction().commit();
		em.close();
		return movies;
	}
	
	public List<Movie> listHotMovie(){
		MovieDao dao = new MovieDao();
		List<Movie> movies=dao.listAllMovies();
		List<Movie> Hot_Movies = new ArrayList<Movie>();
		for(Movie movie : movies){
			if(movie.getGeneric()!=null){
			    if(movie.getGeneric().equals("hot")){
				    Hot_Movies.add(movie);
			    }
			}
		}
		return Hot_Movies;
	}
	
	public List<Movie> listClassicMovie(){
		MovieDao dao = new MovieDao();
		List<Movie> movies=dao.listAllMovies();
		List<Movie> Classic_Movies = new ArrayList<Movie>();
		for(Movie movie : movies){
			if(movie.getGeneric()!=null){
			    if(movie.getGeneric().equals("classic")){
			    	Classic_Movies.add(movie);
			    }
			}
		}
		return Classic_Movies;
	}
	
	public void createMovie(Movie newMovie){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(newMovie);

		em.getTransaction().commit();
		em.close();
	}
	
	public void updateMovie(int movieId, Movie newMovie){
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		
		Movie movie=em.find(Movie.class, movieId);
		movie.setDescription(newMovie.getDescription());
		movie.setPosterImage(newMovie.getPosterImage());
		movie.setReleaseDate(newMovie.getReleaseDate());
		movie.setRottenTomatoesId(newMovie.getRottenTomatoesId());
		movie.setTitle(newMovie.getTitle());
		movie.setGeneric(newMovie.getGeneric());

		em.merge(movie);
		em.getTransaction().commit();
		em.close();
	}
	
	public void deleteMovie(int movieId){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Movie movie = em.find(Movie.class, movieId);
		em.remove(movie);

		em.getTransaction().commit();
		em.close();
	}
	
	public List<Review> getReviewsForMovie(int movieId){
		List<Review> reviews=new ArrayList<Review>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Movie movie=em.find(Movie.class, movieId);
		reviews= movie.getReviews();
		
		em.getTransaction().commit();
		em.close();
		return reviews;
	}
	
	List<Cast> getCastForMovie(int movieId){
		List<Cast> casts=new ArrayList<Cast>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Movie movie=em.find(Movie.class, movieId);
		casts= movie.getCasts();
		
		em.getTransaction().commit();
		em.close();
		return casts;
	}
	
	    public Movie getMovieForId(int movieId){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Movie movie=em.find(Movie.class, movieId);
		
		em.getTransaction().commit();
		em.close();
		return movie;
	}
	    
		public int findMovieId(String rottenTomatoesId) 
		{
			int movieId = 0;
			List<Movie> movies = new ArrayList<Movie>();
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();

			 movies = listAllMovies();
			for (Movie movie : movies)
			{
				if (movie.getRottenTomatoesId().equals(rottenTomatoesId))
					movieId = movie.getId();
			}

			em.getTransaction().commit();
			em.close();
			return movieId;
		}
	    
	    List<Actor> getActorsForMovie(int movieId){
			List <Actor> actors=new ArrayList<Actor>();
			List <Cast> casts=new ArrayList<Cast>();
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();

			Movie movie=em.find(Movie.class, movieId);
			casts=movie.getCasts();
			for(Cast cast:casts){
				Actor actor=cast.getActor();
				actors.add(actor);
			}
	        		
			em.getTransaction().commit();
			em.close();
			return actors;
		}
	    
	    public int findMovieIdForRottenTomatoesId(String rottenTomatoesId)
		{
			int movieId = 0;
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();

			List<Movie> movies = listAllMovies();
			for(Movie movie : movies)
			{
				if (rottenTomatoesId.equals(movie.getRottenTomatoesId()))
				{
					movieId = movie.getId();
				}
			}

			em.getTransaction().commit();
			em.close();
			return movieId;
		}
		
	    public void changeMovie(int movieId1,int movieId2){
			EntityManager em=factory.createEntityManager();
			em.getTransaction().begin();
			
			Movie movie1=em.find(Movie.class, movieId1);
			Movie movie2=em.find(Movie.class, movieId2);
			List<Review> reviews1 = movie1.getReviews();
			List<Review> reviews2 = movie2.getReviews();
			List<Cast> casts1 = movie1.getCasts();
			List<Cast> casts2 = movie2.getCasts();
			
			Movie temp1 = new Movie();
			temp1.setTitle(movie1.getTitle());
			temp1.setRottenTomatoesId(movie1.getRottenTomatoesId());
			temp1.setReleaseDate(movie1.getReleaseDate());
			temp1.setPosterImage(movie1.getPosterImage());
			temp1.setDescription(movie1.getDescription());
			temp1.setGeneric(movie1.getGeneric());
			temp1.setCasts(movie1.getCasts());
			temp1.setReviews(movie1.getReviews());
			temp1.setId(movieId2);

			Movie temp2 = new Movie();
			temp2.setTitle(movie2.getTitle());
			temp2.setRottenTomatoesId(movie2.getRottenTomatoesId());
			temp2.setReleaseDate(movie2.getReleaseDate());
			temp2.setPosterImage(movie2.getPosterImage());
			temp2.setDescription(movie2.getDescription());
			temp2.setGeneric(movie2.getGeneric());
			temp2.setCasts(movie2.getCasts());
			temp2.setReviews(movie2.getReviews());
			temp2.setId(movieId1);
			
			em.merge(temp1);
			
			for (Review review: reviews1)
			{
				review.setMovie(temp1);
				em.merge(review);
			}
			for (Cast cast: casts1)
			{
				cast.setMovie(temp1);
				em.merge(cast);
			}
			
			

			em.merge(temp2);
			
			for(Review review: reviews2)
			{
				review.setMovie(temp2);
				em.merge(review);
			}
			
			for(Cast cast: casts2)
			{
				cast.setMovie(temp2);
				em.merge(cast);
			}
			
			em.getTransaction().commit();
			em.close();
		}

		public boolean checkMovie(String rottenTomatoesId)
		{
			boolean check = false;
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();

			List<Movie> movies = listAllMovies();
			for(Movie movie: movies)
			{
				if(rottenTomatoesId.equals(movie.getRottenTomatoesId()))
				{
					check = true;
				}
			}
			
			em.getTransaction().commit();
			em.close();
			return check;

		}
	
	public static void main(String[] args){
		MovieDao movieDao=new MovieDao();
		//Movie movie=movieDao.getMovieForId(1);
		
		//System.out.println(movie.getTitle());
		
		List<Movie> movies=movieDao.listClassicMovie();
		for(Movie movie : movies){
			System.out.println(movie.getTitle());
		}
		System.out.println(movieDao.findMovieIdForRottenTomatoesId("771304322"));

		/*Movie oldMovie=movieDao.getMovieForId(2);
		Movie newMovie= movieDao.getMovieForId(3);
		Movie tempMovie = new Movie();
		tempMovie.setDescription(oldMovie.getDescription());
		tempMovie.setPosterImage(oldMovie.getPosterImage());
		tempMovie.setTitle("B");
		tempMovie.setReleaseDate(oldMovie.getReleaseDate());
		tempMovie.setRottenTomatoesId(oldMovie.getRottenTomatoesId());
		tempMovie.setClassify(oldMovie.getClassify());
		
		movieDao.updateMovie(2, newMovie);
		movieDao.updateMovie(3, tempMovie);*/
		
		/*Movie movie1= new Movie();
		movie1.setDescription("biggest movie");
		movie1.setPosterImage("http://google.com");
		movie1.setReleaseDate("2013-06-06");
		movie1.setTitle("star war");
		movie1.setRottenTomatoesId("123456");
		movie1.setGeneric("HOT");
		movieDao.updateMovie(10, movie1);*/
		
		/*List<Cast> cast=dao.getCastForMovie(1);
		System.out.println(cast.get(0).getCharactorName());*/
		
		/*List<Movie> movies=dao.listAllMovies();
		for(Movie movie : movies){
			System.out.println(movie.getTitle());
			System.out.println(movie.getDescription());

		}
		
		
		List<Review> reviews=dao.getReviewsForMovie(1);
		for(Review review : reviews){
			System.out.println(review.getDateOfReview());
			System.out.println(review.getReviews());

		}
		
		List<Actor> actors=dao.getActorsForMovie(1);
		for(Actor actor : actors){
			System.out.println(actor.getName());
			System.out.println(actor.getId());

		}*/
		//movieDao.deleteMovie(10);
		
		//List<Cast> casts=dao.getCastForMovie(1);
		/*String movie=dao.getMovieForId(1);
		System.out.println(movie);*/
		
	}

}
