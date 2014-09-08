package model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class CastDao {

	EntityManagerFactory factory=Persistence.createEntityManagerFactory("Movie");
	public void createCast(int actorId, int movieId, Cast cast){
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(cast);
		
		Actor actor=em.find(Actor.class, actorId);
		Movie movie=em.find(Movie.class, movieId);
		
		cast.setMovie(movie);
		cast.setActor(actor);
		em.merge(cast);
		
		actor.getCasts().add(cast);
		movie.getCasts().add(cast);
		em.merge(movie);
        em.merge(actor);
        
        em.getTransaction().commit();
        em.close();
	}
	
	public void create3Cast(int actor1Id, int movie1Id, Cast cast1,
			int actor2Id, int movie2Id, Cast cast2,
			int actor3Id, int movie3Id, Cast cast3){
		
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(cast1);
		
		Actor actor1=em.find(Actor.class, actor1Id);
		Movie movie1=em.find(Movie.class, movie1Id);
		
		cast1.setMovie(movie1);
		cast1.setActor(actor1);
		em.merge(cast1);
		
		actor1.getCasts().add(cast1);
		movie1.getCasts().add(cast1);
		em.merge(movie1);
        em.merge(actor1);
        
        em.persist(cast2);
		
		Actor actor2=em.find(Actor.class, actor2Id);
		Movie movie2=em.find(Movie.class, movie2Id);
		
		cast2.setMovie(movie2);
		cast2.setActor(actor2);
		em.merge(cast2);
		
		actor2.getCasts().add(cast2);
		movie2.getCasts().add(cast2);
		em.merge(movie2);
        em.merge(actor2);
        
        em.persist(cast3);
		
		Actor actor3=em.find(Actor.class, actor3Id);
		Movie movie3=em.find(Movie.class, movie3Id);
		
		cast3.setMovie(movie3);
		cast3.setActor(actor3);
		em.merge(cast3);
		
		actor3.getCasts().add(cast3);
		movie3.getCasts().add(cast3);
		em.merge(movie3);
        em.merge(actor3);
        
        em.getTransaction().commit();
        em.close();
	}
	
	public List<Cast> listAllCasts()
	{
		List<Cast> casts = new ArrayList<Cast>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("SELECT c FROM Cast c");
		casts = (List<Cast>)query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return casts;
	}
	
	public boolean findcast(String character){
		boolean check_character = false;
		List<Cast> casts = new ArrayList<Cast>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		casts = listAllCasts();
		for (Cast cast: casts)
		{
			if (cast.getCharactorName().equals(character) )
				check_character = true;
		}

		em.getTransaction().commit();
		em.close();
		return check_character;
	}
	
	public Cast getCast(int castId){
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		
		Cast cast=em.find(Cast.class, castId);
		
		em.getTransaction().commit();
		em.close();
		return cast;
	}
	
	List<Cast> getCastForMovie(int movieId){
		List<Cast> casts=new ArrayList<Cast>();
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		
		Movie movie=em.find(Movie.class, movieId);
		casts=movie.getCasts();
		
		em.getTransaction().commit();
		em.close();
		return casts;
	}
	
	public void changeCharacterForCast(int castId, String newCharacter){
		EntityManager em=factory.createEntityManager();
		em.getTransaction().begin();
		
		Cast cast=em.find(Cast.class, castId);
		cast.setCharactorName(newCharacter);
		em.merge(cast);
		
		em.getTransaction().commit();
		em.close();
	}

	public static void main(String[] args){
		CastDao dao=new CastDao();
		CastDao dao1=new CastDao();

		
		/*Cast cast=new Cast();
		Cast cast1=new Cast();
		Cast cast2=new Cast();


		cast.setCharactorName("action actor");
		cast1.setCharactorName("action actor111");
		cast2.setCharactorName("action actor111");


		dao.create3Cast(1, 1, cast, 1, 1, cast1,1,1,cast2);*/
		System.out.println(dao.findcast("Jennie Carr"));
		
		//dao1.createCast(1, 2, cast1);
		
		/*cast=dao.getCast(1);
		System.out.println(cast.getId());*/
		
		/*List<Cast> casts=dao.getCastForMovie(1);
		
		String newCharacter="action actor";
		dao.changeCharacterForCast(1, newCharacter);*/
	}



}
