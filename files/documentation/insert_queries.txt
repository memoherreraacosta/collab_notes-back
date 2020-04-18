-- -----------------------------------------------------
-- Injection queries
-- -----------------------------------------------------


INSERT INTO `collabnotes`.`ESTUDIANTE`(`nombre`, `idEstudiante`) VALUES("Ejemplo Nombre", 1234);

INSERT INTO `collabnotes`.`ARCHIVO`(`url`, `titulo`, `fecha`, `idEstudiante`, `calificacion`) VALUES("drive.com", "Cloud", "2020-03-06", 1234, 5);

INSERT INTO `collabnotes`.`DOCENTE`(`idDocente`, `nombre`) VALUES(2345, "Sergio Hdz");

INSERT INTO `collabnotes`.`CLASE`(`clave`, `idDocente`, `nombre`,`urlArchivo`) VALUES(1111, 2345, "Clase cloud", "drive.com");

INSERT INTO `collabnotes`.`TAG`(`nombre`) VALUES("Ejemplo Tag");

INSERT INTO `collabnotes`.`ESTUDIANTE`(`nombre`, `idEstudiante`) VALUES("Daniela Gonzalez", 1);
