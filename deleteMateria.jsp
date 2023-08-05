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
    String idMateriaStr = request.getParameter("idMateria");
    int idMateria = Integer.parseInt(idMateriaStr);
    
    try {
        // Establish a database connection
        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje", "root", "");

        // Preparamos la SELECT query  que retornara todos los valores id asociados con el de la materia
        String selectQuery = "SELECT por_id FROM porcentajes WHERE por_mate_id = ?";
        PreparedStatement selectStmt = dbconect.prepareStatement(selectQuery);
        selectStmt.setInt(1, idMateria);

        // Execute the SELECT query
        ResultSet rs = selectStmt.executeQuery();

        // Process the results by working with each por_id
        while (rs.next()) {
            int idPorcentaje = rs.getInt("por_id");

            // Delete associated notas and porcentaje
            try {
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
                        out.println("Porcentaje with id: " + idPorcentaje + " and associated Notas deleted successfully.");
                    } else {
                        out.println("Porcentaje with id: " + idPorcentaje + " deleted successfully, but associated Notas not found.");
                    }
                } else {
                    out.println("Deletion failed! Porcentaje with ID " + idPorcentaje + " not found.");
                }

                // Close the resources for porcentaje deletion
                deleteNotasStmt.close();
                deletePorcentajeStmt.close();
            } catch (Exception e) {
                // Display error message
                e.printStackTrace();
                out.println(e);
            }
        }

        // Delete the materia after deleting associated porcentajes and notas
        String deleteMateriaQuery = "DELETE FROM materias WHERE mat_id = ?";
        PreparedStatement deleteMateriaStmt = dbconect.prepareStatement(deleteMateriaQuery);
        deleteMateriaStmt.setInt(1, idMateria);

        // Execute the DELETE statement for materia
        int materiaRowsAffected = deleteMateriaStmt.executeUpdate();

        if (materiaRowsAffected > 0) {
            out.println("Materia with id: " + idMateria + " deleted successfully.");
        } else {
            out.println("Deletion failed! Materia with ID " + idMateria + " not found.");
        }

        // Close the resources for materia deletion
        deleteMateriaStmt.close();

        // Close the resources for select query
        selectStmt.close();
        dbconect.close();
        response.sendRedirect("home.jsp");
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
        e.printStackTrace();
    }
%>

</body>
</html>