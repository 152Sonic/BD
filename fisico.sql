-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Escola
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Escola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Escola` DEFAULT CHARACTER SET utf8 ;
USE `Escola` ;

-- -----------------------------------------------------
-- Table `Escola`.`Escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`Escola` (
  `idEscola` INT NOT NULL,
  `Rua` VARCHAR(45) NULL,
  `Codigo_Postal` INT NULL,
  `telemovel` INT NULL,
  PRIMARY KEY (`idEscola`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`Turma` (
  `idTurma` INT NOT NULL,
  `N_Alunos` INT NOT NULL,
  `Diretor_de_Turma` VARCHAR(45) NOT NULL,
  `Escola` INT NULL,
  PRIMARY KEY (`idTurma`),
  INDEX `Escola_idx` (`Escola` ASC) VISIBLE,
  CONSTRAINT `Escola`
    FOREIGN KEY (`Escola`)
    REFERENCES `Escola`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`Aluno` (
  `idAluno` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `Turma` INT NULL,
  `Escola` INT NULL,
  PRIMARY KEY (`idAluno`),
  INDEX `Escola_idx` (`Escola` ASC) VISIBLE,
  INDEX `Turma_idx` (`Turma` ASC) VISIBLE,
  CONSTRAINT `Turma`
    FOREIGN KEY (`Turma`)
    REFERENCES `Escola`.`Turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Escola`
    FOREIGN KEY (`Escola`)
    REFERENCES `Escola`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola`.`Docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`Docente` (
  `idDocente` INT NOT NULL,
  `nr_de_Contribuinte` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Escola` INT NULL,
  PRIMARY KEY (`idDocente`),
  INDEX `Escola_idx` (`Escola` ASC) VISIBLE,
  CONSTRAINT `Escola`
    FOREIGN KEY (`Escola`)
    REFERENCES `Escola`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola`.`Ensina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`Ensina` (
  `Turma` INT NOT NULL,
  `Docente` INT NOT NULL,
  INDEX `Docente_idx` (`Docente` ASC) VISIBLE,
  INDEX `Turma_idx` (`Turma` ASC) VISIBLE,
  CONSTRAINT `Turma`
    FOREIGN KEY (`Turma`)
    REFERENCES `Escola`.`Turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Docente`
    FOREIGN KEY (`Docente`)
    REFERENCES `Escola`.`Docente` (`idDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`Disciplina` (
  `idDisciplina` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola`.`Aprende`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`Aprende` (
  `Disciplina` INT NOT NULL,
  `Aluno` INT NOT NULL,
  `Nota` DECIMAL(3,1) NOT NULL,
  INDEX `Disciplina_idx` (`Disciplina` ASC) VISIBLE,
  INDEX `Aluno_idx` (`Aluno` ASC) VISIBLE,
  CONSTRAINT `Aluno`
    FOREIGN KEY (`Aluno`)
    REFERENCES `Escola`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Disciplina`
    FOREIGN KEY (`Disciplina`)
    REFERENCES `Escola`.`Disciplina` (`idDisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Escola` ;

-- -----------------------------------------------------
-- Placeholder table for view `Escola`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `Escola`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Escola`.`view1`;
USE `Escola`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
