package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


public class ActorDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("Movie");
	
	public void template() {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.getTransaction().commit();
		em.close();
	}
	
	public void createActor(Actor newActor) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(newActor);
		em.getTransaction().commit();
		em.close();
	}
	
	public int findActorId(String actorname) {
		int actorId = 0;
		List<Actor> actors = new ArrayList<Actor>();
		EntityManager em = factory.createEntityManager();
		
		em.getTransaction().begin();
		actors = getAllActors();
		
		for (Actor actor : actors) {
			if (actor.getName().equals(actorname)) {
				actorId = actor.getId();
			}
		}

		em.getTransaction().commit();
		em.close();
		return actorId;				
	}
	
	public void updateActor(Actor newActor, int actorId) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Actor actor = em.find(Actor.class, actorId);
		actor.setName(newActor.getName());
		actor.setRottenTomatoesId(newActor.getRottenTomatoesId());
		actor.setCasts(newActor.getCasts());
		
		em.merge(newActor);
		em.getTransaction().commit();
		em.close();
	}
	
	public List<Actor> getAllActors() {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select actor from Actor actor");
		List<Actor> actors = (List<Actor>)query.getResultList();

		em.getTransaction().commit();
		em.close();
		return actors;
	}
	
	public List<Cast> getCastForActor(int actorId) {
		List<Cast> casts = new ArrayList<Cast>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Actor actor = em.find(Actor.class, actorId);
		casts = actor.getCasts();

		em.getTransaction().commit();
		em.close();
		return casts;
	}
	
	public List<Movie> getMoviesForActor(int actorId) {
		List<Movie> movies = new ArrayList<Movie>();
		List<Cast> casts = new ArrayList<Cast>();
		EntityManager em = factory.createEntityManager();
		
		em.getTransaction().begin();
		Actor actor = em.find(Actor.class, actorId);
		casts = actor.getCasts();
		
		for (Cast cast: casts) {
			Movie movie = cast.getMovie();
			movies.add(movie);
		}

		em.getTransaction().commit();
		em.close();
		return movies;
	}
}
