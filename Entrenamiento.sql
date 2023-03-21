CREATE schema gestion_entrenamiento_mina;
USE gestion_entrenamiento_mina;

#CREACION DE TABLAS SIN CONEXIONES
DROP TABLE operadores;
CREATE TABLE operadores (
CodigoOperador INT NOT NULL,
Primer_NombreOperador VARCHAR(20) NOT NULL,
Primer_ApellidoOperador VARCHAR(20) NOT NULL,
CodigoEntrenador INT NOT NULL,
Categoria_licencia_MTC VARCHAR(8) NOT NULL,
Tipo_puesto VARCHAR(30) NOT NULL,
Fecha_vencimiento_licencia_MTC DATE NOT NULL,
Guardia_operador CHAR NOT NULL,
DNI VARCHAR(8) NOT NULL,
Area_operador VARCHAR(20) NOT NULL,
Condicion_entrenamiento VARCHAR(20) NOT NULL,
Estado_modulo VARCHAR(30) NOT NULL,
CodigoEquipo_Entrenamiento VARCHAR(8) NOT NULL,
PRIMARY KEY (CodigoOperador),
FOREIGN KEY(codigoEntrenador) REFERENCES entrenadores(codigoEntrenador));

DROP TABLE entrenadores;
CREATE TABLE entrenadores (
codigoEntrenador INT NOT NULL,
Primer_NombreEntrenador VARCHAR(20),
Primer_ApellidoEntrenador VARCHAR(20),
Guardia_entrenador CHAR NOT NULL,
CodigoEquipo_Entrenamiento VARCHAR(8) NOT NULL,
PRIMARY KEY (codigoEntrenador),
FOREIGN KEY(CodigoEquipo_Entrenamiento) REFERENCES entrenamiento_equipo(CodigoEquipo_Entrenamiento));

DROP TABLE entrenamiento_equipo;
CREATE TABLE entrenamiento_equipo (
CodigoEquipo_Entrenamiento VARCHAR(8) NOT NULL,
NombreEquipo_entrenamiento VARCHAR(30) NOT NULL,
estado_activo_entrenamiento BOOLEAN NOT NULL,
Estado_Entrenamiento VARCHAR(20) NOT NULL,
Fecha_Inicio_Entrenamiento DATE NOT NULL,
Fecha_Fin_Entrenamiento DATE NOT NULL,
PRIMARY KEY (CodigoEquipo_Entrenamiento));

DROP TABLE estado_entrenamiento;
CREATE TABLE estado_entrenamiento (
estado_activo_entrenamiento BOOLEAN NOT NULL,
Nota_modulo INT NULL,
Estado_modulo VARCHAR(30) NOT NULL,
PRIMARY KEY (estado_activo_entrenamiento));

DROP TABLE monitoreo;
CREATE TABLE monitoreo (
Estado_modulo VARCHAR(30) NOT NULL,
CodigoOperador INT,
NombreEquipo_entrenamiento VARCHAR(30) NOT NULL,
codigoEntrenador INT NOT NULL,
Fecha_monitoreo DATE NOT NULL,
Fecha_proximo_monitoreo DATE NOT NULL,
Horas_monitoreo INT NOT NULL,
Observaciones_monitoreo VARCHAR(30) NOT NULL,
FOREIGN KEY(CodigoOperador) REFERENCES operadores(CodigoOperador),
FOREIGN KEY(codigoEntrenador) REFERENCES entrenadores(codigoEntrenador));

DROP TABLE examen;
CREATE TABLE examen (
    NombreEquipo_entrenamiento VARCHAR(30) NOT NULL,
    CodigoOperador INT NOT NULL,
    codigoEntrenador INT NOT NULL,
    Nota_modulo INT NOT NULL,
    Fecha_examen INT NOT NULL,
    Estado_modulo VARCHAR(30),
    Tipo_examen VARCHAR(10),
	FOREIGN KEY(CodigoOperador) REFERENCES operadores(CodigoOperador),
	FOREIGN KEY(codigoEntrenador) REFERENCES entrenadores(codigoEntrenador));

DROP TABLE usuario_sistema;
CREATE TABLE usuario_sistema (
	codigoEntrenador INT NOT NULL,
    CodigoOperador  INT NOT NULL,
	tipo_usuario VARCHAR(8) NOT NULL,
	FOREIGN KEY(CodigoOperador) REFERENCES operadores(CodigoOperador),
	FOREIGN KEY(codigoEntrenador) REFERENCES entrenadores(codigoEntrenador));

DROP TABLE Horas_entrenamiento;
CREATE TABLE Horas_entrenamiento (
	CodigoEquipo_Entrenamiento VARCHAR(8) NOT NULL,
    Horas_entrenamiento INT NOT NULL,
    Estado_Modulo VARCHAR(30) NOT NULL,
    Fecha_registro_horas_operativas DATE NOT NULL,
    CodigoOperador INT NOT NULL,
    codigoEntrenador INT NOT NULL,
     Horas_operativas INT NOT NULL,
     FOREIGN KEY(CodigoEquipo_Entrenamiento) REFERENCES entrenamiento_equipo(CodigoEquipo_Entrenamiento));

DROP TABLE minestar;
CREATE TABLE minestar (
	CodigoEquipo_Entrenamiento VARCHAR(8) NOT NULL,
    CodigoOperador INT NOT NULL,
    Horas_operativas INT NOT NULL,
	FOREIGN KEY(CodigoEquipo_Entrenamiento) REFERENCES entrenamiento_equipo(CodigoEquipo_Entrenamiento),
    FOREIGN KEY(CodigoOperador) REFERENCES operadores(CodigoOperador));

