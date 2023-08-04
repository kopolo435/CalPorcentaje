<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NombreMateria</title>
    <link rel="stylesheet" href="style.css">
    <script src="materia.js" defer></script>
</head>
<body>
    <header>
        <img src="" alt="Logo de la pagina">
    </header>

    <nav>
        <ul>
            <li><a href="home.html">Inicio</a></li>
            <li><a href="">Lorem</a></li>
            <li><a href="">Lorem</a></li>
        </ul>
    </nav>

    <main>
        <h1 id="nombreMate">biologia</h1>
        <div class="estadoMateria">
            <p>Estado de notas</p>
            <p class="estado">Completado/En progreso</p>
        </div>
        <div class="materiasContainer" id="materiasCon">
            <div class="porcentajeContainer">
                <div class="infoPorcentaje">
                    <button class="eliminarPorBtn">Eliminar</button>
                    <h2 class="nombrePorcentaje">Nombre Porcentaje</h2>
                    <p class="valorPorcentaje">Porcentaje</p>
                    <button class="showNotas">Mostrar notas</button>
                </div>
                <div class="notasContainer">
                    <div class="nota">
                        <button class="eliminarBtn">Eliminar</button>
                        <h3 class="nombreNota">Nombre nota</h3>
                        <p class="notaObt">Nota obtenida</p>
                        <p class="notaPos">Nota posible</p>
                    </div>
                    <div class="nota">
                        <button class="eliminarBtn">Eliminar</button>
                        <h3 class="nombreNota">Nombre nota</h3>
                        <p class="notaObt">Nota obtenida</p>
                        <p class="notaPos">Nota posible</p>
                    </div>
                    <button class="addNota">Agregar Nota</button>
                </div>
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
		                <h2 class="nombreMateria"> <%= mat_nombre %></h2>
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
            <button id="addPorcentaje">Agrega Porcentaje</button>
        </div>
        <div class="funcionamiento">
            <p>Como funciona</p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, sapiente?</p>
        </div>
        <button class="guardarBtn" type="submit" form="newForm">Guardar</button>
    </main>

    <footer>
        <ul>
            <li><a href="">Nombre creador con icono de github</a></li>
            <li><a href="index.html">LogOut</a></li>
        </ul>
    </footer>
</body>
</html>