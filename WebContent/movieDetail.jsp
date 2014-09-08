<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*,java.util.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.1.js"></script>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
String movieName=request.getParameter("title"); 
String username1=request.getParameter("username"); 
//out.print(detail);
int Id=Integer.parseInt(id); 
MovieDao dao=new MovieDao();
Movie movie=dao.getMovieForId(Id);
ReviewDao reviewDao = new ReviewDao();
List<Movie> movies=dao.listAllMovies();
List<Review> reviews = reviewDao.listNReviewsForMovie(5,Id);
%>

<%
	UserDao userDao = new UserDao();
	int userId = userDao.findUserId(username1);
	User user1 = userDao.getUser(userId);
	boolean checkDeveloper = userDao.verifyDeveloper(user1);
	String goDeveloper = "MovieUser.jsp";
	if (checkDeveloper)
	{
		goDeveloper = "MovieDeveloper.jsp";
	}
%>
	<form action="ReviewServlet">
		<div id="outer">
			<div id="wrapper">
				<div id="logo">
					<img src="Image/movies.jpg" width=260px />
				</div>

				<div id="social-media-icons">
					<ul>
						<li><a href="http://www.facebook.com"><img
								src="Image/icons/facebook_32.png" /></a></li>
						<li><a href="#"><img src="Image/icons/rss_32.png" /></a></li>
						<li><a href="http://www.twitter.com"><img
								src="Image/icons/twitter_32.png" /></a></li>
						<li><a href="http://www.youtube.com"><img
								src="Image/icons/youtube_32.png" /></a></li>
					</ul>
				</div>
           <div id="topnav">
				<ul>
					<li><a href="<%=goDeveloper%>?username=<%=username1 %>">MYHOME</a></li>
					<li><a href="ListMovie.jsp">MOVIE</a></li>
					<li><a href="contact.jsp">CONTACT</a></li>
					<li><a href="login.jsp">LOGIN</a></li>
					<li><a href="UserProfile.jsp?username=<%=username1 %>">PROFILE</a></li>
					
				</ul>
			</div>
				<table id="movieList" style="clear: both; width: 40%;">

				</table>
				
				<table id="movieList1">

				</table>
<div id="review">
	<%
		for(Review review:reviews)
		{
			User user = review.getUser();
			String username = user.getUsername();
	
	%>
		<table style="width=36px; height=6px;text-align:center; ">
		<tr style="border:1px solid;"><td><h3><%=username %>:<%=review.getReviews()%></h3></td></tr>
		</table>
	<%} %>
	</div>
	<br/>
				<div id="comment" style="text-align: center;">
					<textarea name="comment"
						style="width: 600px; height: 100px; text-align: left;">
	</textarea>
					<br /> <select name="stars" style="background-color: #0099FF;">
						<option value="1">1 star</option>
						<option value="2">2 star</option>
						<option value="3" selected="selected">3 star</option>
						<option value="4">4 star</option>
						<option value="5">5 star</option>
					</select>
					<button name="action" value="comment">submit comment</button>
					<br />

				</div>
			</div>
			<input type="hidden" name="username"
				value="<%=request.getParameter("username")%>"></input> <input
				type="hidden" name="movieId"
				value="<%=request.getParameter("id")%>"></input>
		</div>
	</form>

	<script>
				jQuery(init);

				function init() {
					var movieName = "<%=movie.getRottenTomatoesId()%>";

			var key = "m88h3a3m37pbjpfx8ug9wtfb";

			jQuery.ajax({
				url : "http://api.rottentomatoes.com/api/public/v1.0/movies/"
						+ movieName + ".json?apikey=" + key,
				dataType : "jsonp",
				success : handleResponse
			});
			// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
		}

		function handleResponse(response) {
			var title = response.title;
			var id = response.id;
			var thumbnail = response.posters.thumbnail;
			var genres = response.genres[1];
			var year = response.year;
			if (response.abridged_directors != null) {
				var director = response.abridged_directors[0].name;
			}

			var list = jQuery("#movieList");
			list.empty();

			var liStr = '<tr id="1234"><td><img height="166" src=""/><button name="action" value="likeit" class="">Like</button></td></tr>'
					+ '<tr><td><span style="color:blue;">Year:      </span><span class="year" value="">Star Wars Episode V</span></td></tr>'
					+ '<tr><td><span style="color:blue;">Title:     </span><span class="title1" value="">Star Wars Episode V</span></td></tr>'
					+ '<tr><td><span style="color:blue;">Genres:    </span><span class="genres" value=""></span></td></tr>'
					+ '<tr><td><span style="color:blue;">Director:  </span><span class="director" value=""></span></td></tr>'
					+ '<tr><td>&nbsp;</td></tr>';

			//var cast =  movie.abridged_cast[0];
			//var synopsis = cast;
			if (response.abridged_directors != null) {
				console.log([ id, title, thumbnail, year, genres, director ]);
			} else {
				console.log([ id, title, thumbnail, year, genres ]);
			}

			var li = jQuery(liStr);
			//li.find("button").attr("value", id);

			li.attr("id", id);
			li.find("img").attr("src", thumbnail);
			li.find(".year").html(year);
			li.find(".title1").html(title);
			li.find(".genres").html(genres);
			if (response.abridged_directors != null) {
				li.find(".director").html(director);
			}

			list.append(li);

			if (response.abridged_cast != null) {
				for (var m = 0; m < response.abridged_cast.length; m++) {
					var name = response.abridged_cast[m].name;
					var character = response.abridged_cast[m].characters[0];
					var listString = '<tr style="clear:both;"><td><span style="color:blue;">Actor:              </span><span class="actor" value=""></span></td><td><span style="color:blue;">as:</span><span class="character" value=""></span></td></tr>'
					var lit = jQuery(listString);
					lit.find(".actor").html(name);
					lit.find(".character").html(character);
					list.append(lit);
				}
			}
			if (response.synopsis != null) {
				var list11 = jQuery("#movieList1");
				list11.empty();
				var synopsis = response.synopsis;
				var listString = '<tr><td>&nbsp;</td></tr><tr><td><span class="synopsis" value=""></span></td></tr><tr><td>&nbsp;</td></tr>'
				var lit = jQuery(listString);
				lit.find(".synopsis").html(synopsis);
				list11.append(lit);
			}

		}
	</script>
</body>
</html>
