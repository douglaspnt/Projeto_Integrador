-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_eDelas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_eDelas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_eDelas` DEFAULT CHARACTER SET utf8 ;
USE `db_eDelas` ;

-- -----------------------------------------------------
-- Table `db_eDelas`.`tb_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eDelas`.`tb_categorias` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `icone` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_eDelas`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eDelas`.`tb_usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_eDelas`.`tb_servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eDelas`.`tb_servicos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `agendamento` VARCHAR(255) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  `tb_usuario_id` BIGINT NOT NULL,
  `tb_categorias_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_servicos_tb_usuario1_idx` (`tb_usuario_id` ASC) VISIBLE,
  INDEX `fk_tb_servicos_tb_categorias1_idx` (`tb_categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_servicos_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `db_eDelas`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_servicos_tb_categorias1`
    FOREIGN KEY (`tb_categorias_id`)
    REFERENCES `db_eDelas`.`tb_categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
