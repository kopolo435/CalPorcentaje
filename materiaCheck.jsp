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
		String materiaTitle = request.getParameter("materiaName");
    	session.setAttribute("currentMateria", materiaTitle);
    	int mat_id = 0;
		try {
		    //Conexion a la base de datos
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
	        String userIdStr = (String) session.getAttribute("userId");; // Assuming userId is stored as an int in the session
	        int userId = Integer.parseInt(userIdStr);
		    
		    // Prepare the SELECT query with the WHERE clause to match the mat_nombre and mat_usu_id
		    String selectQuery = "SELECT mat_id FROM materias WHERE mat_nombre = ? AND mat_usu_id = ?";
		    PreparedStatement pstmt = dbconect.prepareStatement(selectQuery);
		    pstmt.setString(1, materiaTitle);
		    pstmt.setInt(2, userId);
		    // Execute the SELECT query
		    ResultSet rs = pstmt.executeQuery();
		    // Process the result
		    if (rs.next()) {
		        mat_id = rs.getInt("mat_id");
		        session.setAttribute("currentIdMateria", mat_id);
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

		response.sendRedirect("materia.jsp");
	%>
	
</body>
</html>