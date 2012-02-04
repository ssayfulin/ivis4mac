SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `poiskdetei` DEFAULT CHARACTER SET latin1 ;
USE `poiskdetei` ;

-- -----------------------------------------------------
-- Table `poiskdetei`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`country` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`country` (
  `id_country` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Russia, Belorussia, Ukraine, etc' ,
  PRIMARY KEY (`id_country`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`federal_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`federal_subject` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`federal_subject` (
  `id_federal_subject` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_federal_subject`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`district` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`district` (
  `id_district` INT NOT NULL AUTO_INCREMENT COMMENT 'http://ru.wikipedia.org/wiki/%D0%A4%D0%B5%D0%B4%D0%B5%D1%80%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5_%D0%BE%D0%BA%D1%80%D1%83%D0%B3%D0%B0_%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B9%D1%81%D0%BA%D0%BE%D0%B9_%D0%A4%D0%B5%D0%B4%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8' ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_district`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`city` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`city` (
  `id_city` INT NOT NULL AUTO_INCREMENT ,
  `desription` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_city`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`address_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`address_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`address_type` (
  `id_address_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Rogdenie, robata, work, nahgdenia, vstre4i,  \npoteralsa, naselsa, seksia, krugok, sportsal , basseyn, internat' ,
  PRIMARY KEY (`id_address_type`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`address` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`address` (
  `id_address` INT NOT NULL AUTO_INCREMENT ,
  `id_country` INT NOT NULL ,
  `id_federal_subject` INT NOT NULL ,
  `id_district` INT NOT NULL ,
  `id_city` INT NOT NULL ,
  `id_address_type` INT NOT NULL ,
  `street_home` TINYTEXT NULL DEFAULT NULL COMMENT 'adress:  raion,street,n° buiding ets' ,
  `latitude` DOUBLE NULL DEFAULT NULL ,
  `longitude` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`id_address`) ,
  INDEX `index_country` (`id_country` ASC) ,
  INDEX `index_federal_subject` (`id_federal_subject` ASC) ,
  INDEX `index_district` (`id_district` ASC) ,
  INDEX `index_city` (`id_city` ASC) ,
  INDEX `index_address_type` (`id_address_type` ASC) ,
  CONSTRAINT `fk_{25B4A4D3-8310-4DFC-B249-604ED406AAB8}`
    FOREIGN KEY (`id_country` )
    REFERENCES `poiskdetei`.`country` (`id_country` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{F5C6CB80-259C-4E59-9AFE-2B6C59B3F7C6}`
    FOREIGN KEY (`id_federal_subject` )
    REFERENCES `poiskdetei`.`federal_subject` (`id_federal_subject` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{736CC19D-22E4-4089-AD98-18DA35C4B5B9}`
    FOREIGN KEY (`id_district` )
    REFERENCES `poiskdetei`.`district` (`id_district` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{9346A6EA-40BA-4829-AA92-63AE6455DBCF}`
    FOREIGN KEY (`id_city` )
    REFERENCES `poiskdetei`.`city` (`id_city` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{49636752-CD80-4C21-A356-964A0548A121}`
    FOREIGN KEY (`id_address_type` )
    REFERENCES `poiskdetei`.`address_type` (`id_address_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`person` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`person` (
  `id_person` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NULL DEFAULT NULL ,
  `last_name` VARCHAR(45) NULL DEFAULT NULL ,
  `third_name` VARCHAR(45) NULL DEFAULT NULL ,
  `birth_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`id_person`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`competance_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`competance_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`competance_type` (
  `id_competance_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_competance_type`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`competance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`competance` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`competance` (
  `id_competance` INT NOT NULL AUTO_INCREMENT ,
  `id_person` INT NOT NULL ,
  `id_competace_type` INT NOT NULL ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_competance`) ,
  INDEX `index_person` (`id_person` ASC) ,
  INDEX `index_competance_type` (`id_competace_type` ASC) ,
  CONSTRAINT `fk_{85758C49-EE2D-4F1F-8CEF-83C44E5B25F9}`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{4D4038E7-4D2E-46DC-8D56-88B2CB488774}`
    FOREIGN KEY (`id_competace_type` )
    REFERENCES `poiskdetei`.`competance_type` (`id_competance_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`transport_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`transport_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`transport_type` (
  `id_transport_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_transport_type`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`transport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`transport` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`transport` (
  `id_transport` INT NOT NULL ,
  `id_person` INT NOT NULL ,
  `id_transport_type` INT NOT NULL ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_transport`) ,
  INDEX `index_person` (`id_person` ASC) ,
  INDEX `index_transport_type` (`id_transport_type` ASC) ,
  CONSTRAINT `fk_{B4FAAF41-6628-4A03-BE8C-67D439DEA8CC}`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{E12E0C9E-1D18-465C-9723-4B2B17DEFA0C}`
    FOREIGN KEY (`id_transport_type` )
    REFERENCES `poiskdetei`.`transport_type` (`id_transport_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`status_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`status_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`status_type` (
  `id_status` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Manager seach, Partisipant seach, Lost, Operator, Coordinator seach, ' ,
  PRIMARY KEY (`id_status`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`status` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`status` (
  `id_person_status` INT NOT NULL AUTO_INCREMENT ,
  `id_person` INT NOT NULL ,
  `id_status` INT NOT NULL ,
  PRIMARY KEY (`id_person_status`) ,
  INDEX `index_person` (`id_person` ASC) ,
  INDEX `index_status` (`id_status` ASC) ,
  CONSTRAINT `fk_{BBFF8B4C-A19F-4AF6-B6B2-C58EE792EFBB}`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{FDD06712-E7AC-4AD6-8865-9545EEEC907B}`
    FOREIGN KEY (`id_status` )
    REFERENCES `poiskdetei`.`status_type` (`id_status` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`equpement_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`equpement_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`equpement_type` (
  `id_equpement_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_equpement_type`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`equpement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`equpement` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`equpement` (
  `id_equpement` INT NOT NULL AUTO_INCREMENT ,
  `id_equpement_type` INT NOT NULL ,
  `id_person` INT NOT NULL ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_equpement`) ,
  INDEX `index_person` (`id_person` ASC) ,
  INDEX `index_equpement_type` (`id_equpement_type` ASC) ,
  CONSTRAINT `fk_{4264C89F-8384-4F5A-A74F-2200E6184165}`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{599AD839-AB2A-470E-A039-10F6E4D3C918}`
    FOREIGN KEY (`id_equpement_type` )
    REFERENCES `poiskdetei`.`equpement_type` (`id_equpement_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`contact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`contact_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`contact_type` (
  `id_contact_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'mobile home, mobil work, mobil private  work phote, home phone, private phone, \nmail home, mail work, mail private,\nISC, skype, FaceBook, VKontacte, Twitter, etc. ' ,
  PRIMARY KEY (`id_contact_type`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`contact` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`contact` (
  `id_contact` INT NOT NULL AUTO_INCREMENT ,
  `id_contact_type` INT NOT NULL ,
  `id_person` INT NOT NULL ,
  `description` VARCHAR(45) NOT NULL COMMENT 'can be here number, char, etc' ,
  PRIMARY KEY (`id_contact`) ,
  INDEX `index_contact_type` (`id_contact_type` ASC) ,
  INDEX `index_person` (`id_person` ASC) ,
  CONSTRAINT `fk_{25ACED69-34D2-4B8F-B8C4-728F773EA1CE}`
    FOREIGN KEY (`id_contact_type` )
    REFERENCES `poiskdetei`.`contact_type` (`id_contact_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{B1CD095A-881E-42D6-B842-442EF4FC6E0D}`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`sign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`sign` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`sign` (
  `id_sign` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'rost, ves , glaza, teloslogenie, usi' ,
  PRIMARY KEY (`id_sign`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`sign_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`sign_detail` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`sign_detail` (
  `id_sign_detail` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT '(rost)высокий, (telo)крепкого телосложения,( волосы) и (усы) седые' ,
  PRIMARY KEY (`id_sign_detail`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`person_to_sign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`person_to_sign` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`person_to_sign` (
  `id_person_sign` INT NOT NULL AUTO_INCREMENT ,
  `id_person` INT NOT NULL ,
  `id_sign` INT NOT NULL ,
  `id_sign_detail` INT NOT NULL ,
  PRIMARY KEY (`id_person_sign`) ,
  INDEX `index_person` (`id_person` ASC) ,
  INDEX `index_sign` (`id_sign` ASC) ,
  INDEX `index_sign_detail` (`id_sign_detail` ASC) ,
  CONSTRAINT `fk_{CFC9CEB0-BE51-40CF-90B0-45280B7CE36D}`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{84B7578D-B6F0-44CF-AF67-931D8F3FBBF6}`
    FOREIGN KEY (`id_sign` )
    REFERENCES `poiskdetei`.`sign` (`id_sign` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_{C3AD4832-B1BF-44F2-93CF-77DAAB3423C5}`
    FOREIGN KEY (`id_sign_detail` )
    REFERENCES `poiskdetei`.`sign_detail` (`id_sign_detail` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
