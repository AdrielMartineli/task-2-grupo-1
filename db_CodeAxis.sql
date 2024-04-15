-- MySQL Script generated by MySQL Workbench
-- Mon Apr 15 16:25:23 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_categorias` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `linguagem` VARCHAR(255) NULL,
  `nivel` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_cursos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(1000) NULL,
  `autor` VARCHAR(255) NOT NULL,
  `link` VARCHAR(255) NULL,
  `valor` DECIMAL(6,2) NULL,
  `tb_users_id` BIGINT NOT NULL,
  `tb_categoria_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_cursos_tb_users_idx` (`tb_users_id` ASC) VISIBLE,
  INDEX `fk_tb_cursos_tb_categoria1_idx` (`tb_categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cursos_tb_users`
    FOREIGN KEY (`tb_users_id`)
    REFERENCES `mydb`.`tb_users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_cursos_tb_categoria1`
    FOREIGN KEY (`tb_categoria_id`)
    REFERENCES `mydb`.`tb_categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
