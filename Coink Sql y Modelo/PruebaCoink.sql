/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.17-MariaDB : Database - pruebacoink
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pruebacoink` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `pruebacoink`;

/*Table structure for table `departamento` */

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `Pais_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Departamento_Pais_idx` (`Pais_id`),
  CONSTRAINT `fk_Departamento_Pais` FOREIGN KEY (`Pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `departamento` */

insert  into `departamento`(`id`,`nombre`,`Pais_id`) values 
(1,'Atlantico',1),
(2,'Magdalena',1);

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `Departamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Municipio_Departamento1_idx` (`Departamento_id`),
  CONSTRAINT `fk_Municipio_Departamento1` FOREIGN KEY (`Departamento_id`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `municipio` */

insert  into `municipio`(`id`,`nombre`,`Departamento_id`) values 
(1,'Barranquilla',1),
(2,'Luruaco',1),
(3,'Galapa',1),
(4,'ampo de la cruz',1),
(5,'Santa Lucia',1),
(6,'Suan',1),
(9,'Calamar',1),
(10,'Santa Marta',2);

/*Table structure for table `pais` */

DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pais` */

insert  into `pais`(`id`,`nombre`) values 
(1,'Colombia');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `Municipio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Usuario_Municipio1_idx` (`Municipio_id`),
  CONSTRAINT `fk_Usuario_Municipio1` FOREIGN KEY (`Municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`nombre`,`telefono`,`direccion`,`Municipio_id`) values 
(1,'Brian Narvaez','3005167835','Calle 80 # 54',2),
(2,'Anthony','3046372763','Calle 13 # 50',1),
(3,'Natalia','3305458','Calle 54 # 30',1),
(7,'Carlos Cruz','3005167981','Calle 54 # 55',3),
(8,'Maria Luisa','3045824126','Calle 35 # 19 - 25 ',1),
(9,'Ricardo Amortegui','3005418523','El pueblo mas caloroso',3),
(31,'Francisco Gutierrez ','3005167835','Avenida sur Simon Bolivar',5);

/* Procedure structure for procedure `INSERTAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `INSERTAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_USUARIO`(IN `nombre` VARCHAR(45),
 IN `telefono` VARCHAR(45), IN `direccion` VARCHAR(45), IN `municipio_id` INT(15))
BEGIN

INSERT INTO usuario(nombre,telefono ,direccion,Municipio_id)
VALUES (nombre,telefono,direccion,municipio_id);

END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
