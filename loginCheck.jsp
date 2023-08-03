<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String usuario = request.getParameter("userName");
		String contrasena = request.getParameter("password");
	%>
		<%
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
	    Statement dbstatement = dbconect.createStatement();
		try{
		    PreparedStatement consultaP = dbconect.prepareStatement("SELECT * FROM usuarios WHERE NOMBRE	 =? AND CONTRASENA =?");
		    consultaP.setString(1,usuario);
		    consultaP.setString(2,contrasena);
		    
		    ResultSet resultado = consultaP.executeQuery();
		    if(resultado.next()){
		    	String userId = resultado.getString("ID");
		        session.setAttribute("userId", userId);
		        session.setAttribute("username", usuario);
		    	response.sendRedirect("home.jsp");
		    }
			
		}catch (Exception e){
	        out.println("An error occurred: " + e.getMessage());
	        e.printStackTrace();
		}
		%>
</body>
</html>