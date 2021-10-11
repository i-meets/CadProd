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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`classificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`classificacao` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ncm_cod` INT(10) UNSIGNED NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`atributo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`atributo` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cod_atributo` VARCHAR(55) NOT NULL,
  `classificacao_id` INT(10) UNSIGNED NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ATTRIBUTE_CLASSIFICATION_idx` (`classificacao_id` ASC) ,
  CONSTRAINT `fk_ATTRIBUTE_CLASSIFICATION`
    FOREIGN KEY (`classificacao_id`)
    REFERENCES `mydb`.`classificacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empresas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(155) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `email` VARCHAR(155) NOT NULL,
  `senha` VARCHAR(155) NOT NULL,
  `nivel` VARCHAR(55) NOT NULL,
  `fotoUsuario` VARCHAR(155) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios_empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios_empresas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT(11) NOT NULL,
  `empresas_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_usuarios_has_empresas_empresas1_idx` (`empresas_id` ASC) ,
  INDEX `fk_usuarios_has_empresas_usuarios1_idx` (`usuarios_id` ASC) ,
  CONSTRAINT `fk_usuarios_has_empresas_empresas1`
    FOREIGN KEY (`empresas_id`)
    REFERENCES `mydb`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_empresas_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `mydb`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`due`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`due` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `usuarios_empresas_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_due_usuarios_empresas1_idx` (`usuarios_empresas_id` ASC) ,
  CONSTRAINT `fk_due_usuarios_empresas1`
    FOREIGN KEY (`usuarios_empresas_id`)
    REFERENCES `mydb`.`usuarios_empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`item` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `classificacao_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_item_classification1_idx` (`classificacao_id` ASC) ,
  CONSTRAINT `fk_item_classification1`
    FOREIGN KEY (`classificacao_id`)
    REFERENCES `mydb`.`classificacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`item_due`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`item_due` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `due_id` INT(11) NOT NULL,
  `item_id` INT(11) NOT NULL,
  `quantidade` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_due_has_item_item1_idx` (`item_id` ASC) ,
  INDEX `fk_item_due_due1_idx` (`due_id` ASC) ,
  CONSTRAINT `fk_due_has_item_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `mydb`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_due_due1`
    FOREIGN KEY (`due_id`)
    REFERENCES `mydb`.`due` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
