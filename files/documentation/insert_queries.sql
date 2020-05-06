-- -----------------------------------------------------
-- Injection queries
-- -----------------------------------------------------

INSERT INTO `collabnotes`.`ESTUDIANTE`(`nombre`, `email`) VALUES("Sebastian", "sebas@gmail.com");
INSERT INTO `collabnotes`.`ESTUDIANTE`(`nombre`, `email`) VALUES("Karol", "karol@gmail.com");

INSERT INTO `collabnotes`.`DOCENTE`(`nombre`) VALUES("Sergio Hdz");

INSERT INTO `collabnotes`.`ARCHIVO`(`url`, `titulo`, `fecha`, `idEstudiante`, `calificacion`) VALUES("drive.com", "Cloud", "2020-03-06", 1, 5);

INSERT INTO `collabnotes`.`CLASE`(`idDocente`, `nombre`,`urlArchivo`) VALUES(1, "Clase cloud", "drive.com");

INSERT INTO `collabnotes`.`TAG`(`nombre`) VALUES("Bayes");

INSERT INTO `collabnotes`.`DOCENTE`(`nombre`) VALUES("Ken Bauer");

INSERT INTO `collabnotes`.`ARCHIVO`(`url`, `titulo`, `fecha`, `idEstudiante`, `calificacion`) VALUES("drive2.com", "Testing", "2020-04-16", 2, 0);

INSERT INTO `collabnotes`.`CLASE`(`idDocente`, `nombre`,`urlArchivo`) VALUES(2, "Clase Testing", "drive2.com");

INSERT INTO `collabnotes`.`TAG`(`nombre`) VALUES("Gauss");

INSERT INTO `collabnotes`.`ESTUDIANTE-CLASE`(`idEstudiante`, `clave`) VALUES(1, 1);
INSERT INTO `collabnotes`.`ESTUDIANTE-CLASE`(`idEstudiante`, `clave`) VALUES(1, 2);
INSERT INTO `collabnotes`.`ESTUDIANTE-CLASE`(`idEstudiante`, `clave`) VALUES(2, 1);
