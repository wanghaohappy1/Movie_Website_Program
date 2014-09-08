package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.*;

public class ReviewDao {
	EntityManagerFactory factory=Persistence.createEntityManagerFactory("Movie");
	
	
	public void createReview(int userId, int movieId, Review review){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(review);
		User user = em.find(User.class, userId);
		Movie movie = em.find(Movie.class, movieId);
		
		review.setUser(user);
		review.setMovie(movie);
		em.merge(review);
		
		user.getReviews().add(review);
		em.merge(user);
		
		movie.getReviews().add(review);
		em.merge(movie);
		
		em.getTransaction().commit();
		em.close();
        
	}
	
	public void likeMovie(int userId, Movie movie)
	{
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		
		Review review = new Review();
		review.setStar("5");
		MovieDao movieDao = new MovieDao();
		boolean checkMovie = movieDao.checkMovie(movie.getRottenTomatoesId());
		if(!checkMovie)
		{
			movieDao.createMovie(movie);
		}
		int movieId = movieDao.findMovieIdForRottenTomatoesId(movie.getRottenTomatoesId());
		
		createReview(userId,movieId,review);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public Review getReview(int reviewId){
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		
		Review review=em.find(Review.class, reviewId);
		
		em.getTransaction().commit();
		em.close();
		return review;
	}
	
	public List<Review> listAllReviews()
	{
		List<Review> reviews = new ArrayList<Review>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select review from Review review");
		reviews = (List<Review>)query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return reviews;
	}
	
	public List<Review> listNReviewsForMovie(int n, int movieId)
	{
		List<Review> reviews = new ArrayList<Review>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		List<Review> allReviews = listAllReviews();
		if(allReviews.size()<n)
			n=allReviews.size();
		int i = n;
		for(int k= allReviews.size()-1; k >= 0 ; k--)
		{
			if(movieId == allReviews.get(k).getMovie().getId())
				if(i > 0)
				{
					reviews.add(allReviews.get(k));
					i--;
				}
		}
		
		em.getTransaction().commit();
		em.close();
		return reviews;
	}

	
	public void updateReview(int reviewId, Review review){
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		
		Review reviewed=em.find(Review.class, reviewId);
		reviewed.setReviews(review.getReviews());
		reviewed.setDateOfReview(review.getDateOfReview());
		reviewed.setStar(review.getStar());
		em.merge(reviewed);
		em.getTransaction().commit();
		em.close();
	}
	
	public List<Review> listReviewsForUser(int userId)
	{
		List<Review> reviews = new ArrayList<Review>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		List<Review> allReviews = listAllReviews();
		for(Review review: allReviews)
		{
			if(userId == review.getUser().getId() && review.getStar().equals("5"))
				reviews.add(review);
		}
		
		em.getTransaction().commit();
		em.close();
		return reviews;
	}
	
	public void deleteReview(int reviewId){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Review review = em.find(Review.class, reviewId);
        
        User user=review.getUser();
		Movie movie=review.getMovie();
		
		em.remove(review);

		em.getTransaction().commit();
		em.close();
	}
	public static void main(String[] args) {
		ReviewDao dao = new ReviewDao();
		
		Review review = new Review();
		review.setReviews("aaa");
		
		Review review1 = new Review();
		review1.setReviews("aaa");
		
		dao.createReview(18, 2, review1);
		dao.createReview(18, 2, review);
		List<Review> reviews = dao.listAllReviews();
		for (Review review2: reviews)
		{
			System.out.println(review2.getReviews());
		}

	}
}
