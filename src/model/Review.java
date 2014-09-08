package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the review database table.
 * 
 */
@Entity
@NamedQuery(name="Review.findAll", query="SELECT r FROM Review r")
public class Review implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String dateOfReview;

	private String reviews;

	private String star;

	//bi-directional many-to-one association to Movie
	@ManyToOne
	@JoinColumn(name="movieReviewed")
	private Movie movie;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="reviewer")
	private User user;

	public Review() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDateOfReview() {
		return this.dateOfReview;
	}

	public void setDateOfReview(String dateOfReview) {
		this.dateOfReview = dateOfReview;
	}

	public String getReviews() {
		return this.reviews;
	}

	public void setReviews(String reviews) {
		this.reviews = reviews;
	}

	public String getStar() {
		return this.star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public Movie getMovie() {
		return this.movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
