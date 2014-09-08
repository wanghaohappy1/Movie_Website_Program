package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the cast database table.
 * 
 */
@Entity
@NamedQuery(name="Cast.findAll", query="SELECT c FROM Cast c")
public class Cast implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String charactorName;

	//bi-directional many-to-one association to Actor
	@ManyToOne
	@JoinColumn(name="ActorInMovie")
	private Actor actor;

	//bi-directional many-to-one association to Movie
	@ManyToOne
	@JoinColumn(name="movieActedIn")
	private Movie movie;

	public Cast() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCharactorName() {
		return this.charactorName;
	}

	public void setCharactorName(String charactorName) {
		this.charactorName = charactorName;
	}

	public Actor getActor() {
		return this.actor;
	}

	public void setActor(Actor actor) {
		this.actor = actor;
	}

	public Movie getMovie() {
		return this.movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

}
