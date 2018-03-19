<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="company.registrationCheck"%>

<!DOCTYPE html>
<html> 
	<body> 
		
		
		<% 
	
			session.setAttribute( "loggedUser", "" );
			session.setAttribute( "loginOrNot", "" );
			response.sendRedirect("login.jsp");
		
		%>
		
		
	
	</body>
</html>