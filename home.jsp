<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="company.registrationCheck"%>

<!DOCTYPE html>
<html> 
	<body> 
		
		
		<% 
			if (session.getAttribute("loginOrNot") != null && session.getAttribute("loginOrNot").equals("yes")){
			
				out.println("welcome mr. "+session.getAttribute("loggedUser"));
			}
			else {
				//out.println("homepage is null");
				response.sendRedirect("login.jsp");
			}
		
		%>
		<br> <br>
		<a href="logOut.jsp"> <Button> Log Out </Button> </a>
		
		
	
	</body>
</html>