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
    String idNotaStr = request.getParameter("idNota");
    int idNota = Integer.parseInt(idNotaStr);

    try {
        // Establish a database connection
        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje", "root", "");

        // Create the SQL delete statement
        String deleteQuery = "DELETE FROM notas WHERE nota_id = ?";

        // Create a PreparedStatement
        PreparedStatement pstmt = dbconect.prepareStatement(deleteQuery);
        pstmt.setInt(1, idNota);

        // Execute the DELETE statement
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            // Deletion successful
            out.println("Note deleted successfully.");
        } else {
            out.println("Deletion failed! Note with ID " + idNota + " not found.");
        }

        // Close the resources
        pstmt.close();
        dbconect.close();

        response.sendRedirect("materia.jsp");
    } catch (Exception e) {
        // Display error message
        e.printStackTrace();
    }
%>


</body>
</html>