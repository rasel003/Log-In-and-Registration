<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	
	<body>
		<jsp:useBean id="logObj" class="company.logBean" scope="session" />
		<jsp:setProperty name="logObj" property="username" value='<%= request.getParameter("username") %>' />
		<jsp:setProperty name="logObj" property="password" value='<%= request.getParameter("password") %>' />
		<% 	
		  boolean isValid = false;
		  String username = logObj.getUsername().trim(); 
		  String password = logObj.getPassword().trim();
		  
		  if(!username.isEmpty() && !password.isEmpty()){
				
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/rasel";
				Class.forName(driver);
					
				Connection con= (Connection) DriverManager.getConnection(url,"root","rasel");
				PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT * from userinfo");
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()){
					if(username.equals(rs.getString("username").trim()) && password.equals(rs.getString("password").trim()) ) {
						session.setAttribute( "loggedUser", username );
						isValid = true;
					}
				}
		  }  
		  if(isValid){
				session.setAttribute( "loginOrNot", "yes" );
				RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
				rd.forward(request, response); 
				logObj.setVisitNumber(0);
		  }else {
			 int i = logObj.getVisitNumber();
			 i++;
			 logObj.setVisitNumber(i);
			 System.out.println("value of i: "+i);
			 if(logObj.getVisitNumber()>3){
				
				response.sendRedirect("forget.html");
			 }else { 
				response.sendRedirect("login.jsp");
			};
	
		  }
		  
		%>
	</body>

</html>