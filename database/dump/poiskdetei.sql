SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `poiskdetei` ;
CREATE SCHEMA IF NOT EXISTS `poiskdetei` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
SHOW WARNINGS;
USE `poiskdetei` ;

-- -----------------------------------------------------
-- Table `poiskdetei`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`person` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`person` (
  `id_person` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NULL DEFAULT NULL ,
  `last_name` VARCHAR(45) NULL DEFAULT NULL ,
  `third_name` VARCHAR(45) NULL DEFAULT NULL ,
  `birth_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`id_person`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poiskdetei`.`person_to_relatives`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`person_to_relatives` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`person_to_relatives` (
  `id_person_to_relative` INT NOT NULL ,
  `id_person` INT NOT NULL ,
  `id_relative` INT NOT NULL ,
  PRIMARY KEY (`id_person_to_relative`) ,
  INDEX `fk_person_to_relatives_person` (`id_person` ASC) ,
  INDEX `fk_person_to_relatives_person1` (`id_relative` ASC) ,
  CONSTRAINT `fk_person_to_relatives_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_to_relatives_person1`
    FOREIGN KEY (`id_relative` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`country` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`country` (
  `id_country` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Russia, Belorussia, Ukraine, etc' ,
  PRIMARY KEY (`id_country`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`federal_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`federal_subject` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`federal_subject` (
  `id_federal_subject` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_federal_subject`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`district` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`district` (
  `id_district` INT NOT NULL AUTO_INCREMENT COMMENT 'http://ru.wikipedia.org/wiki/%D0%A4%D0%B5%D0%B4%D0%B5%D1%80%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5_%D0%BE%D0%BA%D1%80%D1%83%D0%B3%D0%B0_%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B9%D1%81%D0%BA%D0%BE%D0%B9_%D0%A4%D0%B5%D0%B4%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8' ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_district`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`city` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`city` (
  `id_city` INT NOT NULL AUTO_INCREMENT ,
  `desription` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_city`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`address_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`address_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`address_type` (
  `id_address_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Rogdenie, robata, work, nahgdenia, vstre4i,  \npoteralsa, naselsa, seksia, krugok, sportsal , basseyn, internat' ,
  PRIMARY KEY (`id_address_type`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`address` ;

SHOW WARNINGS;
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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`person_to_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`person_to_address` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`person_to_address` (
  `id_person_address` INT NOT NULL AUTO_INCREMENT ,
  `id_person` INT NOT NULL ,
  `id_address` INT NOT NULL ,
  PRIMARY KEY (`id_person_address`) ,
  INDEX `fk_id_person` (`id_person` ASC) ,
  INDEX `fk_id_address` (`id_address` ASC) ,
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_address`
    FOREIGN KEY (`id_address` )
    REFERENCES `poiskdetei`.`address` (`id_address` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`competance_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`competance_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`competance_type` (
  `id_competance_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_competance_type`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`competance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`competance` ;

SHOW WARNINGS;
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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`transport_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`transport_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`transport_type` (
  `id_transport_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_transport_type`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`transport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`transport` ;

SHOW WARNINGS;
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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`status_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`status_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`status_type` (
  `id_status` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Manager seach, Partisipant seach, Lost, Operator, Coordinator seach, ' ,
  PRIMARY KEY (`id_status`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`status` ;

SHOW WARNINGS;
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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`equpement_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`equpement_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`equpement_type` (
  `id_equpement_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_equpement_type`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`equpement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`equpement` ;

SHOW WARNINGS;
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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`contact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`contact_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`contact_type` (
  `id_contact_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'mobile home, mobil work, mobil private  work phote, home phone, private phone, \nmail home, mail work, mail private,\nISC, skype, FaceBook, VKontacte, Twitter, etc. ' ,
  PRIMARY KEY (`id_contact_type`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`contact` ;

SHOW WARNINGS;
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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`sign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`sign` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`sign` (
  `id_sign` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT 'rost, ves , glaza, teloslogenie, usi' ,
  PRIMARY KEY (`id_sign`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`sign_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`sign_detail` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`sign_detail` (
  `id_sign_detail` INT NOT NULL AUTO_INCREMENT ,
  `id_sign` INT NOT NULL ,
  `description` TEXT NULL DEFAULT NULL COMMENT '(rost)высокий, (telo)крепкого телосложения,( волосы) и (усы) седые' ,
  PRIMARY KEY (`id_sign_detail`),
  FOREIGN KEY (`id_sign` )
    REFERENCES `poiskdetei`.`sign` (`id_sign` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`person_to_sign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`person_to_sign` ;

SHOW WARNINGS;
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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`organization_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`organization_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`organization_type` (
  `id_organization_type` INT NOT NULL ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_organization_type`) )
ENGINE = InnoDB;

SHOW WARNINGS;


-- -----------------------------------------------------
-- Table `poiskdetei`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`organization` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`organization` (
  `id_organization` INT NOT NULL ,
  `id_organization_type` INT NOT NULL ,
  `id_address` INT NOT NULL ,
  `name` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_organization`) ,
  INDEX `fk_organization_organization_type1` (`id_organization_type` ASC) ,
  INDEX `fk_organization_address1` (`id_address` ASC) ,
  CONSTRAINT `fk_organization_organization_type1`
    FOREIGN KEY (`id_organization_type` )
    REFERENCES `poiskdetei`.`organization_type` (`id_organization_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_address1`
    FOREIGN KEY (`id_address` )
    REFERENCES `poiskdetei`.`address` (`id_address` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`police_statement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`police_statement` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`police_statement` (
  `id_police_statement` INT NOT NULL ,
  `id_police_department` INT NOT NULL ,
  `id_investigating_officer` INT NOT NULL ,
  `id_police_statement_state` INT NOT NULL ,
  `registered_at` DATETIME NULL DEFAULT NULL ,
  `history` VARCHAR(45) NULL DEFAULT NULL ,
  `police_statement_number` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_police_statement`) ,
  INDEX `fk_police_statement_organization1` (`id_police_department` ASC) ,
  INDEX `fk_police_statement_person1` (`id_investigating_officer` ASC) ,
  INDEX `fk_police_statement_police_statement_state1` (`id_police_statement_state` ASC) ,
  CONSTRAINT `fk_police_statement_organization1`
    FOREIGN KEY (`id_police_department` )
    REFERENCES `poiskdetei`.`organization` (`id_organization` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_police_statement_person1`
    FOREIGN KEY (`id_investigating_officer` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_police_statement_police_statement_state1`
    FOREIGN KEY (`id_police_statement_state` )
    REFERENCES `poiskdetei`.`police_statement_state` (`id_police_statement_state` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;



-- -----------------------------------------------------
-- Table `poiskdetei`.`organization_to_contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`organization_to_contact` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`organization_to_contact` (
  `id_organization_to_contact` INT NOT NULL ,
  `id_organization` INT NOT NULL ,
  `id_contact` INT NOT NULL ,
  PRIMARY KEY (`id_organization_to_contact`) ,
  INDEX `fk_organization_to_contact_organization1` (`id_organization` ASC) ,
  INDEX `fk_organization_to_contact_contact1` (`id_contact` ASC) ,
  CONSTRAINT `fk_organization_to_contact_organization1`
    FOREIGN KEY (`id_organization` )
    REFERENCES `poiskdetei`.`organization` (`id_organization` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_to_contact_contact1`
    FOREIGN KEY (`id_contact` )
    REFERENCES `poiskdetei`.`contact` (`id_contact` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;



-- -----------------------------------------------------
-- Table `poiskdetei`.`police_statement_to_person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`police_statement_to_person` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`police_statement_to_person` (
  `id_police_statement_to_person` INT NOT NULL ,
  `id_police_statement` INT NOT NULL ,
  `id_person` INT NOT NULL ,
  `comment` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_police_statement_to_person`) ,
  INDEX `fk_police_statement_to_person_person` (`id_person` ASC) ,
  INDEX `fk_police_statement_to_person_police_statement1` (`id_police_statement` ASC) ,
  CONSTRAINT `fk_police_statement_to_person_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_police_statement_to_person_police_statement1`
    FOREIGN KEY (`id_police_statement` )
    REFERENCES `poiskdetei`.`police_statement` (`id_police_statement` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`web_link`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`web_link` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`web_link` (
  `id_web_link` INT NOT NULL ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  `value` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_web_link`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`map_link`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`map_link` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`map_link` (
  `id_map_link` INT NOT NULL ,
  `name` VARCHAR(45) NULL DEFAULT NULL ,
  `longitude` FLOAT NULL DEFAULT NULL ,
  `latitude` FLOAT NULL DEFAULT NULL ,
  PRIMARY KEY (`id_map_link`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`incident_state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`incident_state` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`incident_state` (
  `id_incident_state` INT NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_incident_state`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`incident`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`incident` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`incident` (
  `id_incident` INT NOT NULL AUTO_INCREMENT ,
  `id_incident_state` INT NOT NULL ,
  `id_person_missing` INT NOT NULL ,
  `id_person_coordinator` INT NOT NULL ,
  `id_person_registrator` INT NOT NULL ,
  `id_map_link` INT NOT NULL ,
  `id_organization_coordinator` INT NOT NULL ,
  `id_police_statement` INT NOT NULL ,
  `date` DATETIME NOT NULL ,
  `incident_registration_date` DATETIME NULL DEFAULT NULL ,
  `incident_description` VARCHAR(45) NULL DEFAULT NULL ,
  `incident_extra_information` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_incident`) ,
  UNIQUE INDEX `id_idincindent_UNIQUE` (`id_incident` ASC) ,
  INDEX `fk_incindent_map_link` (`id_map_link` ASC) ,
  INDEX `fk_incindent_incident_state` (`id_incident_state` ASC) ,
  INDEX `fk_incindent_person1` (`id_person_coordinator` ASC) ,
  INDEX `fk_incindent_person2` (`id_person_missing` ASC) ,
  INDEX `fk_incindent_person3` (`id_person_registrator` ASC) ,
  INDEX `fk_incindent_organization1` (`id_organization_coordinator` ASC) ,
  INDEX `fk_incident_police_statement1` (`id_police_statement` ASC) ,
  CONSTRAINT `fk_incindent_map_link`
    FOREIGN KEY (`id_map_link` )
    REFERENCES `poiskdetei`.`map_link` (`id_map_link` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incindent_incident_state`
    FOREIGN KEY (`id_incident_state` )
    REFERENCES `poiskdetei`.`incident_state` (`id_incident_state` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incindent_person1`
    FOREIGN KEY (`id_person_coordinator` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incindent_person2`
    FOREIGN KEY (`id_person_missing` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incindent_person3`
    FOREIGN KEY (`id_person_registrator` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incindent_organization1`
    FOREIGN KEY (`id_organization_coordinator` )
    REFERENCES `poiskdetei`.`organization` (`id_organization` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incident_police_statement1`
    FOREIGN KEY (`id_police_statement` )
    REFERENCES `poiskdetei`.`police_statement` (`id_police_statement` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`incident_to_web_link`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`incident_to_web_link` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`incident_to_web_link` (
  `id_incident_to_web_link` INT NOT NULL ,
  `incident_id_incident` INT NOT NULL ,
  `web_link_id_web_link` INT NOT NULL ,
  PRIMARY KEY (`id_incident_to_web_link`) ,
  INDEX `fk_incident_to_web_link_incident1` (`incident_id_incident` ASC) ,
  INDEX `fk_incident_to_web_link_web_link1` (`web_link_id_web_link` ASC) ,
  CONSTRAINT `fk_incident_to_web_link_incident1`
    FOREIGN KEY (`incident_id_incident` )
    REFERENCES `poiskdetei`.`incident` (`id_incident` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incident_to_web_link_web_link1`
    FOREIGN KEY (`web_link_id_web_link` )
    REFERENCES `poiskdetei`.`web_link` (`id_web_link` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;




-- -----------------------------------------------------
-- Table `poiskdetei`.`police_statement_state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`police_statement_state` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`police_statement_state` (
  `id_police_statement_state` INT NOT NULL ,
  `value` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_police_statement_state`) )
ENGINE = InnoDB;

SHOW WARNINGS;



-- -----------------------------------------------------
-- Table `poiskdetei`.`file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`file` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`file` (
  `id_file` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  `data` BLOB NOT NULL ,
  PRIMARY KEY (`id_file`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `poiskdetei`.`incident_to_file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`incident_to_file` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `poiskdetei`.`incident_to_file` (
  `id_incident_to_file` INT NOT NULL ,
  `id_incindent` INT NOT NULL ,
  `id_file_link` INT NOT NULL ,
  PRIMARY KEY (`id_incident_to_file`) ,
  INDEX `fk_incident_to_file_incindent1` (`id_incindent` ASC) ,
  INDEX `fk_incident_to_file_link_file_link1` (`id_file_link` ASC) ,
  CONSTRAINT `fk_incident_to_file_incindent1`
    FOREIGN KEY (`id_incindent` )
    REFERENCES `poiskdetei`.`incident` (`id_incident` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incident_to_file_link_file_link1`
    FOREIGN KEY (`id_file_link` )
    REFERENCES `poiskdetei`.`file` (`id_file` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

INSERT INTO `sign_detail` VALUES(1, 1, 'на вид 7 лет');
INSERT INTO `sign_detail` VALUES(2, 1, 'на вид 11-12 лет');
INSERT INTO `sign_detail` VALUES(3, 1, 'на вид 4 года');

INSERT INTO `sign_detail` VALUES(4, 2, '90-95 cm');
INSERT INTO `sign_detail` VALUES(5, 2, '148 cm');
INSERT INTO `sign_detail` VALUES(6, 2, '140 cm');
INSERT INTO `sign_detail` VALUES(7, 2, '117-120 cm');
INSERT INTO `sign_detail` VALUES(8, 2, '160 cm');
INSERT INTO `sign_detail` VALUES(9, 2, '125 cm');

INSERT INTO `sign_detail` VALUES(10, 4, 'среднего');
INSERT INTO `sign_detail` VALUES(11, 4, 'худощавого');

INSERT INTO `sign_detail` VALUES(12, 11, 'овальное');
INSERT INTO `sign_detail` VALUES(13, 10, 'в веснушках');

INSERT INTO `sign_detail` VALUES(14, 14, 'короткие');
INSERT INTO `sign_detail` VALUES(15, 12, 'светло-русые');
INSERT INTO `sign_detail` VALUES(16, 12, 'русые');
INSERT INTO `sign_detail` VALUES(17, 14, 'длинные');
INSERT INTO `sign_detail` VALUES(18, 12, 'светлые');
INSERT INTO `sign_detail` VALUES(19, 14, 'ниже плеч');

INSERT INTO `sign_detail` VALUES(20, 13, 'волнистые');
INSERT INTO `sign_detail` VALUES(21, 13, 'прямые');

INSERT INTO `sign_detail` VALUES(22,  5, 'голубые');
INSERT INTO `sign_detail` VALUES(23,  5, 'серо-зелёные');

INSERT INTO `sign_detail` VALUES(24, 17, 'большие');
INSERT INTO `sign_detail` VALUES(25, 17, 'с проколом');

INSERT INTO `sign_detail` VALUES(26, 9, 'густые');
INSERT INTO `sign_detail` VALUES(27, 8, 'дугообразные');

INSERT INTO `sign_detail` VALUES(28, 19, 'на лбу шрам длинной 2 см');
INSERT INTO `sign_detail` VALUES(29, 19, 'на правой руке на нижней фаланге указательного пальца с внешней стороны ожог от утюга, внизу живота у левой ноги родинка 0,5 см круглой формы, на животе след от оспы в виде выпуклого белого пятна');
INSERT INTO `sign_detail` VALUES(30, 19, 'шрам на лбу');
INSERT INTO `sign_detail` VALUES(31, 19, 'отсутствуют два верхних и два нижних зуба, царапина на правой щеке');









INSERT INTO `sign` VALUES(1, 'возраст');
INSERT INTO `sign` VALUES(2, 'рост');
INSERT INTO `sign` VALUES(3, 'вес');
INSERT INTO `sign` VALUES(4, 'телосложение');
INSERT INTO `sign` VALUES(5, 'цвет глаз');
INSERT INTO `sign` VALUES(6, 'форма глаз');
INSERT INTO `sign` VALUES(7, 'размер глаз');
INSERT INTO `sign` VALUES(8, 'форма бровей');
INSERT INTO `sign` VALUES(9, 'тип бровей');
INSERT INTO `sign` VALUES(10, 'тип лица');
INSERT INTO `sign` VALUES(11, 'форма лица');
INSERT INTO `sign` VALUES(12, 'цвет волос');
INSERT INTO `sign` VALUES(13, 'тип волос');
INSERT INTO `sign` VALUES(14, 'длинна волос');
INSERT INTO `sign` VALUES(15, 'цвет усов');
INSERT INTO `sign` VALUES(16, 'форма усов');
INSERT INTO `sign` VALUES(17, 'ушные раковины');
INSERT INTO `sign` VALUES(18, 'цвет кожи');
INSERT INTO `sign` VALUES(19, 'особые приметы');



INSERT INTO `person` VALUES(1, 'Тишкина', 'Ирина', NULL, NULL);
INSERT INTO `person` VALUES(2, 'Костюнин', 'Павлик', NULL, NULL);
INSERT INTO `person` VALUES(3, 'Четина', 'Катерина', NULL, NULL);
INSERT INTO `person` VALUES(4, 'Анисимова ', 'Катерина', NULL, NULL);
INSERT INTO `person` VALUES(5, 'Беспрозванная', 'Ольга', NULL, NULL);
INSERT INTO `person` VALUES(6, 'Королев ', 'Максим', NULL, NULL);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;