-- -----------------------------------------------------
-- Schema collabnotes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `collabnotes` DEFAULT CHARACTER SET utf8 ;
USE `collabnotes` ;


-- -----------------------------------------------------
-- Tabla ESTUDIANTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`ESTUDIANTE` (
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `idEstudiante` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idEstudiante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla ARCHIVO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`ARCHIVO` (
  `url` VARCHAR(100) NOT NULL,
  `titulo` VARCHAR(40) NOT NULL,
  `fecha` DATE NOT NULL,
  `idEstudiante` INT NOT NULL,
  `calificacion` FLOAT,
  PRIMARY KEY (`url`),
  CONSTRAINT `fk_autor.autor`
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `collabnotes`.`ESTUDIANTE` (`idEstudiante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla DOCENTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`DOCENTE` (
  `idDocente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idDocente`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Tabla CLASE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`CLASE` (
  `clave` INT NOT NULL AUTO_INCREMENT,
  `idDocente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `urlArchivo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`clave`, `idDocente`),
  CONSTRAINT `fk_docente.docente`
    FOREIGN KEY (`idDocente`)
    REFERENCES `collabnotes`.`DOCENTE` (`idDocente`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla TAG
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`TAG` (
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabla ESTUDIANTE-CLASE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`ESTUDIANTE-CLASE` (
  `idEstudiante` INT NOT NULL,
  `clave` INT NOT NULL,
  PRIMARY KEY (`idEstudiante`, `clave`),
  CONSTRAINT `fk_idEstudiante.idEstudiante`
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `collabnotes`.`ESTUDIANTE` (`idEstudiante`),
  CONSTRAINT `fk_idClaseE.idClaseE`
    FOREIGN KEY (`clave`)
    REFERENCES `collabnotes`.`CLASE` (`clave`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla DOCENTE-CLASE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`DOCENTE-CLASE` (
  `idDocente` INT NOT NULL,
  `clave` INT NOT NULL,
  PRIMARY KEY (`idDocente`, `clave`),
  CONSTRAINT `fk_idDocente.idDocente`
    FOREIGN KEY (`idDocente`)
    REFERENCES `collabnotes`.`DOCENTE` (`idDocente`),
  CONSTRAINT `fk_idClaseD.idClaseD`
    FOREIGN KEY (`clave`)
    REFERENCES `collabnotes`.`CLASE` (`clave`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla ARCHIVO-TAG
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`ARCHIVO-TAG` (
  `urlArchivo` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`urlArchivo`, `nombre`),
  CONSTRAINT `fk_urlArchivo.urlArchivo`
    FOREIGN KEY (`urlArchivo`)
    REFERENCES `collabnotes`.`ARCHIVO` (`url`),
  CONSTRAINT `fk_nombreTagA.nombreTagA`
    FOREIGN KEY (`nombre`)
    REFERENCES `collabnotes`.`TAG` (`nombre`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla CLASE-TAG
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collabnotes`.`CLASE-TAG` (
  `clave` INT NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`clave`, `nombre`),
  CONSTRAINT `fk_idClase.idClase`
    FOREIGN KEY (`clave`)
    REFERENCES `collabnotes`.`CLASE` (`clave`),
  CONSTRAINT `fk_nombreTag.nombreTag`
    FOREIGN KEY (`nombre`)
    REFERENCES `collabnotes`.`TAG` (`nombre`))
ENGINE = InnoDB;
