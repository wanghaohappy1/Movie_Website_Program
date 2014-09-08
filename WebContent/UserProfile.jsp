<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="controller.*,model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
<title>Movies R Us</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
	User currentUser = (User)session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	
	UserDao userDao = new UserDao();
	int userId = userDao.findUserId(username);
	User user = userDao.getUser(userId);
	boolean checkDeveloper = userDao.verifyDeveloper(currentUser);
	String goDeveloper = "MovieUser.jsp";
	if (checkDeveloper)
	{
		goDeveloper = "MovieDeveloper.jsp";
	}
%>
<div id="outer">
<div id="wrapper">
	<form action=<%=goDeveloper %>>
	<div id="login">
		<h1>User Profile</h1>
        <table style="width:60%;">
		<tr>
		<td><h3>username</h3></td>
		<td><%=username %></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
		<td><h3>firstName:</h3></td>
		<td><%=user.getFirstName() %></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
		<td><h3>lastName:</h3></td>
		<td><%=user.getLastName() %></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
		<td><h3>email:</h3></td>
		<td><%=user.getEmail() %></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
		<td><h3>dateOfBirth</h3></td>
		<td><%=user.getDateOfBirth() %></td>
		</tr>
		</table>
			
		<button name="username" value="<%=username%>">OK</button>

	</div>
	</form>
	
	<form action="UserServlet">
	<div id="register">
		<h1>Update User Profile</h1>
        <table>
		<tr>
		<td><h3>password:</h3></td>
		<td><input name="password" type="password" value="<%=user.getPassword() %>"/></td>
		</tr>
		<tr>
		<td><h3>firstName:</h3></td>
		<td><input name="firstName" value="<%=user.getFirstName() %>"/></td>
		</tr>
		<tr>
		<td><h3>lastName:</h3></td>
		<td><input name="lastName" value="<%=user.getLastName() %>"/></td>
		</tr>
		<tr>
		<td><h3>email:</h3></td>
		<td><input name="email" value="<%=user.getEmail() %>"/></td>
		</tr>
		<tr>
		<td><h3>dateOfBirth</h3></td>
		<td><input name="dateOfBirth" value="<%=user.getDateOfBirth() %>"/></td>
		</tr>
		</table>
			
		<button name="username" value="<%=username%>">OK</button>

	</div>
	</form>
	
	<div id="register">
				
				 <table>
				 <th><h2>Movies you liked</h2></th>	
				 <tr>
				<%
					ReviewDao reviewDao = new ReviewDao();
					List<Review> reviews = reviewDao.listReviewsForUser(userId);
					
										
					for (Review review: reviews) {
						Movie movie= review.getMovie();
						
				%>
				<td>
					<form name="formname1" action="MovieDetail.jsp" >				
					<table style="float:left;">
						<tr><td><img style="clear:both; text-align: center;" height="100" src="<%=movie.getPosterImage()%>" /></td></tr>
						<tr><td><button name="action" value="description"
								style="background-color: transparent; border: 0px; cursor: pointer;">
								<h3><%=movie.getTitle()%></h3>
							</button></td></tr>
						<tr><td ><input type="hidden" name="title"
							value="<%=movie.getTitle()%>" /></td></tr>
						<tr><td><input type="hidden" name="username"
							value="<%=username%>" /></td></tr>
						<tr><td><input type="hidden" name="id" value="<%=movie.getId()%>" /></td></tr>
						<tr><td><p><%=movie.getId()%></p></td></tr>
						<tr><td><p><%=review.getReviews()%></p></td></tr>
						<tr><td><button name="action" value="detail">see movie detail</button></td></tr>						
					</table>
					</form>
					
					</td>			
				<%
					}				
				%>
				</tr>
				</table>
		</div>	
	</div>
	</div>

</body>
</html>
