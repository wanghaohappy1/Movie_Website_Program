<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="controller.*,model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/mystyle1.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
			<form action="UpdateServlet">
				<div id="add">
					<h1>create movie</h1><h6 style="float:right;"><a href="<%=goDeveloper%>?username=<%=username %>"><u>return</u></a></h6>
					<table>
						<tr>
							<td><h2>title</h2></td>
							<td><input name="title" /></td>
						</tr>
						<tr>
							<td><h2>posterImage</h2></td>
							<td><input name="posterImage" /></td>
						</tr>
						<tr>
							<td><h2>releaseDate</h2></td>
							<td><input name="releaseDate" /></td>
						</tr>
						<tr>
							<td><h2>description</h2></td>
							<td><input name="description" /></td>
						</tr>
						<tr>
							<td><h2>rottenId</h2></td>
							<td><input name="rottenId" /></td>
						</tr>
						<tr>
							<td><h2>classify</h2></td>
							<td><input name="classify" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><button name="action" value="add">Add</button></td>
						</tr>
					</table>
				</div>
			</form>

			<form action="UpdateServlet">
				<div id="update">
					<h1>update movie</h1>
					<input type="hidden" name="id" value="<%=request.getParameter("id") %>" />
					<table>
						<tr>
							<td><h2>title</h2></td>
							<td><input name="title" /></td>
						</tr>
						<tr>
							<td><h2>posterImage</h2></td>
							<td><input name="posterImage" /></td>
						</tr>
						<tr>
							<td><h2>releaseDate</h2></td>
							<td><input name="releaseDate" /></td>
						</tr>
						<tr>
							<td><h2>description</h2></td>
							<td><input name="description" /></td>
						</tr>
						<tr>
							<td><h2>rottenId</h2></td>
							<td><input name="rottenId" /></td>
						</tr>
						<tr>
							<td><h2>classify</h2></td>
							<td><input name="classify" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><button name="action" value="update">Update</button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
