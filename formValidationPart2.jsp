<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html> 
	<body> 
		
		<jsp:useBean id="check" class="company.registrationCheck" scope="session" />
		<jsp:setProperty name="check" property="username" value='<%= request.getParameter("username") %>' />
		<jsp:setProperty name="check" property="password" value='<%= request.getParameter("password") %>' />
 
		<%
		
		String name = session.getAttribute("theName").toString().trim();
		String email = session.getAttribute("theEmail").toString().trim();
		String username = check.getUsername().trim(); 
		String password = check.getPassword().trim();
		   
		   if(username.length()<2 || password.length()<3){
			  response.sendRedirect("index2.jsp");
		   }else{
			    
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/rasel";
				Class.forName(driver);
					
				Connection con= (Connection) DriverManager.getConnection(url,"root","rasel");
				Statement st=con.createStatement();				
				int i=st.executeUpdate("insert into userinfo (name,email,username,password) values('"+name+"','"+email+"','"+username+"','"+password+"')");
					
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
		
		%>
	
	</body>
</html>