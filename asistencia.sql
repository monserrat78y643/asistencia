/*
Navicat MySQL Data Transfer

Source Server         : nuevas
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : asistencia

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-03-19 14:24:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for asistencia
-- ----------------------------
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fkestudiantegrupo` int(11) NOT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fkestudiantegrupo` (`fkestudiantegrupo`) USING BTREE,
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`fkestudiantegrupo`) REFERENCES `estudiantesgrupo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of asistencia
-- ----------------------------

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('Admin', '2', '1696880070');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE,
  KEY `idx-auth_item-type` (`type`) USING BTREE,
  KEY `fk_auth_item_group_code` (`group_code`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `auth_item_ibfk_2` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('//*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('//controller', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('//crud', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('//extension', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('//form', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('//index', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('//model', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('//module', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/asset/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/asset/compress', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/asset/template', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/cache/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/cache/flush', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/cache/flush-all', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/cache/flush-schema', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/cache/index', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/fixture/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/fixture/load', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/fixture/unload', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/gii/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/gii/default/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/gii/default/action', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/gii/default/index', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/gii/default/view', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/hello/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/hello/index', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/help/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/help/index', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/help/list', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/help/list-action-options', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/help/usage', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/message/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/message/config', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/message/config-template', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/message/extract', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/create', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/down', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/fresh', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/history', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/mark', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/new', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/redo', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/to', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/migrate/up', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/serve/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/serve/index', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/*', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/auth/change-own-password', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set-roles', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-activate', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-deactivate', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-delete', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/change-password', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/create', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/delete', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-page-size', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/index', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/update', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('/user-management/user/view', '3', null, null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('Admin', '1', 'Admin', null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('assignRolesToUsers', '2', 'Assign roles to users', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('bindUserToIp', '2', 'Bind user to IP', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('changeOwnPassword', '2', 'Change own password', null, null, '1695593700', '1695593700', 'userCommonPermissions');
INSERT INTO `auth_item` VALUES ('changeUserPassword', '2', 'Change user password', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('commonPermission', '2', 'Common permission', null, null, '1695593700', '1695593700', null);
INSERT INTO `auth_item` VALUES ('createUsers', '2', 'Create users', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('deleteUsers', '2', 'Delete users', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('editUserEmail', '2', 'Edit user email', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('editUsers', '2', 'Edit users', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewRegistrationIp', '2', 'View registration IP', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserEmail', '2', 'View user email', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserRoles', '2', 'View user roles', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUsers', '2', 'View users', null, null, '1695593700', '1695593700', 'userManagement');
INSERT INTO `auth_item` VALUES ('viewVisitLog', '2', 'View visit log', null, null, '1695593700', '1695593700', 'userManagement');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`) USING BTREE,
  KEY `child` (`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/delete');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/view');

-- ----------------------------
-- Table structure for auth_item_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_group`;
CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions', 'User common permission', '1695593700', '1695593700');
INSERT INTO `auth_item_group` VALUES ('userManagement', 'User management', '1695593700', '1695593700');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for carrera
-- ----------------------------
DROP TABLE IF EXISTS `carrera`;
CREATE TABLE `carrera` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `clave` varchar(15) NOT NULL,
  `fkdepartamento` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fkdepartamento` (`fkdepartamento`) USING BTREE,
  CONSTRAINT `carrera_ibfk_1` FOREIGN KEY (`fkdepartamento`) REFERENCES `departamento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of carrera
-- ----------------------------

-- ----------------------------
-- Table structure for cicloescolar
-- ----------------------------
DROP TABLE IF EXISTS `cicloescolar`;
CREATE TABLE `cicloescolar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  `fktipociclo` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fktipociclo` (`fktipociclo`) USING BTREE,
  CONSTRAINT `cicloescolar_ibfk_1` FOREIGN KEY (`fktipociclo`) REFERENCES `tipociclo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cicloescolar
-- ----------------------------
INSERT INTO `cicloescolar` VALUES ('1', '1', 'enero-junio', '0', '2');
INSERT INTO `cicloescolar` VALUES ('2', 'ene', 'ene-jun', '0', '2');
INSERT INTO `cicloescolar` VALUES ('4', 'agost', 'agosto-diciembre', '1', '6');
INSERT INTO `cicloescolar` VALUES ('5', 'agosto', 'agost-dic2020', '1', '7');
INSERT INTO `cicloescolar` VALUES ('6', 'verano', 'verano2020', '1', '7');

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `encargado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of departamento
-- ----------------------------
INSERT INTO `departamento` VALUES ('1', 'sistemas', 'jose alfredo');
INSERT INTO `departamento` VALUES ('5', 'quimica', 'marcela');

-- ----------------------------
-- Table structure for estudiantesgrupo
-- ----------------------------
DROP TABLE IF EXISTS `estudiantesgrupo`;
CREATE TABLE `estudiantesgrupo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fkpersonal` int(11) NOT NULL,
  `fkgrupo` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fkpersonal` (`fkpersonal`) USING BTREE,
  KEY `fkgrupo` (`fkgrupo`) USING BTREE,
  CONSTRAINT `estudiantesgrupo_ibfk_1` FOREIGN KEY (`fkpersonal`) REFERENCES `personal` (`ID`),
  CONSTRAINT `estudiantesgrupo_ibfk_2` FOREIGN KEY (`fkgrupo`) REFERENCES `grupo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of estudiantesgrupo
-- ----------------------------

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NOT NULL,
  `fkmateria` int(11) NOT NULL,
  `fkperiodo` int(11) NOT NULL,
  `fkpersonal` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `dias` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fkmateria` (`fkmateria`) USING BTREE,
  KEY `fkperiodo` (`fkperiodo`) USING BTREE,
  KEY `fkpersonal` (`fkpersonal`) USING BTREE,
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`fkmateria`) REFERENCES `materia` (`ID`),
  CONSTRAINT `grupo_ibfk_2` FOREIGN KEY (`fkperiodo`) REFERENCES `periodo` (`ID`),
  CONSTRAINT `grupo_ibfk_3` FOREIGN KEY (`fkpersonal`) REFERENCES `personal` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of grupo
-- ----------------------------

-- ----------------------------
-- Table structure for materia
-- ----------------------------
DROP TABLE IF EXISTS `materia`;
CREATE TABLE `materia` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fkcarrera` int(11) NOT NULL,
  `fkplan` int(11) NOT NULL,
  `semestre` tinyint(2) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fkplan` (`fkplan`) USING BTREE,
  KEY `fkcarrera` (`fkcarrera`) USING BTREE,
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`fkplan`) REFERENCES `plan` (`ID`),
  CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`fkcarrera`) REFERENCES `carrera` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of materia
-- ----------------------------

-- ----------------------------
-- Table structure for periodo
-- ----------------------------
DROP TABLE IF EXISTS `periodo`;
CREATE TABLE `periodo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  `fkciclo` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fkciclo` (`fkciclo`) USING BTREE,
  CONSTRAINT `periodo_ibfk_1` FOREIGN KEY (`fkciclo`) REFERENCES `cicloescolar` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of periodo
-- ----------------------------
INSERT INTO `periodo` VALUES ('1', 'ene', 'enero', '1', '1');
INSERT INTO `periodo` VALUES ('2', 'ver', 'verano', '0', '2');
INSERT INTO `periodo` VALUES ('3', 'ago', 'agosto', '1', '5');
INSERT INTO `periodo` VALUES ('4', 'ver', 'verano', '1', '5');

-- ----------------------------
-- Table structure for personal
-- ----------------------------
DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varbinary(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL,
  `fktipopersonal` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `fkuser` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fkuser` (`fkuser`) USING BTREE,
  KEY `fktipopersonal` (`fktipopersonal`) USING BTREE,
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`fkuser`) REFERENCES `user` (`id`),
  CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`fktipopersonal`) REFERENCES `tipopersonal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of personal
-- ----------------------------
INSERT INTO `personal` VALUES ('1', '', 'arturo', 'moreno', 'cabrera', '1', 'amc', '1');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of plan
-- ----------------------------

-- ----------------------------
-- Table structure for tipociclo
-- ----------------------------
DROP TABLE IF EXISTS `tipociclo`;
CREATE TABLE `tipociclo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `mes` tinyint(2) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tipociclo
-- ----------------------------
INSERT INTO `tipociclo` VALUES ('1', 'Cuatrimestral', '4');
INSERT INTO `tipociclo` VALUES ('2', 'Semestre', '6');
INSERT INTO `tipociclo` VALUES ('3', 'cuatrimestral', '4');
INSERT INTO `tipociclo` VALUES ('6', 'trimestre', '3');
INSERT INTO `tipociclo` VALUES ('7', 'Anual', '12');

-- ----------------------------
-- Table structure for tipopersonal
-- ----------------------------
DROP TABLE IF EXISTS `tipopersonal`;
CREATE TABLE `tipopersonal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tipopersonal
-- ----------------------------
INSERT INTO `tipopersonal` VALUES ('1', 'alumno');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `superadmin` smallint(6) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'superadmin', 'NvQpmRasSPWC0FX8qKNHgcpoLyAm_hOA', '$2y$13$fVwTmwAXRUC3KqMzKqYj6./juACd4HCHrveMH8PkABwzXEoXn2ESK', null, '1', '1', '1695593700', '1695593700', null, null, null, '0');
INSERT INTO `user` VALUES ('2', 'antrax', 'DK-AzqQ4rTFNPZoTbA_9yAM5ifDhUvjA', '$2y$13$i.P8um6kEuiOXFOc0yoWiOhqZA2gQ/V.7ZyFattnD4im7s9f0HEMG', null, '1', '0', '1696879938', '1696879938', '127.0.0.1', '', '', '0');

-- ----------------------------
-- Table structure for user_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` char(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES ('1', '651dded9cc7fb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696456409', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('2', '651de80aa3dcd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696458762', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('3', '651dec1062b60', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696459792', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('4', '651dec8733db3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696459911', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('5', '651dee51d64d3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696460369', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('6', '651e21a8063ff', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696473512', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('7', '651e21e5397f7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696473573', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('8', '651e24d216079', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696474322', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('9', '651e254ec6737', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696474446', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('10', '651e2ef1d5579', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696476913', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('11', '651e2f5f967ad', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696477023', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('12', '651e30c2a1fa7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696477378', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('13', '651e3bc18de2b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696480193', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('14', '651e4038457b8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696481336', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('15', '651e472c92c2b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696483116', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('16', '651ee4d168cfc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696523473', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('17', '65244173d8a6b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696874867', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('18', '652446a637210', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696876198', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('19', '6524479111065', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696876433', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('20', '652447ba97759', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696876474', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('21', '6524494915d1d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696876873', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('22', '652453fda1a86', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696879613', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('23', '652454458955b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696879685', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('24', '6524557f8cb61', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696879999', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('25', '65245653064cb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1696880211', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('26', '65276f0ac8be6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1697083146', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('27', '652cb832cfa9f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1697429554', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('28', '652cb97a4db18', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1697429882', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('29', '652d5c0480a19', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', '1', '1697471492', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('30', '652ede691bfd6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1697570409', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('31', '65300313e6979', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1697645332', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('32', '65317b69a57a7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1697741673', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('33', '653183899a48f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1697743753', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('34', '6534b5ab1bb72', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1697953195', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('35', '6534b68118b54', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1697953409', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('36', '6534b81e35c45', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1697953822', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('37', '6535d14634547', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698025798', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('38', '6536eaef5b9df', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698097903', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('39', '6536f6dc79aef', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698100956', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('40', '6536f79830232', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698101144', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('41', '65376cb8a1709', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698131128', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('42', '6537fe68ab4a4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698168424', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('43', '653818803c987', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698175104', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('44', '65394b8cebb26', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698253709', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('45', '653953007d940', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698255616', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('46', '65395493626dc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698256019', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('47', '653972b1e4cc0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698263729', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('48', '653b3d829899e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698381186', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('49', '653b40a9a7492', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698381993', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('50', '653b426aa5580', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698382442', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('51', '653b46eaf26b0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698383594', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('52', '653b4c2da18ae', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698384941', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('53', '653f295d2cf1a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698638173', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('54', '6540f934742d4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1698756916', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('55', '654903b597d38', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1699283893', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('56', '65492250cd9a0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1699291728', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('57', '6549c858963df', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1699334232', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('58', '654a65fcbab38', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', '1', '1699374588', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('59', '654bba8deb4f5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1699461774', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('60', '654bbe34d1802', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1699462708', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('61', '654cfd8fddf3c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1699544463', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('62', '655041ec1285a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1699758572', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('63', '655052601b506', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1699762784', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('64', '655052fac41b1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1699762938', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('65', '655250944185f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1699893396', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('66', '655278a7f2e85', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1699903655', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('67', '655642b25e78c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1700151986', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('68', '655e8039674bc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1700692025', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('69', '6563ee5d5d217', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701047901', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('70', '6564ec0172f7f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701112833', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('71', '65656bab7ed0f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701145515', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('72', '656585e6801d5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701152230', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('73', '6566234e6d800', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701192526', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('74', '6566670e03713', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701209870', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('75', '65666dbc86e2c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701211580', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('76', '65666f2c34f69', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701211948', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('77', '6568082eaee5f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701316654', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('78', '6568af8eb3c0b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701359502', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('79', '6568b2e2970a0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701360354', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('80', '6568b2e4957a6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701360356', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('81', '656eb10ac1cfb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701753098', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('82', '656fe6445d1bd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701832260', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('83', '656ff36a99139', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701835626', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('84', '6570106264482', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701843042', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('85', '6570141f9d421', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701843999', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('86', '65707330bb832', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701868336', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('87', '6570c8969e3bc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701890198', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('88', '65723d0077717', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '1', '1701985536', 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES ('89', '65f9f070146b5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', '1', '1710878832', 'Chrome', 'Windows');
