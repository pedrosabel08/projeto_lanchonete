-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bdd_lanchonete
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdd_lanchonete
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdd_lanchonete` DEFAULT CHARACTER SET utf8mb4 ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `bdd_lanchonete` ;

-- -----------------------------------------------------
-- Table `bdd_lanchonete`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_lanchonete`.`admin` (
  `idAdmin` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdmin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `bdd_lanchonete`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_lanchonete`.`endereco` (
  `idEndereco` INT(11) NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `bdd_lanchonete`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_lanchonete`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(45) NOT NULL,
  `cpfCliente` VARCHAR(45) NOT NULL,
  `Endereco_idEndereco` INT(11) NOT NULL,
  PRIMARY KEY (`idCliente`, `Endereco_idEndereco`),
  CONSTRAINT `fk_Cliente_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `bdd_lanchonete`.`endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `bdd_lanchonete`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_lanchonete`.`fornecedor` (
  `idFornecedor` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeFornecedor` VARCHAR(45) NOT NULL,
  `cpfFornecedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `bdd_lanchonete`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_lanchonete`.`funcionario` (
  `idFuncionario` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` VARCHAR(45) NOT NULL,
  `telefoneFuncionario` VARCHAR(45) NOT NULL,
  `cpfFuncionario` VARCHAR(45) NOT NULL,
  `cargoFuncionario` VARCHAR(45) NOT NULL,
  `salarioFuncionario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `bdd_lanchonete`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_lanchonete`.`pedido` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `preco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `bdd_lanchonete`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_lanchonete`.`produto` (
  `idProduto` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `precoProduto` VARCHAR(45) NOT NULL,
  `Fornecedor_idFornecedor` INT(11) NOT NULL,
  PRIMARY KEY (`idProduto`, `Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Produto_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `bdd_lanchonete`.`fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `bdd_lanchonete`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_lanchonete`.`venda` (
  `idVenda` INT(11) NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` INT(11) NOT NULL,
  `Cliente_Endereco_idEndereco` INT(11) NOT NULL,
  `Pedido_idPedido` INT(11) NOT NULL,
  PRIMARY KEY (`idVenda`, `Cliente_idCliente`, `Cliente_Endereco_idEndereco`, `Pedido_idPedido`),
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` , `Cliente_Endereco_idEndereco`)
    REFERENCES `bdd_lanchonete`.`cliente` (`idCliente` , `Endereco_idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `bdd_lanchonete`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `idClientes` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `cpf` VARCHAR(45) NULL DEFAULT NULL,
  `rg` VARCHAR(45) NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fornecedor` (
  `idFornecedor` INT(11) NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(45) NULL DEFAULT NULL,
  `contato` VARCHAR(45) NULL DEFAULT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionario` (
  `idFuncionario` INT(11) NOT NULL AUTO_INCREMENT,
  `senha` VARCHAR(45) NULL DEFAULT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produtos` (
  `idProdutos` INT(11) NOT NULL AUTO_INCREMENT,
  `idFornecedor` INT(11) NULL DEFAULT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `marca` VARCHAR(45) NULL DEFAULT NULL,
  `tamanho` VARCHAR(15) NULL DEFAULT NULL,
  `cor` VARCHAR(45) NULL DEFAULT NULL,
  `preco` VARCHAR(45) NULL DEFAULT NULL,
  `quantidade` INT(11) NOT NULL,
  PRIMARY KEY (`idProdutos`),
  CONSTRAINT `fk_Produto_Fornecedor`
    FOREIGN KEY (`idFornecedor`)
    REFERENCES `mydb`.`fornecedor` (`idFornecedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`venda` (
  `idVenda` INT(11) NOT NULL AUTO_INCREMENT,
  `idProdutos` INT(11) NULL DEFAULT NULL,
  `idClientes` INT(11) NULL DEFAULT NULL,
  `idFuncionario` INT(11) NULL DEFAULT NULL,
  `valor` DOUBLE NULL DEFAULT NULL,
  `data` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  CONSTRAINT `fk_Venda_Clientes`
    FOREIGN KEY (`idClientes`)
    REFERENCES `mydb`.`clientes` (`idClientes`),
  CONSTRAINT `fk_Venda_Funcionario`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `mydb`.`funcionario` (`idFuncionario`),
  CONSTRAINT `fk_Venda_has_Produtos_Produtos1`
    FOREIGN KEY (`idProdutos`)
    REFERENCES `mydb`.`produtos` (`idProdutos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
