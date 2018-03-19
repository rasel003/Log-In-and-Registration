<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="company.registrationCheck"%>

<!DOCTYPE html>
<html> 
	<body> 
		
		<jsp:useBean id="check" class="company.registrationCheck" scope="session" />
		<jsp:setProperty name="check" property="name" value='<%= request.getParameter("name") %>' />
		<jsp:setProperty name="check" property="email" value='<%= request.getParameter("email") %>' />
 		
		<% String name = check.getName(); String email = check.getEmail();
		   
		   if(name.length()<2 || email.length()<3){
			  response.sendRedirect("registration.html");
		   }else{
			    
				session.setAttribute( "theName", name );
				session.setAttribute( "theEmail", email );
				
				RequestDispatcher rd = request.getRequestDispatcher("/index2.jsp");
				rd.forward(request, response);
			}
		
		%>
	
	</body>
</html>