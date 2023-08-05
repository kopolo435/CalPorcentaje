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
		String nombreNota = request.getParameter("nombreNota");
		String notaPos = request.getParameter("notaPos");
		String notaObt = request.getParameter("notaObt");
		String nombrePor = request.getParameter("nombrePor");
		int por_id = 0;
		
		try {
		    //Conexion a la base de datos
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
		    int mat_id = (int) session.getAttribute("currentIdMateria");
		    
		    // Prepare the SELECT query with the WHERE clause to match the mat_nombre and mat_usu_id
		    String selectQuery = "SELECT por_id FROM porcentajes WHERE por_nombre = ? AND por_mate_id = ?";
		    PreparedStatement pstmt = dbconect.prepareStatement(selectQuery);
		    pstmt.setString(1, nombrePor);
		    pstmt.setInt(2, mat_id);
		    // Execute the SELECT query
		    ResultSet rs = pstmt.executeQuery();
		    // Process the result
		    if (rs.next()) {
		        por_id = rs.getInt("por_id");
		        session.setAttribute("porcentaje_id", por_id);
			
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
	
		<%
	try {
	    //Conexion a la base de datos
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
	    
	    int mat_id = (int) session.getAttribute("currentIdMateria");
	    String insertarsql = "INSERT INTO notas(nota_nombre,nota_nota_pos,nota_nota_obt,nota_por_id) VALUES (?, ?, ?,?)";
	    PreparedStatement pstmt = dbconect.prepareStatement(insertarsql, Statement.RETURN_GENERATED_KEYS);
	    pstmt.setString(1, nombreNota);
	    pstmt.setString(2, notaPos);
	    pstmt.setString(3, notaObt);
	    pstmt.setInt(4, por_id);

	    // Execute the INSERT statement
	    pstmt.executeUpdate();
	    out.println("hola que tal");
	    // Close the resources
	    pstmt.close();
	    dbconect.close();

	    response.sendRedirect("materia.jsp");
	} catch (Exception e) {
	    // Muestra mensaje de error
	    e.printStackTrace();
	}
	%>

</body>
</html>