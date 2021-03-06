-- MySQL Script generated by MySQL Workbench
-- Mon Nov 26 21:33:17 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehiculos` (
  `nro_placa` VARCHAR(10) NOT NULL,
  `marca` VARCHAR(30) NOT NULL,
  `modelo` VARCHAR(30) NOT NULL,
  `nro_chasis` VARCHAR(20) NOT NULL,
  `tipo_combustible` VARCHAR(20) NOT NULL,
  `cilindrada` DECIMAL(10,0) NOT NULL,
  `categoria` VARCHAR(30) NOT NULL,
  `cap_tanque` INT(11) NOT NULL,
  `cod_interno` VARCHAR(20) NOT NULL,
  `bsisa` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cod_interno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`asignacion_vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asignacion_vehiculos` (
  `id_asignacion` INT(11) NOT NULL,
  `fecha_asignacion` DATE NOT NULL,
  `autorizado_por` VARCHAR(20) NOT NULL,
  `estado_vehiculo` VARCHAR(30) NOT NULL,
  `kilometraje` INT(5) NOT NULL,
  `observaciones` VARCHAR(30) NOT NULL,
  `vehiculos_cod_interno` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_asignacion`, `vehiculos_cod_interno`),
  INDEX `fk_asignacion_vehiculos_vehiculos1_idx` (`vehiculos_cod_interno` ASC),
  CONSTRAINT `fk_asignacion_vehiculos_vehiculos1`
    FOREIGN KEY (`vehiculos_cod_interno`)
    REFERENCES `mydb`.`vehiculos` (`cod_interno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`carga_comb`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`carga_comb` (
  `id_carga` INT(10) NOT NULL,
  `fecha_carga` DATETIME NOT NULL,
  `cod_interno` VARCHAR(20) NOT NULL,
  `ci_conductor` INT(10) NOT NULL,
  `tipo_comb` VARCHAR(20) NOT NULL,
  `cant_carga` VARCHAR(20) NOT NULL,
  `precinto_ant` VARCHAR(10) NOT NULL,
  `precinto_act` VARCHAR(10) NOT NULL,
  `costo_carga` DECIMAL(10,0) NOT NULL,
  `nro_vale` INT(11) NOT NULL,
  `tipo_carga` VARCHAR(10) NOT NULL,
  `nro_factura` INT(10) NOT NULL,
  `nro_autorizacion` VARCHAR(20) NOT NULL,
  `cod_control` VARCHAR(20) NOT NULL,
  `kilometraje` INT(10) NOT NULL,
  PRIMARY KEY (`id_carga`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`compra_combustible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compra_combustible` (
  `tipo_comb` VARCHAR(20) NOT NULL,
  `cant_combustible` INT(11) NOT NULL,
  `costo_combustible` INT(11) NOT NULL,
  `fecha_compra` INT(11) NOT NULL,
  `nro_factura` INT(10) NOT NULL,
  `nro_autorizacion` VARCHAR(20) NOT NULL,
  `cod_control` VARCHAR(20) NOT NULL,
  `razon_social` VARCHAR(30) NOT NULL,
  `nro_nit` VARCHAR(20) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`compra_precintos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compra_precintos` (
  `fecha_compra` DATE NOT NULL,
  `cantidad_precinto` INT(11) NOT NULL,
  `costo_precinto` INT(11) NOT NULL,
  `nro_factura` INT(10) NOT NULL,
  `nro_autorizacion` VARCHAR(20) NOT NULL,
  `cod_control` VARCHAR(20) NOT NULL,
  `razon_social` VARCHAR(30) NOT NULL,
  `nro_nit` INT(15) NOT NULL,
  `nro_inicial` INT(11) NOT NULL,
  `nro_final` INT(11) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `login` VARCHAR(15) NOT NULL,
  `clave` VARCHAR(10) NOT NULL,
  `rol` VARCHAR(30) NOT NULL,
  `nombre_usuario` VARCHAR(30) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `vigencia` VARCHAR(30) NOT NULL,
  `id_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionario` (
  `id_funcionario` INT(11) NOT NULL,
  `ci` INT(11) NOT NULL,
  `nombres` VARCHAR(20) NOT NULL,
  `paterno` VARCHAR(20) NOT NULL,
  `materno` VARCHAR(20) NOT NULL,
  `fecha_nac` DATE NOT NULL,
  `lugar_nac` VARCHAR(30) NOT NULL,
  `telf_empleado` INT(11) NOT NULL,
  `telf_celular` INT(10) NOT NULL,
  `categoria_licencia` VARCHAR(5) NOT NULL,
  `cargo` VARCHAR(20) NOT NULL,
  `departamento` VARCHAR(30) NOT NULL,
  `asignacion_vehiculos_id_asignacion` INT(11) NOT NULL,
  `carga_comb_id_carga` INT(10) NOT NULL,
  `usuarios_id_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_funcionario`, `asignacion_vehiculos_id_asignacion`, `carga_comb_id_carga`, `usuarios_id_usuario`),
  INDEX `fk_funcionario_asignacion_vehiculos_idx` (`asignacion_vehiculos_id_asignacion` ASC),
  INDEX `fk_funcionario_carga_comb1_idx` (`carga_comb_id_carga` ASC),
  INDEX `fk_funcionario_usuarios1_idx` (`usuarios_id_usuario` ASC),
  CONSTRAINT `fk_funcionario_asignacion_vehiculos`
    FOREIGN KEY (`asignacion_vehiculos_id_asignacion`)
    REFERENCES `mydb`.`asignacion_vehiculos` (`id_asignacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_carga_comb1`
    FOREIGN KEY (`carga_comb_id_carga`)
    REFERENCES `mydb`.`carga_comb` (`id_carga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `mydb`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
