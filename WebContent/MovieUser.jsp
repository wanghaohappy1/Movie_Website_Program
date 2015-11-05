<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/slider.js" type="text/javascript"></script>



<script type="text/javascript">
	$(document).ready(function() {
		$('#slider').s3Slider({
			timeOut : 6000
		});
	});
</script>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
<link href="css/slider.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
	%>
	<div id="outer">
		<div id="wrapper">

			<div id="logo">
				<img src="Image/movies.jpg" width=260px />
			</div>
			<form action="movie-search.jsp">

				<div id="searchengine">
					<input type="hidden" name="username" value="<%=username%>" /> <input
						name="movieName" placeholder="Find Movies">
					<button id="searchMovie" style="width: 90px; height: 30px">
						<h3 id="h3">Search</h3>
					</button>
				</div>

			</form>
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
					<li><a href="MovieDeveloper.jsp">MYHOME</a></li>
					<li><a href="ListMovie.jsp">MOVIE</a></li>
					<li><a href="contact.jsp">CONTACT</a></li>
					<li><a href="login.jsp">LOGIN</a></li>
					<li><a href="UserProfile.jsp">PROFILE</a></li>

				</ul>
			</div>

			<div id="slider">
				<ul id="sliderContent">
					<li class="sliderImage"><a
						href="MovieDetail.jsp?id=1&username=<%=request.getParameter("username")%>"><img
							src="http://pencurimovie.cc/wp-content/uploads/2014/03/Non-Stop.jpg"
							width=900 height=300 /></a> <span class="top"><strong><a
								href="MovieDetail.jsp?id=1&username=<%=request.getParameter("username")%>">Non-stop</a></strong>
							<br />An air marshal springs into action during a transatlantic
							flight after receiving a series of text messages that put his
							fellow passengers at risk unless the airline transfers $150
							million into an off-shore account.<br /></span></li>

					<li class="sliderImage"><a
						href="MovieDetail.jsp?id=2&username=<%=request.getParameter("username")%>"><img
							src="http://www.survivingcollege.com/wp-content/uploads/2013/11/The-Hunger-Games.jpg"
							width=900 height=300 /></a> <span class="top"><strong><a
								href="MovieDetail.jsp?id=2&username=<%=request.getParameter("username")%>">Hunger-Games</a></strong>
							<br />THE HUNGER GAMES: CATCHING FIRE begins as Katniss Everdeen
							has returned home safe after winning the 74th Annual Hunger Games
							along with fellow tribute Peeta Mellark. Winning means that they
							must turn around and leave their family and close friends,
							embarking on a "Victor's Tour" of the districts. Along the way
							Katniss senses that a rebellion is simmering, but the Capitol is
							still very much in control as President Snow prepares the 75th
							Annual Hunger Games (The Quarter Quell) - a competition that
							could change Panem forever. (c) Lionsgate <br /> </span></li>

					<li class="sliderImage"><a
						href="MovieDetail.jsp?id=3&username=<%=request.getParameter("username")%>"><img
							src="http://images6.fanpop.com/image/photos/34900000/the-hobbit-the-desolation-of-smaug-the-hobbit-34960196-3547-2270.jpg"
							width=900 height=300 /></a> <span class="top"><strong><a
								href="MovieDetail.jsp?id=3&username=<%=request.getParameter("username")%>">Hobbit</a></strong>
							<br />The second in a trilogy of films adapting the enduringly
							popular masterpiece The Hobbit, by J.R.R. Tolkien, The Hobbit:
							The Desolation of Smaug continues the adventure of the title
							character Bilbo Baggins (Martin Freeman) as he journeys with the
							Wizard Gandalf (Ian McKellan) and thirteen Dwarves, led by Thorin
							Oakenshield (Richard Armitage) on an epic quest to reclaim the
							lost Dwarf Kingdom of Erebor.(c) WB <br /> </span></li>

					<!--   <li class="sliderImage"><img src="Image/hobbit.jpg" width=900
						height=300 /> <span class="top"><strong>This is
								an image title</strong> <br />Lorem pellentesque habitant morbi
							tristique. <br /> </span></li>-->
				</ul>
			</div>

			<!-- TemplateBeginEditable name="content" -->
			<div id="content">
				<h1>
					Welcome
					<%=request.getParameter("username")%></h1>
				<p>Wlecome to our movie website. In this website you will find
					many movies that you like. Have a nice day and enjoy it!</p>
				<table
					style="clear: both; width: 100%; text-align: center; padding: 13px;">
					<th><h2>Hot</h2></th>
					<tr>
						<%
							MovieDao dao = new MovieDao();
							List<Movie> movies = dao.listHotMovie();
							for (int m = 0; m <= 2; m++) {
								Movie movie = movies.get(m);
						%>
						<td style="text-align: center; padding: 36px;">
							<form name="formname1" action="DeleteServlet">
								<table>
									<tr>
										<td style="text-align: center;"><img
											style="clear: both; text-align: center;" height="126"
											src="<%=movie.getPosterImage()%>" /></td>
									</tr>
									<tr>
										<td style="text-align: center;"><button name="action"
												value="description"
												style="background-color: transparent; border: 0px; cursor: pointer;">
												<h3><%=movie.getTitle()%></h3>
											</button></td>
									</tr>
									<tr>
										<td><input type="hidden" name="title"
											value="<%=movie.getTitle()%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="username"
											value="<%=username%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="id"
											value="<%=movie.getId()%>" /></td>
									</tr>
								</table>
							</form>

						</td>
						<%
							}
						%>
					</tr>
				</table>


				<table
					style="clear: both; width: 100%; text-align: center; padding: 18px; margin-left: 6px;">
					<th><h2>Classic</h2></th>
					<tr>
						<%
							List<Movie> classic_movies = dao.listClassicMovie();
							for (int m = 0; m <= 2; m++) {
								Movie movie = classic_movies.get(m);
						%>

						<td style="text-align: center; padding: 36px;">
							<form name="formname2" action="DeleteServlet">
								<table>
									<tr>
										<td style="text-align: center;"><img
											style="clear: both; text-align: center;" height="126"
											src="<%=movie.getPosterImage()%>" /></td>
									</tr>
									<tr>
										<td style="text-align: center; margin: 6px;"><button
												name="action" value="description"
												style="background-color: transparent; border: 0px; text-align: center; cursor: pointer;">
												<h3 style="text-align: center;"><%=movie.getTitle()%></h3>
											</button></td>
									</tr>
									<tr>
										<td><input type="hidden" name="title"
											value="<%=movie.getTitle()%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="username"
											value="<%=username%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="id"
											value="<%=movie.getId()%>" /></td>
									</tr>
								</table>
							</form>
						</td>
						<%
							}
						%>
					</tr>
				</table>





				<p>Wlecome to our movie website. In this website you will find
					many movies that you like. Have a nice day and enjoy it!</p>
				<ul id="2">
				</ul>
			</div>
			<!-- TemplateEndEditable -->
			<div id="rightside">
				<h2 style="text-align: center;">Coming Soon</h2>
				<p class="date" style="text-align: center;">March 21, 2014</p>
				<form name="formname3" action="SearchDetail.jsp">
					<input type="hidden" name="movieId" value="771321700" /> <input
						type="hidden" name="username" value="<%=username%>" />

					<h3 style="text-align: center;">Muppets Most Wanted</h3>
					<button name="action" value="description"
						style="background-color: transparent; border: 0px; text-align: center; cursor: pointer;">
						<u><p style="text-align: left;">While on a grand world
								tour, The Muppets find themselves wrapped into an European
								jewel-heist caper headed by a Kermit the Frog look-alike and his
								dastardly sidekick.</p></u>
					</button>
				</form>
				<p class="date" style="text-align: center;">March 28, 2014</p>
				<h3 style="text-align: center;">Noah (2014)</h3>
				<form name="formname6" action="SearchDetail.jsp">
					<input type="hidden" name="movieId" value="771305170" /> <input
						type="hidden" name="username" value="<%=username%>" />
					<button name="action" value="description"
						style="background-color: transparent; border: 0px; text-align: center; cursor: pointer;">
						<u><p style="text-align: left;">A man suffering visions of
								an apocalyptic deluge takes measures to protect his family a
								coming flood. Inspired by the Biblical story.</p></u>
					</button>
				</form>
				<p class="date" style="text-align: center;">June 6, 2014</p>
				<h3 style="text-align: center;">Edge of Tomorrow (2014)</h3>
				<form name="formname7" action="SearchDetail.jsp">
					<input type="hidden" name="movieId" value="771317257" /> <input
						type="hidden" name="username" value="<%=username%>" />
					<button name="action" value="description"
						style="background-color: transparent; border: 0px; text-align: center; cursor: pointer;">
						<u><p style="text-align: left;">A soldier fighting in a
								war with aliens finds himself caught in a time loop of his last
								day in the battle, though he becomes better skilled along the
								way.</p></u>
					</button>
				</form>
			</div>

			<div id="footer">
				<p class="footer-text">Copyright - Hao Wang & BoWen Zhu</p>
			</div>

		</div>
	</div>
</body>
</html>
