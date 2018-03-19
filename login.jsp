   
<html>
	
	<body>
		<jsp:useBean id="check" class="company.registrationCheck" scope="session" />
		
		<% 	
			if (session.getAttribute("loginOrNot") != null && session.getAttribute("loginOrNot").equals("yes")){
			
					RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
					rd.forward(request, response); 
			}
			
		%>
		<div align="center">
		<h3> Sign In </h3>
		<form action="loginValidation.jsp" method="post">
			UserName: <input type="text" name="username"><br><br>
			Password: <input type="password" name="password"><br><br>
			<input type="submit" value="Log In">
		</form>
		</div>
	</body>

</html>