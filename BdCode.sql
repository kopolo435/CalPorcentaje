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