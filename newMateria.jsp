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
	<p>hola</p>
	<%
	    // Get the userId from session attribute and convert it to an int
	    String userIdStr = (String) session.getAttribute("userId");
	    int userId = 0; // Default value in case of conversion failure
	    if (userIdStr != null && !userIdStr.isEmpty()) {
	        try {
	            userId = Integer.parseInt(userIdStr);
	        } catch (NumberFormatException e) {
	            // Handle the exception or log it
	            e.printStackTrace();
	        }
	    }
    	String username = (String) session.getAttribute("username");
		String nombreMateria = request.getParameter("nomMateria");
		String estadoMateria = request.getParameter("estadoNota");
		String porcentaje = request.getParameter("porcentaje");
	%>
	
	<%
	try {
	    //Conexion a la base de datos
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
	    
	    // The "mat_id" column is excluded from the INSERT statement since it's auto-incremented
	    
	    String insertarsql = "INSERT INTO materias(mat_nombre, mat_porcentaje, mat_estado, mat_usu_id) VALUES (?, ?, ?, ?)";
	    PreparedStatement pstmt = dbconect.prepareStatement(insertarsql, Statement.RETURN_GENERATED_KEYS);
	    pstmt.setString(1, nombreMateria);
	    pstmt.setString(2, porcentaje);
	    pstmt.setString(3, estadoMateria);
	    pstmt.setInt(4, userId);

	    // Execute the INSERT statement
	    pstmt.executeUpdate();

	    // Retrieve the auto-incremented value for mat_id, if needed
	    ResultSet rs = pstmt.getGeneratedKeys();
	    if (rs.next()) {
	        int mat_id = rs.getInt(1);
	        // You can use this mat_id if needed
	    }

	    // Close the resources
	    pstmt.close();
	    dbconect.close();

	    response.sendRedirect("home.jsp");
	} catch (Exception e) {
	    // Muestra mensaje de error
	    e.printStackTrace();
	}
	%>
</body>
</html>