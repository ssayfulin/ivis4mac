SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `poiskdetei` ;
CREATE SCHEMA IF NOT EXISTS `poiskdetei` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `poiskdetei` ;

-- -----------------------------------------------------
-- Table `poiskdetei`.`district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`district` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`district` (
  `id_district` INT NOT NULL AUTO_INCREMENT COMMENT 'http://ru.wikipedia.org/wiki/%D0%A4%D0%B5%D0%B4%D0%B5%D1%80%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5_%D0%BE%D0%BA%D1%80%D1%83%D0%B3%D0%B0_%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B9%D1%81%D0%BA%D0%BE%D0%B9_%D0%A4%D0%B5%D0%B4%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8' ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_district`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_district_UNIQUE` ON `poiskdetei`.`district` (`id_district` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`city` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`city` (
  `id_city` INT NOT NULL AUTO_INCREMENT ,
  `desription` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_city`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_city_UNIQUE` ON `poiskdetei`.`city` (`id_city` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`federal_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`federal_subject` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`federal_subject` (
  `id_federal_subject` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_federal_subject`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_federal_subject_UNIQUE` ON `poiskdetei`.`federal_subject` (`id_federal_subject` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`country` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`country` (
  `id_country` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL COMMENT 'Russia, Belorussia, Ukraine, etc' ,
  PRIMARY KEY (`id_country`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_country_UNIQUE` ON `poiskdetei`.`country` (`id_country` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`adresse_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`adresse_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`adresse_type` (
  `id_adresse_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL COMMENT 'Rogdenie, robata, work, nahgdenia, vstre4i,  \npoteralsa, naselsa, seksia, krugok, sportsal , basseyn, internat' ,
  PRIMARY KEY (`id_adresse_type`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_adresse_status_UNIQUE` ON `poiskdetei`.`adresse_type` (`id_adresse_type` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`person` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`person` (
  `id_person` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NULL ,
  `last_name` VARCHAR(45) NULL ,
  `third_name` VARCHAR(45) NULL ,
  `birth_date` DATE NULL ,
  PRIMARY KEY (`id_person`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_person_UNIQUE` ON `poiskdetei`.`person` (`id_person` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`adresse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`adresse` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`adresse` (
  `id_adresse` INT NOT NULL ,
  `id_person` INT NOT NULL ,
  `id_country` INT NOT NULL ,
  `id_district` INT NOT NULL COMMENT '9 краёв\n\nкрай' ,
  `id_federal_subject` INT NOT NULL ,
  `id_city` INT NOT NULL ,
  `id_adresse_type` INT NOT NULL ,
  `street_home` TINYTEXT NULL COMMENT 'adress:  raion,street,n° buiding ets' ,
  `latitude` DOUBLE NULL ,
  `longitude` DOUBLE NULL ,
  PRIMARY KEY (`id_adresse`) ,
  CONSTRAINT `fk_id_district`
    FOREIGN KEY (`id_district` )
    REFERENCES `poiskdetei`.`district` (`id_district` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_city`
    FOREIGN KEY (`id_city` )
    REFERENCES `poiskdetei`.`city` (`id_city` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_federal_subject`
    FOREIGN KEY (`id_federal_subject` )
    REFERENCES `poiskdetei`.`federal_subject` (`id_federal_subject` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_country`
    FOREIGN KEY (`id_country` )
    REFERENCES `poiskdetei`.`country` (`id_country` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adresse_type`
    FOREIGN KEY (`id_adresse_type` )
    REFERENCES `poiskdetei`.`adresse_type` (`id_adresse_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_id_district` ON `poiskdetei`.`adresse` (`id_district` ASC) ;

CREATE INDEX `fk_id_city` ON `poiskdetei`.`adresse` (`id_city` ASC) ;

CREATE UNIQUE INDEX `pk_id_adresse_UNIQUE` ON `poiskdetei`.`adresse` (`id_adresse` ASC) ;

CREATE INDEX `fk_id_federal_subject` ON `poiskdetei`.`adresse` (`id_federal_subject` ASC) ;

CREATE INDEX `fk_id_country` ON `poiskdetei`.`adresse` (`id_country` ASC) ;

CREATE INDEX `fk_adresse_type` ON `poiskdetei`.`adresse` (`id_adresse_type` ASC) ;

CREATE INDEX `fk_id_person` ON `poiskdetei`.`adresse` (`id_person` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`competance_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`competance_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`competance_type` (
  `id_competance_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_competance_type`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_competance_UNIQUE` ON `poiskdetei`.`competance_type` (`id_competance_type` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`competance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`competance` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`competance` (
  `id_competance` INT NOT NULL AUTO_INCREMENT ,
  `id_person` INT NOT NULL ,
  `id_competace_type` INT NOT NULL ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_competance`) ,
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_competance_type`
    FOREIGN KEY (`id_competace_type` )
    REFERENCES `poiskdetei`.`competance_type` (`id_competance_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_competance_UNIQUE` ON `poiskdetei`.`competance` (`id_competance` ASC) ;

CREATE INDEX `fk_id_person` ON `poiskdetei`.`competance` (`id_person` ASC) ;

CREATE INDEX `fk_id_competance_type` ON `poiskdetei`.`competance` (`id_competace_type` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`transport_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`transport_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`transport_type` (
  `id_transport_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_transport_type`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_transport_UNIQUE` ON `poiskdetei`.`transport_type` (`id_transport_type` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`status_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`status_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`status_type` (
  `id_status` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL COMMENT 'Manager seach, Partisipant seach, Lost, Operator, Coordinator seach, ' ,
  PRIMARY KEY (`id_status`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_status_UNIQUE` ON `poiskdetei`.`status_type` (`id_status` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`status` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`status` (
  `id_person_status` INT NOT NULL AUTO_INCREMENT ,
  `id_person` INT NOT NULL ,
  `id_status` INT NOT NULL ,
  PRIMARY KEY (`id_person_status`) ,
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_status`
    FOREIGN KEY (`id_status` )
    REFERENCES `poiskdetei`.`status_type` (`id_status` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_id_person` ON `poiskdetei`.`status` (`id_person` ASC) ;

CREATE INDEX `fk_id_status` ON `poiskdetei`.`status` (`id_status` ASC) ;

CREATE UNIQUE INDEX `id_person_status_UNIQUE` ON `poiskdetei`.`status` (`id_person_status` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`equpement_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`equpement_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`equpement_type` (
  `id_equpement_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_equpement_type`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_equpement_type_UNIQUE` ON `poiskdetei`.`equpement_type` (`id_equpement_type` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`equpement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`equpement` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`equpement` (
  `id_equpement` INT NOT NULL AUTO_INCREMENT ,
  `id_equpement_type` INT NOT NULL ,
  `id_person` INT NOT NULL ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_equpement`) ,
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_equpement_type`
    FOREIGN KEY (`id_equpement_type` )
    REFERENCES `poiskdetei`.`equpement_type` (`id_equpement_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_equpement_UNIQUE` ON `poiskdetei`.`equpement` (`id_equpement` ASC) ;

CREATE INDEX `fk_id_person` ON `poiskdetei`.`equpement` (`id_person` ASC) ;

CREATE INDEX `fk_id_equpement_type` ON `poiskdetei`.`equpement` (`id_equpement_type` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`transport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`transport` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`transport` (
  `id_transport` INT NOT NULL ,
  `id_person` INT NOT NULL ,
  `id_transport_type` INT NOT NULL ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_transport`) ,
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_transport_type`
    FOREIGN KEY (`id_transport_type` )
    REFERENCES `poiskdetei`.`transport_type` (`id_transport_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_id_person` ON `poiskdetei`.`transport` (`id_person` ASC) ;

CREATE INDEX `fk_id_transport_type` ON `poiskdetei`.`transport` (`id_transport_type` ASC) ;

CREATE UNIQUE INDEX `id_transport_UNIQUE` ON `poiskdetei`.`transport` (`id_transport` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`contact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`contact_type` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`contact_type` (
  `id_contact_type` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL COMMENT 'mobile home, mobil work, mobil private  work phote, home phone, private phone, \nmail home, mail work, mail private,\nISC, skype, FaceBook, VKontacte, Twitter, etc. ' ,
  PRIMARY KEY (`id_contact_type`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idtype_connection_UNIQUE` ON `poiskdetei`.`contact_type` (`id_contact_type` ASC) ;


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
  CONSTRAINT `fk_id_contact_type`
    FOREIGN KEY (`id_contact_type` )
    REFERENCES `poiskdetei`.`contact_type` (`id_contact_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_connection_UNIQUE` ON `poiskdetei`.`contact` (`id_contact` ASC) ;

CREATE INDEX `fk_id_contact_type` ON `poiskdetei`.`contact` (`id_contact_type` ASC) ;

CREATE INDEX `fk_id_person` ON `poiskdetei`.`contact` (`id_person` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`sign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`sign` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`sign` (
  `id_sign` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL COMMENT 'rost, ves , glaza, teloslogenie, usi' ,
  PRIMARY KEY (`id_sign`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_primeti_UNIQUE` ON `poiskdetei`.`sign` (`id_sign` ASC) ;


-- -----------------------------------------------------
-- Table `poiskdetei`.`sign_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poiskdetei`.`sign_detail` ;

CREATE  TABLE IF NOT EXISTS `poiskdetei`.`sign_detail` (
  `id_sign_detail` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NULL COMMENT '(rost)высокий, (telo)крепкого телосложения,( волосы) и (усы) седые' ,
  PRIMARY KEY (`id_sign_detail`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_primeti_detail_UNIQUE` ON `poiskdetei`.`sign_detail` (`id_sign_detail` ASC) ;


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
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person` )
    REFERENCES `poiskdetei`.`person` (`id_person` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_sign`
    FOREIGN KEY (`id_sign` )
    REFERENCES `poiskdetei`.`sign` (`id_sign` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_sign_detail`
    FOREIGN KEY (`id_sign_detail` )
    REFERENCES `poiskdetei`.`sign_detail` (`id_sign_detail` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_client_primeti_UNIQUE` ON `poiskdetei`.`person_to_sign` (`id_person_sign` ASC) ;

CREATE INDEX `fk_id_person` ON `poiskdetei`.`person_to_sign` (`id_person` ASC) ;

CREATE INDEX `fk_id_sign` ON `poiskdetei`.`person_to_sign` (`id_sign` ASC) ;

CREATE INDEX `fk_id_sign_detail` ON `poiskdetei`.`person_to_sign` (`id_sign_detail` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
