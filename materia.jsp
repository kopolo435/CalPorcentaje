<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <% String materiaName = (String) session.getAttribute("currentMateria");%>
    <title>Notas <%= materiaName %></title>
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
        <h1 id="nombreMate"><%= materiaName %></h1>
        <div class="estadoMateria">
            <p>Estado de notas</p>
            <p class="estado">Completado/En progreso</p>
        </div>
        <div class="materiasContainer" id="materiasCon">
			<% 
		    try {
		        //Conexion a la base de datos
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
		        // Prepare the SELECT query
				int mat_id = (int) session.getAttribute("currentIdMateria");
		        String selectQuery = "SELECT por_id,por_nombre, por_porcentaje FROM porcentajes WHERE por_mate_id = ?";
		        PreparedStatement pstmt = dbconect.prepareStatement(selectQuery);
		        pstmt.setInt(1, mat_id);
		
		        // Execute the SELECT query
		        ResultSet rs = pstmt.executeQuery();
		
		        // Process the results and insert HTML elements
		        while (rs.next()) {
		            String por_nombre = rs.getString("por_nombre");
		            String por_porcentaje = rs.getString("por_porcentaje");
					int por_id = rs.getInt("por_id");
		    %>
		            <!-- HTML elements to display data -->
            <div class="porcentajeContainer">
                <div class="infoPorcentaje">
                    <button class="eliminarPorBtn">Eliminar</button>
                    <h2 class="nombrePorcentaje"><%=por_nombre %></h2>
                    <p class="valorPorcentaje"><%= por_porcentaje%>%</p>
                    <button class="showNotas">Mostrar notas</button>
                </div>
                <div class="notasContainer">
                   	<% 
		    		try {
		    		   	//Conexion a la base de datos
		      		  	Class.forName("com.mysql.jdbc.Driver");
		       		 	Connection dbconect2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
		       		 	// Prepare the SELECT query
		       		 	String selectQuery2 = "SELECT nota_nombre,nota_nota_pos,nota_nota_obt FROM notas WHERE nota_por_id = ?";
		     		   	PreparedStatement pstmt2 = dbconect2.prepareStatement(selectQuery2);
		      		  	pstmt2.setInt(1, por_id);
		
		      		  	// Execute the SELECT query
		      		  	ResultSet rs2 = pstmt2.executeQuery();
		
		      		  	// Process the results and insert HTML elements
		      		  	while (rs2.next()) {
		           		 String nota_nombre = rs2.getString("nota_nombre");
		           		 String nota_posible = rs2.getString("nota_nota_pos");
						 String nota_obtenida = rs2.getString("nota_nota_obt");
		    		%>
		            <!-- HTML elements to display data -->
                    <div class="nota">
                        <button class="eliminarBtn">Eliminar</button>
                        <h3 class="nombreNota"><%=nota_nombre%></h3>
                        <p class="notaObt"><%= nota_obtenida%></p>
                        <p class="notaPos"><%= nota_posible%></p>
                    </div>
		            
		    		<%
		        		}
		        		// Close the resources
		        		rs2.close();
		        		pstmt2.close();
		        		dbconect2.close();
		
		    			} catch (Exception e) {
		        		// Handle the exception
		        		e.printStackTrace();
		    			}
		   			 %>
                    <button class="addNota">Agregar Nota</button>
                </div>
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