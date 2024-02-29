
DROP DATABASE IF EXISTS `salesland`;
CREATE DATABASE `salesland` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE salesland;
-- CreateTable
CREATE TABLE `AUX_CAMPANAS` (
    `IDENT` INTEGER NOT NULL AUTO_INCREMENT,
    `servidor` VARCHAR(191) NOT NULL,
    `bbdd_report` VARCHAR(191) NULL,
    `IdCampana` INTEGER NOT NULL,
    `sistema` VARCHAR(191) NOT NULL,
    `Nombre` VARCHAR(191) NULL,
    `activo` INTEGER NULL,
    `spcarga_ws_salesland_leads` VARCHAR(191) NULL,
    `admite_duplicado` INTEGER NULL,
    PRIMARY KEY (`IDENT`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AUX_DISOCIAR` (
    `IDENT` INTEGER NOT NULL AUTO_INCREMENT,
    `campo` VARCHAR(191) NOT NULL,
    PRIMARY KEY (`IDENT`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AUX_CAMPANA_DISOCIAR` (
    `campana` INTEGER NOT NULL,
    `campo` VARCHAR(191) NOT NULL,
    `tipo` VARCHAR(191) NULL,
    PRIMARY KEY (`campana`, `campo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AUX_PROVEEDORES` (
    `IDENT` INTEGER NOT NULL AUTO_INCREMENT,
    `cod_proveedor` VARCHAR(5) NULL,
    `proveedor` VARCHAR(191) NULL,

    PRIMARY KEY (`IDENT`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LOG_WS` (
    `IDENT` INTEGER NOT NULL AUTO_INCREMENT,
    `cuerpo` TEXT NULL,
    `error` VARCHAR(191) NULL,
    `fecha` DATETIME(3) NULL,

    PRIMARY KEY (`IDENT`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LOGS_CARGA` (
    `IDENT` INTEGER NOT NULL AUTO_INCREMENT,
    `IdLead` VARCHAR(191) NULL,
    `campana` INTEGER NULL,
    `proveedor` VARCHAR(191) NULL,
    `log_texto` VARCHAR(191) NULL,
    `comando` VARCHAR(191) NULL,
    `fecha` DATETIME(3) NULL,

    PRIMARY KEY (`IDENT`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WS_LEADS` (
    `IDENT` INTEGER NOT NULL AUTO_INCREMENT,
    `idTimeStamp` VARCHAR(191) NULL,
    `IdUnico` VARCHAR(191) NULL,
    `FECHA_ENTRADA` DATETIME(3) NULL,
    `duplicado` INTEGER NULL,
    `cargado` INTEGER NULL,
    `fecha_carga` DATETIME(3) NULL,
    `cod_proveedor` VARCHAR(5) NULL,
    `id` VARCHAR(191) NULL,
    `campana` VARCHAR(191) NULL,
    `fecha_captacion` DATETIME(3) NULL,
    `nombre` VARCHAR(191) NULL,
    `ape1` VARCHAR(191) NULL,
    `ape2` VARCHAR(191) NULL,
    `telefono` VARCHAR(191) NULL,
    `telefonoMD5` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `acepta1` VARCHAR(191) NULL,
    `acepta2` VARCHAR(191) NULL,
    `acepta3` VARCHAR(191) NULL,
    `num1` INTEGER NULL,
    `num2` INTEGER NULL,
    `num3` INTEGER NULL,
    `dual1` VARCHAR(191) NULL,
    `dual2` VARCHAR(191) NULL,
    `dual3` VARCHAR(191) NULL,
    `variable1` VARCHAR(191) NULL,
    `variable2` VARCHAR(191) NULL,
    `variable3` VARCHAR(191) NULL,
    `memo` VARCHAR(191) NULL,
    `fecha` DATETIME(3) NULL,
    `hora` DATETIME(3) NULL,
    `foto1` VARCHAR(191) NULL,
    `foto2` VARCHAR(191) NULL,
    `comercial` VARCHAR(191) NULL,
    `centro` VARCHAR(191) NULL,
    `codigo_postal` VARCHAR(191) NULL,
    `direccion` VARCHAR(191) NULL,
    `poblacion` VARCHAR(191) NULL,
    `provincia` VARCHAR(191) NULL,
    `nif` VARCHAR(191) NULL,

    PRIMARY KEY (`IDENT`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WS_LEADS_DISOCIADOS` (
    `IDENT` INTEGER NOT NULL AUTO_INCREMENT,
    `IDENT_ORI` INTEGER NULL,
    `idTimeStamp` VARCHAR(191) NULL,
    `IdUnico` VARCHAR(191) NULL,
    `FECHA_ENTRADA` DATETIME(3) NULL,
    `duplicado` INTEGER NULL,
    `cod_proveedor` VARCHAR(5) NULL,
    `id` VARCHAR(191) NULL,
    `campana` VARCHAR(191) NULL,
    `fecha_captacion` DATETIME(3) NULL,
    `nombre` VARCHAR(191) NULL,
    `ape1` VARCHAR(191) NULL,
    `ape2` VARCHAR(191) NULL,
    `telefono` VARCHAR(191) NULL,
    `telefonoMD5` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `acepta1` VARCHAR(191) NULL,
    `acepta2` VARCHAR(191) NULL,
    `acepta3` VARCHAR(191) NULL,
    `num1` INTEGER NULL,
    `num2` INTEGER NULL,
    `num3` INTEGER NULL,
    `dual1` VARCHAR(191) NULL,
    `dual2` VARCHAR(191) NULL,
    `dual3` VARCHAR(191) NULL,
    `variable1` VARCHAR(191) NULL,
    `variable2` VARCHAR(191) NULL,
    `variable3` VARCHAR(191) NULL,
    `memo` TEXT NULL,
    `fecha` DATETIME(3) NULL,
    `hora` DATETIME(3) NULL,
    `foto1` VARCHAR(191) NULL,
    `foto2` VARCHAR(191) NULL,
    `comercial` VARCHAR(191) NULL,
    `centro` VARCHAR(191) NULL,
    `codigo_postal` VARCHAR(191) NULL,
    `direccion` VARCHAR(191) NULL,
    `poblacion` VARCHAR(191) NULL,
    `provincia` VARCHAR(191) NULL,
    `nif` VARCHAR(191) NULL,
    `cargado` INTEGER NULL,
    `fecha_carga` DATETIME(3) NULL,
    `fecha_disociado` DATETIME(3) NULL,
    `nombre_enc` BLOB NULL,
    `ape1_enc` BLOB NULL,
    `ape2_enc` BLOB NULL,
    `telefono_enc` BLOB NULL,
    `email_enc` BLOB NULL,
    `variable1_enc` BLOB NULL,
    `variable2_enc` BLOB NULL,
    `variable3_enc` BLOB NULL,
    `memo_enc` BLOB NULL,
    `foto1_enc` BLOB NULL,
    `foto2_enc` BLOB NULL,
    `codigo_postal_enc` BLOB NULL,
    `direccion_enc` BLOB NULL,
    `poblacion_enc` BLOB NULL,
    `provincia_enc` BLOB NULL,
    `nif_enc` BLOB NULL,
    PRIMARY KEY (`IDENT`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


INSERT INTO `AUX_CAMPANAS` (`IDENT`, `servidor`, `bbdd_report`, `IdCampana`, `sistema`, `Nombre`, `activo`, `spcarga_ws_salesland_leads`, `admite_duplicado`) VALUES
(1, 'localhost', 'report', 1, 'ICR', 'Campaña de Prueba', 1, 'sp_disociar', 1),
(2, 'localhost', 'report', 2, 'ICR', 'Campaña de Prueba 2', 1, 'sp_disociar', 1),
(3, 'localhost', 'report', 3, 'ICR', 'Campaña de Prueba 3', 1, 'sp_disociar', 1),
(4, 'localhost', 'report', 4, 'ICR', 'Campaña de Prueba 4', 1, 'sp_disociar', 1),
(5, 'localhost', 'report', 5, 'ICR', 'Campaña de Prueba 5', 1, 'sp_disociar', 1);

INSERT INTO `AUX_DISOCIAR` (`IDENT`, `campo`) VALUES
(1, 'ape1'),
(2, 'direccion'),
(3, 'email'),
(4, 'nif'),
(5, 'nombre'),
(6, 'telefono');

INSERT INTO `AUX_CAMPANA_DISOCIAR` (`campana`, `campo`, `tipo`) VALUES
(1, 'poblacion', 'descripción x'),
(1, 'provincia', 'descripción y');