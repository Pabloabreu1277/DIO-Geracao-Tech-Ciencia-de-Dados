-- MySQL Script generated by MySQL Workbench
-- Tue Nov  8 16:41:44 2022
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
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereço` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Manutenção`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Manutenção` (
  `idManutenção` INT NOT NULL,
  `Modelo e nome carro` VARCHAR(45) NULL,
  `Cor` VARCHAR(45) NULL,
  `Ano` VARCHAR(45) NULL,
  `Defeito` VARCHAR(45) NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idManutenção`, `cliente_idcliente`),
  INDEX `fk_Manutenção_cliente_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_Manutenção_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Revisão`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Revisão` (
  `idRevisão` INT NOT NULL,
  `Modelo e nome do carro` VARCHAR(45) NULL,
  `Ano` VARCHAR(45) NULL,
  `Cor` VARCHAR(45) NULL,
  `Atividade` VARCHAR(45) NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idRevisão`, `cliente_idcliente`),
  INDEX `fk_Revisão_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_Revisão_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ordem de Serviço` (
  `idOrdem de Serviço` INT NOT NULL,
  `Tipo de atv M/R` VARCHAR(45) NULL,
  `tabela padrao de atv` VARCHAR(45) NULL,
  `data de inicio` VARCHAR(45) NULL,
  `data final` VARCHAR(45) NULL,
  `horas totais` VARCHAR(45) NULL,
  PRIMARY KEY (`idOrdem de Serviço`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Manutenção_has_Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Manutenção_has_Ordem de Serviço` (
  `Manutenção_idManutenção` INT NOT NULL,
  `Manutenção_cliente_idcliente` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`Manutenção_idManutenção`, `Manutenção_cliente_idcliente`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Manutenção_has_Ordem de Serviço_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Manutenção_has_Ordem de Serviço_Manutenção1_idx` (`Manutenção_idManutenção` ASC, `Manutenção_cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_Manutenção_has_Ordem de Serviço_Manutenção1`
    FOREIGN KEY (`Manutenção_idManutenção` , `Manutenção_cliente_idcliente`)
    REFERENCES `mydb`.`Manutenção` (`idManutenção` , `cliente_idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Manutenção_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Revisão_has_Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Revisão_has_Ordem de Serviço` (
  `Revisão_idRevisão` INT NOT NULL,
  `Revisão_cliente_idcliente` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`Revisão_idRevisão`, `Revisão_cliente_idcliente`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Revisão_has_Ordem de Serviço_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Revisão_has_Ordem de Serviço_Revisão1_idx` (`Revisão_idRevisão` ASC, `Revisão_cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_Revisão_has_Ordem de Serviço_Revisão1`
    FOREIGN KEY (`Revisão_idRevisão` , `Revisão_cliente_idcliente`)
    REFERENCES `mydb`.`Revisão` (`idRevisão` , `cliente_idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Revisão_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL,
  `N Os` VARCHAR(45) NULL,
  `Carro cor ano` VARCHAR(45) NULL,
  `quantidade` VARCHAR(45) NULL,
  `material` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque_has_Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque_has_Ordem de Serviço` (
  `Estoque_idEstoque` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Estoque_has_Ordem de Serviço_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Estoque_has_Ordem de Serviço_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_has_Ordem de Serviço_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `mydb`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estoque_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagamento` (
  `idPagamento` INT NOT NULL,
  `N Os` VARCHAR(45) NULL,
  `Dinheiro` VARCHAR(45) NULL,
  `Cartão credito` VARCHAR(45) NULL,
  `cartão de debito` VARCHAR(45) NULL,
  `pix` VARCHAR(45) NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`idPagamento`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Pagamento_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamento_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
