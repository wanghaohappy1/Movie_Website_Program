<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="RegisterServlet">
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

				<div id="register">
					<h1>Register</h1>
					<table>
						<tr>
							<td><h3>username</h3></td>
							<td><input name="username" /></td>
						</tr>
						<tr>
							<td><h3>password</h3></td>
							<td><input name="password" type="password" /></td>
						</tr>
						<tr>
							<td><h3>firstName</h3></td>
							<td><input name="firstName" /></td>
						</tr>
						<tr>
							<td><h3>lastName</h3></td>
							<td><input name="lastName" /></td>
						</tr>
						<tr>
							<td><h3>email</h3></td>
							<td><input name="email" /></td>
						</tr>
						<tr>
							<td><h3>dateOfBirth</h3></td>
							<td><input name="dateOfBirth" /></td>
						</tr>
						<tr>
							<td><h3>gender</h3></td>
							<td><input name="gender" /></td>
						</tr>
					</table>

					<button name="action" value="register">Register</button>

				</div>
			</div>
		</div>
	</form>

</body>
</html>
