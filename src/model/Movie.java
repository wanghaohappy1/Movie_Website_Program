package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the movie database table.
 * 
 */
@Entity
@NamedQuery(name="Movie.findAll", query="SELECT m FROM Movie m")
public class Movie implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String description;

	private String generic;

	private String posterImage;

	private String releaseDate;

	private String rottenTomatoesId;

	private String title;

	//bi-directional many-to-one association to Cast
	@OneToMany(mappedBy="movie")
	private List<Cast> casts;

	//bi-directional many-to-one association to Review
	@OneToMany(mappedBy="movie")
	private List<Review> reviews;

	public Movie() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getGeneric() {
		return this.generic;
	}

	public void setGeneric(String generic) {
		this.generic = generic;
	}

	public String getPosterImage() {
		return this.posterImage;
	}

	public void setPosterImage(String posterImage) {
		this.posterImage = posterImage;
	}

	public String getReleaseDate() {
		return this.releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getRottenTomatoesId() {
		return this.rottenTomatoesId;
	}

	public void setRottenTomatoesId(String rottenTomatoesId) {
		this.rottenTomatoesId = rottenTomatoesId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Cast> getCasts() {
		return this.casts;
	}

	public void setCasts(List<Cast> casts) {
		this.casts = casts;
	}

	public Cast addCast(Cast cast) {
		getCasts().add(cast);
		cast.setMovie(this);

		return cast;
	}

	public Cast removeCast(Cast cast) {
		getCasts().remove(cast);
		cast.setMovie(null);

		return cast;
	}

	public List<Review> getReviews() {
		return this.reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public Review addReview(Review review) {
		getReviews().add(review);
		review.setMovie(this);

		return review;
	}

	public Review removeReview(Review review) {
		getReviews().remove(review);
		review.setMovie(null);

		return review;
	}

}
