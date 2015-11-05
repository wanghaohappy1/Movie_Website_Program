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
	<form action="LoginServlet">
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
					<h1>Login</h1>
					<div class="login1">
						<table>
							<tr>
								<td><h2>username</h2></td>
								<td><input name="username" /></td>
							</tr>
							<tr>
								<td><h2>password</h2></td>
								<td><input name="password" type="password" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><button name="action" value="login">Login</button></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="register">
					<h1>Register</h1>
					<table>
						<tr>
							<td><a href="register.jsp"><u><h2>please click
											register</h2></u></a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
