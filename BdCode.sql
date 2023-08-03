create table materias(
    mat_id NUMBER(30),
    mat_nombre VARCHAR2(30),
    mat_porcentaje VARCHAR2(30),
    mat_estado VARCHAR2(30),
    mat_usu_id NUMBER(30),
    CONSTRAINT mat_usu_fk FOREING KEY(mat_usu_id) REFERENCES usuarios(id)
)

CREATE TABLE porcentajes (
    por_id INT(30) AUTO_INCREMENT PRIMARY KEY,
    por_nombre VARCHAR(30),
    por_porcentaje VARCHAR(30),
    por_mate_id INT(30),
    CONSTRAINT por_mate_fk FOREIGN KEY (por_mate_id) REFERENCES materias(mat_id)
);
/*
	<%
	try {
	    //Conexion a la base de datos
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
	    
	    // The "mat_id" column is excluded from the INSERT statement since it's auto-incremented
	    
	    String insertarsql = "INSERT INTO porcentajes(por_nombre, por_porcentaje, por_mate_id) VALUES (?, ?, ?)";
	    PreparedStatement pstmt = dbconect.prepareStatement(insertarsql, Statement.RETURN_GENERATED_KEYS);
	    pstmt.setString(1, nombrePor);
	    pstmt.setString(2, valPor);
	    pstmt.setInt(3, mat_id);

	    // Execute the INSERT statement
	    pstmt.executeUpdate();

	    pstmt.close();
	    dbconect.close();

	    response.sendRedirect("materia.jsp");
	} catch (Exception e) {
	    // Muestra mensaje de error
	    e.printStackTrace();
	}
	%>

    */