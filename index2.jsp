   
<html>
	
	<body>
		<% 	
		if(session.getAttribute("theName")==null || session.getAttribute("theEmail")==null ){
				response.sendRedirect("registration.html");
		}
		
		%>
		<div align="center">
		<h3>Registration Part Two </h3>
		<form action="formValidationPart2.jsp" method="post">
			UserName: <input type="text" name="username"><br><br>
			Password: <input type="password" name="password"><br><br>
			<input type="submit" value="Submit">
		</form>
		</div>
	</body>

</html>