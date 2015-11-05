<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="controller.*,model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movies R Us</title>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
</head>
<body>
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
			<div id="login">

				<%
					User currentUser = (User) session.getAttribute("currentUser");
					String username = currentUser.getUsername();

					UserDao userDao = new UserDao();
					int userId = userDao.findUserId(username);
					User user = userDao.getUser(userId);
					boolean checkDeveloper = userDao.verifyDeveloper(currentUser);
					String goDeveloper = "MovieUser.jsp";
					if (checkDeveloper) {
						goDeveloper = "MovieDeveloper.jsp";
					}

					MovieDao movieDao = new MovieDao();
					List<Movie> movieList = movieDao.listAllMovies();
					CastDao castDao = new CastDao();
					for (Movie movie : movieList) {
				%>
				<form name="formname1" action="DeleteServlet">
					<table>
						<tr>
							<td style="text-align: left;"><img
								style="clear: both; text-align: left;" height="100"
								src="<%=movie.getPosterImage()%>" /></td>
						</tr>
						<tr>
							<td style="text-align: left;"><button name="action"
									value="description"
									style="background-color: transparent; border: 0px; cursor: pointer;">
									<h3><%=movie.getTitle()%></h3>
								</button></td>
						</tr>
						<table style="width: 60%;">
							<%
								List<Cast> casts = movie.getCasts();
									if (!casts.isEmpty()) {
							%>
							<tr>
								<th>cast list</th>
							</tr>
							<%
								for (Cast cast : casts) {
							%>
							<tr>
								<td><%=cast.getActor().getName()%></td>
								<td><p>as :</p></td>
								<td><%=cast.getCharactorName()%></td>
							</tr>
							<%
								}
									}
							%>
						</table>
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
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>
