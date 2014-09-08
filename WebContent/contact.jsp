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
			<form class="required-form" action="php/mail_form.php" method="post">

				<div id="register">
					<h1>Contact My Website</h1>
					<ol class="forms">

						<li><label for="name"><em class="required">*</em>
								Name</label> <input type="text" name="name" id="name" class="required" />
						</li>

						<li><label for="email"><em class="required">*</em>
								Email</label> <input type="text" name="email" id="email"
							class="required" /></li>

						<li><label for="phone">Phone</label> <input type="text"
							name="phone" id="phone" /></li>

						<li><label for="message"><em class="required">*</em>
								Message</label> <textarea name="message" id="message" class="required"></textarea>
						</li>

						<li class="buttons submit">
							<button type="submit">Send Message</button>
						</li>

					</ol>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
