<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String nombrePor = request.getParameter("nombrePor");
		String valPor = request.getParameter("valPor");
		String nombreMate = request.getParameter("nombreMate");
		int mat_id = 0;
		
		try {
		    //Conexion a la base de datos
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
	        String userIdStr = (String) session.getAttribute("userId");; // Assuming userId is stored as an int in the session
	        int userId = Integer.parseInt(userIdStr);
		    String mat_nombreToMatch = nombreMate ; // Replace this with the mat_nombre you want to match
		    
		    // Prepare the SELECT query with the WHERE clause to match the mat_nombre and mat_usu_id
		    String selectQuery = "SELECT mat_id FROM materias WHERE mat_nombre = ? AND mat_usu_id = ?";
		    PreparedStatement pstmt = dbconect.prepareStatement(selectQuery);
		    pstmt.setString(1, mat_nombreToMatch);
		    pstmt.setInt(2, userId);
		    // Execute the SELECT query
		    ResultSet rs = pstmt.executeQuery();
		    mat_id = rs.getInt("id");
		    //Error al momento de conseguir la fila que devuelve la consulta
		    // Process the result
		    if (rs.next()) {
		        mat_id = rs.getInt("id");
		        // Use the mat_id as needed
			
		    } else {
		        // No match found
		        out.println("No matching record found.");
		    
		    }

		    // Close the resources
		    rs.close();
		    pstmt.close();
		    dbconect.close();

		} catch (Exception e) {
		    // Handle the exception
		    e.printStackTrace();
		    out.println("Un error en la consulta ocurrio");
		}

	%>
	
</body>
</html>