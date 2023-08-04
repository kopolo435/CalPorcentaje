<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js" defer></script>
</head>
<body>
    <header>
        <img src="" alt="Logo de la pagina">
    </header>

    <nav>
        <ul>
            <li><a href="home.html">Inicio</a></li>
            <li><a href="materia.jsp">Lorem</a></li>
            <li><a href="">Lorem</a></li>
        </ul>
    </nav>

    <main>
        <h1>Notas de materias</h1>

        <div class="materiasContainer" id="listaMaterias">
            <div class="materia">
                <button class="eliminarBtn">Eliminar</button>
                <h2 class="nombreMateria">Nombre</h2>
                <p class="estadoNota">Estado nota</p>
                <p class="porcentaje">Porcentaje conseguido</p>
            </div>
            <div class="materia">
                <button class="eliminarBtn">Eliminar</button>
                <h2 class="nombreMateria">Nombre</h2>
                <p class="estadoNota">Estado nota</p>
                <p class="porcentaje">Porcentaje conseguido</p>
            </div>
		    <% 
		    try {
		        //Conexion a la base de datos
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
		        String userIdStr = (String) session.getAttribute("userId");; // Assuming userId is stored as an int in the session
		        int userId = Integer.parseInt(userIdStr);
		        // Prepare the SELECT query
		        String selectQuery = "SELECT mat_nombre, mat_porcentaje, mat_estado FROM materias WHERE mat_usu_id = ?";
		        PreparedStatement pstmt = dbconect.prepareStatement(selectQuery);
		        pstmt.setInt(1, userId);
		
		        // Execute the SELECT query
		        ResultSet rs = pstmt.executeQuery();
		
		        // Process the results and insert HTML elements
		        while (rs.next()) {
		            String mat_nombre = rs.getString("mat_nombre");
		            String mat_porcentaje = rs.getString("mat_porcentaje");
		            String mat_estado = rs.getString("mat_estado");
		            if(mat_estado.equals("si")){
		            	mat_estado = "Pasaste";
		            }
		            else{
		            	mat_estado = "Fracaste";
		            }
		    %>
		            <!-- HTML elements to display data -->
		            <div class="materia">
		                <button class="eliminarBtn">Eliminar</button>
		                <h2 class="nombreMateria"><a href="materia.jsp" class="titleLink"><%= mat_nombre %></a></h2>
		                <p class="estadoNota"><%= mat_estado %></p>
		                <p class="porcentaje"><%= mat_porcentaje %></p>
		            </div>
		            
		    <%
		        }
		
		        // Close the resources
		        rs.close();
		        pstmt.close();
		        dbconect.close();
		
		    } catch (Exception e) {
		        // Handle the exception
		        e.printStackTrace();
		    }
		    %>
            <button class="addMateria" id="addMateria">Añadir nueva materia</button>
        </div>
        <button type="submit" form="newMateria" class="guardarBtn" for>Guardar</button>
    </main>

    <footer>
        <ul>
            <li><a href="">Nombre creador con icono de github</a></li>
            <li><a href="index.html">LogOut</a></li>
        </ul>
    </footer>
</body>
</html>