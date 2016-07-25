-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema produtos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema produtos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `produtos` DEFAULT CHARACTER SET utf8 ;
USE `produtos` ;

-- -----------------------------------------------------
-- Table `produtos`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produtos`.`produto` (
  `produtoid` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` TINYTEXT NULL,
  `estoque` INT NOT NULL,
  PRIMARY KEY (`produtoid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `produtos`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produtos`.`usuario` (
  `login` VARCHAR(16) NOT NULL,
  `senha` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`login`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
