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
    String idPorcentajeStr = request.getParameter("idPorcentaje");
    int idPorcentaje = Integer.parseInt(idPorcentajeStr);
    try {
        // Establish a database connection
        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje", "root", "");
        // Create the SQL delete statement for notas
        String deleteNotasQuery = "DELETE FROM notas WHERE nota_por_id = ?";
        // Create the SQL delete statement for porcenajes
        String deletePorcentajeQuery = "DELETE FROM porcentajes WHERE por_id = ?";

        // Create a PreparedStatement for notas deletion
        PreparedStatement deleteNotasStmt = dbconect.prepareStatement(deleteNotasQuery);
        deleteNotasStmt.setInt(1, idPorcentaje);

        // Create a PreparedStatement for porcenajes deletion
        PreparedStatement deletePorcentajeStmt = dbconect.prepareStatement(deletePorcentajeQuery);
        deletePorcentajeStmt.setInt(1, idPorcentaje);

        // Execute the DELETE statements
        int notasRowsAffected = deleteNotasStmt.executeUpdate();
        int porcentajeRowsAffected = deletePorcentajeStmt.executeUpdate();

        if (porcentajeRowsAffected > 0) {
            if (notasRowsAffected > 0) {
                // Deletion successful
                out.println("Porcentaje and associated Notas deleted successfully.");
            } else {
                out.println("Porcentaje deleted successfully, but associated Notas not found.");
            }
        } else {
            out.println("Deletion failed! Porcentaje with ID " + idPorcentaje + " not found.");
        }

        // Close the resources
        deleteNotasStmt.close();
        deletePorcentajeStmt.close();
        dbconect.close();

        response.sendRedirect("materia.jsp");
    } catch (Exception e) {
        // Display error message
        e.printStackTrace();
        out.println(e);
    }
%>

</body>
</html>