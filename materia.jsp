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