<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*,java.io.*"%>

<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.1.js"></script>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
<body style="clear: both; font-size: 16px">
	<%
		String movieNamea = request.getParameter("movieId");
		String username = request.getParameter("username");
		String movieName = request.getParameter("movieName");
	%>

	<%
		UserDao userDao = new UserDao();
		int userId = userDao.findUserId(username);
		User user1 = userDao.getUser(userId);
		boolean checkDeveloper = userDao.verifyDeveloper(user1);
		String goDeveloper = "MovieUser.jsp";
		if (checkDeveloper) {
			goDeveloper = "MovieDeveloper.jsp";
		}
	%>
	<input id="movieName" type="hidden" value="<%=movieNamea%>" />

	<form action="ActorServlet">
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
						<li><a href="<%=goDeveloper%>?username=<%=username%>">MYHOME</a></li>
						<li><a href="ListMovie.jsp">MOVIE</a></li>
						<li><a href="contact.jsp">CONTACT</a></li>
						<li><a href="login.jsp">LOGIN</a></li>
						<li><a href="UserProfile.jsp?username=<%=username%>">PROFILE</a></li>

					</ul>
				</div>

				<!--<a href="movie-search.jsp?username=<%=username%>&movieName=<%=movieName%>">return</a>-->
				<table id="movieList" style="clear: both; width: 60%;">

				</table>
				<table id="movieList1">

				</table>
				<input type="hidden" name="actor1" id="actor1"> <input
					type="hidden" name="character1" id="character1"> <input
					type="hidden" name="actor2" id="actor2"> <input
					type="hidden" name="character2" id="character2"> <input
					type="hidden" name="actor3" id="actor3"> <input
					type="hidden" name="character3" id="character3"> <input
					type="hidden" name="title" id="title"> <input type="hidden"
					name="image" id="image"> <input type="hidden"
					name="username" id="username" value="<%=username%>" />




				<script>
					jQuery(init);

					function init() {
						var movieName = jQuery("#movieName").val();

						var key = "m88h3a3m37pbjpfx8ug9wtfb";

						jQuery
								.ajax({
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

						var liStr = '<tr id="1234"><td><img height="166" src=""/><button name="movieId" value="" class="">Like</button></td></tr>'
								+ '<tr><td><span style="color:blue;">Year:      </span><span class="year" value="">Star Wars Episode V</span></td></tr>'
								+ '<tr><td><span style="color:blue;">Title:     </span><span class="title" value="">Star Wars Episode V</span></td></tr>'
								+ '<tr><td><span style="color:blue;">Genres:    </span><span class="genres" value=""></span></td></tr>'
								+ '<tr><td><span style="color:blue;">Director:  </span><span class="director" value=""></span></td></tr>'
								+ '<tr><td>&nbsp;</td></tr>';

						document.getElementById("title").value = title;
						document.getElementById("image").value = thumbnail;

						//var cast =  movie.abridged_cast[0];
						//var synopsis = cast;
						if (response.abridged_directors != null) {
							console.log([ id, title, thumbnail, year, genres,
									director ]);
						} else {
							console.log([ id, title, thumbnail, year, genres ]);
						}

						var li = jQuery(liStr);

						li.attr("id", id);
						li.find("img").attr("src", thumbnail);
						li.find(".year").html(year);
						li.find(".title").html(title);
						li.find(".genres").html(genres);
						li.find("button").attr("value", id);

						if (response.abridged_directors != null) {
							li.find(".director").html(director);
						}

						list.append(li);

						if (response.abridged_cast != null) {
							if (response.abridged_cast.length <= 3) {
								for (var m = 0; m < response.abridged_cast.length; m++) {
									var name = response.abridged_cast[m].name;
									var character = response.abridged_cast[m].characters[0];
									var listString = '<tr style="clear:both;"><td><span style="color:blue;">Actor:              </span><span id="actor" class="actor" value=""></span></td><td><span style="color:blue;">as:</span><span class="character" value=""></span></td><td><button id="btn" name="btn" value="">save the actor</button></td></tr>'
									var lit = jQuery(listString);
									lit.find("button").attr("value", name);
									lit.find("input").attr("value",
											this.character);
									lit.find(".actor").html(name);
									lit.find(".character").html(character);
									list.append(lit);
								}
							} else {
								for (var m = 0; m < 3; m++) {
									var name = response.abridged_cast[m].name;
									var character = response.abridged_cast[m].characters[0];
									var listString = '<tr style="clear:both;"><td><span style="color:blue;">Actor:              </span><span id="actor" class="actor" value=""></span></td><td><span style="color:blue;">as:</span><span class="character" value=""></span></td></tr>'
									var lit = jQuery(listString);
									lit.find("input").attr("value",
											this.character);
									lit.find(".actor").html(name);
									lit.find(".character").html(character);
									list.append(lit);
									if (m == 0) {
										document.getElementById("actor1").value = name;
										document.getElementById("character1").value = character;
									} else if (m == 1) {
										document.getElementById("actor2").value = name;
										document.getElementById("character2").value = character;
									} else {
										document.getElementById("actor3").value = name;
										document.getElementById("character3").value = character;
									}
								}
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
			</div>
		</div>
	</form>
</body>
