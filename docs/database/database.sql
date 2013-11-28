SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `gymcontrol` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `gymcontrol` ;

-- -----------------------------------------------------
-- Table `gymcontrol`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gymcontrol`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` CHAR(11) NOT NULL,
  `name` VARCHAR(80) NOT NULL,
  `gender` ENUM('male','female') NOT NULL,
  `birthday` DATE NULL,
  `phone` VARCHAR(11) NULL,
  `cellphone` VARCHAR(11) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `street` VARCHAR(70) NULL,
  `house-number` INT(6) NULL,
  `neightbohood` VARCHAR(45) NULL,
  `cep` CHAR(8) NULL,
  `city` VARCHAR(45) NOT NULL,
  `monthly-payment` DECIMAL(5,2) NOT NULL,
  `maturity` INT(2) NOT NULL,
  `notes` TEXT NULL,
  `register` TIMESTAMP NULL,
  `customercol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gymcontrol`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gymcontrol`.`payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer` INT(9) NULL,
  `value` DECIMAL(5,2) NULL,
  `description` VARCHAR(50) NULL,
  `open` ENUM('yes','no') NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_customer_idx` (`customer` ASC),
  CONSTRAINT `fk_payment_customer`
    FOREIGN KEY (`customer`)
    REFERENCES `gymcontrol`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gymcontrol`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gymcontrol`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  `phone` VARCHAR(11) NULL,
  `cellphone` VARCHAR(11) NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NULL,
  `street` VARCHAR(70) NULL,
  `house-number` INT(6) NULL,
  `neightborhood` VARCHAR(45) NULL,
  `cep` CHAR(8) NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gymcontrol`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gymcontrol`.`user` (
  `employees` INT NOT NULL,
  `password` BINARY(20) NULL,
  PRIMARY KEY (`employees`),
  INDEX `fk_user_employees1_idx` (`employees` ASC),
  CONSTRAINT `fk_user_employees1`
    FOREIGN KEY (`employees`)
    REFERENCES `gymcontrol`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
