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
  `N_Turma` INT NOT NULL,
  `N_Alunos` INT NOT NULL,
  `Diretor_de_Turma` VARCHAR(45) NOT NULL,
  `Escola_idEscola` INT NOT NULL,
  PRIMARY KEY (`N_Turma`, `Escola_idEscola`),
  INDEX `fk_Turma_Escola1_idx` (`Escola_idEscola` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_Escola1`
    FOREIGN KEY (`Escola_idEscola`)
    REFERENCES `Escola`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`Aluno` (
  `nr_de_aluno` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `media` DECIMAL(3,1) NULL,
  `email` VARCHAR(45) NULL,
  `Escola_idEscola` INT NOT NULL,
  `Turma_N_Turma` INT NOT NULL,
  PRIMARY KEY (`nr_de_aluno`, `Escola_idEscola`, `Turma_N_Turma`),
  INDEX `fk_Aluno_Escola_idx` (`Escola_idEscola` ASC) VISIBLE,
  INDEX `fk_Aluno_Turma1_idx` (`Turma_N_Turma` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_Escola`
    FOREIGN KEY (`Escola_idEscola`)
    REFERENCES `Escola`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_Turma1`
    FOREIGN KEY (`Turma_N_Turma`)
    REFERENCES `Escola`.`Turma` (`N_Turma`)
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
  `ensina_Turma_N_de_turma` INT NOT NULL,
  `Escola_idEscola` INT NOT NULL,
  PRIMARY KEY (`idDocente`, `ensina_Turma_N_de_turma`, `Escola_idEscola`),
  INDEX `fk_Docente_Escola1_idx` (`Escola_idEscola` ASC) VISIBLE,
  CONSTRAINT `fk_Docente_Escola1`
    FOREIGN KEY (`Escola_idEscola`)
    REFERENCES `Escola`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola`.`ensina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola`.`ensina` (
  `Turma_N_Turma` INT NOT NULL,
  `Turma_Escola_idEscola` INT NOT NULL,
  `Docente_idDocente` INT NOT NULL,
  `Docente_ensina_Turma_N_de_turma` INT NOT NULL,
  `Docente_Escola_idEscola` INT NOT NULL,
  PRIMARY KEY (`Turma_N_Turma`, `Turma_Escola_idEscola`, `Docente_idDocente`, `Docente_ensina_Turma_N_de_turma`, `Docente_Escola_idEscola`),
  INDEX `fk_Turma_has_Docente_Docente1_idx` (`Docente_idDocente` ASC, `Docente_ensina_Turma_N_de_turma` ASC, `Docente_Escola_idEscola` ASC) VISIBLE,
  INDEX `fk_Turma_has_Docente_Turma1_idx` (`Turma_N_Turma` ASC, `Turma_Escola_idEscola` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_has_Docente_Turma1`
    FOREIGN KEY (`Turma_N_Turma` , `Turma_Escola_idEscola`)
    REFERENCES `Escola`.`Turma` (`N_Turma` , `Escola_idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_has_Docente_Docente1`
    FOREIGN KEY (`Docente_idDocente` , `Docente_ensina_Turma_N_de_turma` , `Docente_Escola_idEscola`)
    REFERENCES `Escola`.`Docente` (`idDocente` , `ensina_Turma_N_de_turma` , `Escola_idEscola`)
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
