-- --------------------------------------------------------
-- Servidor:                     m4rtinsp.com
-- Versão do servidor:           5.1.66-0+squeeze1 - (Debian)
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              7.0.0.4370
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela finance.auth_group
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.auth_group: 0 rows
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.auth_group_permissions
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.auth_group_permissions: 0 rows
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.auth_permission
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.auth_permission: 30 rows
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add permission', 1, 'add_permission'),
	(2, 'Can change permission', 1, 'change_permission'),
	(3, 'Can delete permission', 1, 'delete_permission'),
	(4, 'Can add group', 2, 'add_group'),
	(5, 'Can change group', 2, 'change_group'),
	(6, 'Can delete group', 2, 'delete_group'),
	(7, 'Can add user', 3, 'add_user'),
	(8, 'Can change user', 3, 'change_user'),
	(9, 'Can delete user', 3, 'delete_user'),
	(10, 'Can add content type', 4, 'add_contenttype'),
	(11, 'Can change content type', 4, 'change_contenttype'),
	(12, 'Can delete content type', 4, 'delete_contenttype'),
	(13, 'Can add session', 5, 'add_session'),
	(14, 'Can change session', 5, 'change_session'),
	(15, 'Can delete session', 5, 'delete_session'),
	(16, 'Can add site', 6, 'add_site'),
	(17, 'Can change site', 6, 'change_site'),
	(18, 'Can delete site', 6, 'delete_site'),
	(19, 'Can add type', 7, 'add_type'),
	(20, 'Can change type', 7, 'change_type'),
	(21, 'Can delete type', 7, 'delete_type'),
	(22, 'Can add product', 8, 'add_product'),
	(23, 'Can change product', 8, 'change_product'),
	(24, 'Can delete product', 8, 'delete_product'),
	(25, 'Can add product log', 9, 'add_productlog'),
	(26, 'Can change product log', 9, 'change_productlog'),
	(27, 'Can delete product log', 9, 'delete_productlog'),
	(28, 'Can add log entry', 10, 'add_logentry'),
	(29, 'Can change log entry', 10, 'change_logentry'),
	(30, 'Can delete log entry', 10, 'delete_logentry');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.auth_user
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.auth_user: 2 rows
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
	(1, 'phmartins6', 'Paulo', 'Martins', 'phmartins6@gmail.com', 'pbkdf2_sha256$10000$IFoH0OGxcwRr$JPr1dNble3Sp4uPjAtTxmeAyGMVO1qQEPbn/1aURnQ0=', 1, 1, 1, '2013-03-22 23:55:02', '2013-03-01 05:48:05'),
	(2, 'pipocket', '', '', '', 'pbkdf2_sha256$10000$koEeFGqvB3PK$Mz8XJPFWgjUSPKhUylyS4466MLwihPbjynsMq7Pt7SU=', 0, 1, 0, '2013-03-19 19:40:39', '2013-03-19 19:40:24');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.auth_user_groups
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.auth_user_groups: 0 rows
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.auth_user_user_permissions
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.auth_user_user_permissions: 0 rows
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.django_admin_log
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.django_admin_log: 2 rows
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
	(1, '2013-03-19 19:40:25', 1, 3, '2', 'pipocket', 1, ''),
	(2, '2013-03-19 19:42:38', 1, 3, '1', 'phmartins6', 2, 'Changed password, first_name and last_name.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.django_content_type
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.django_content_type: 10 rows
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
	(1, 'permission', 'auth', 'permission'),
	(2, 'group', 'auth', 'group'),
	(3, 'user', 'auth', 'user'),
	(4, 'content type', 'contenttypes', 'contenttype'),
	(5, 'session', 'sessions', 'session'),
	(6, 'site', 'sites', 'site'),
	(7, 'type', 'products', 'type'),
	(8, 'product', 'products', 'product'),
	(9, 'product log', 'products', 'productlog'),
	(10, 'log entry', 'admin', 'logentry');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.django_session
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.django_session: 10 rows
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('1e37084f45eedd5608fbde0007411e8e', 'MTNiYmM4YzQwMWI5NTU1MzhmMzEwMTVmMzI4YmJmYjdjNmIwNDZjYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-03-16 03:23:25'),
	('238d7922f3c7ae705c900f3fd8d17392', 'MTQxOWQxN2JmNjJjZDhhMWI4ZjUwODg0ZjQxMmYxZmY1MjkxZWM0YjqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n', '2013-03-20 21:27:46'),
	('313e21e8b09cd1099136a2f4fa74277e', 'MTNiYmM4YzQwMWI5NTU1MzhmMzEwMTVmMzI4YmJmYjdjNmIwNDZjYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-03-25 19:26:52'),
	('dcddd5a74101a37708b6bb68737b2d82', 'NWU3OTQ1NGE4ZGNkOGViOGRhYjdiYTEwN2FhM2ZjZDI1MWE2ZDJkODqAAn1xAShVCnRlc3Rjb29r\naWVxAlUGd29ya2VkcQNVDV9hdXRoX3VzZXJfaWRxBIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kcQVV\nKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQZ1Lg==\n', '2013-03-15 14:55:03'),
	('46d87bb3bf3f21cd26add57caada3b0f', 'MTNiYmM4YzQwMWI5NTU1MzhmMzEwMTVmMzI4YmJmYjdjNmIwNDZjYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-03-15 14:59:10'),
	('aa4b0f7be52fac757bb4303e6cfdd513', 'ZTcyODRhZWI2ODAyYTFhYTVmYjg0ZDMwNWJhMDc4ODdkY2NjZTM1NTqAAn1xAS4=\n', '2013-03-21 15:28:36'),
	('12db2927175bb2245992ebf33d51fa06', 'MTNiYmM4YzQwMWI5NTU1MzhmMzEwMTVmMzI4YmJmYjdjNmIwNDZjYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-03-27 02:10:38'),
	('a2fc0832de6a4c97977476b1a295fc0b', 'MTNiYmM4YzQwMWI5NTU1MzhmMzEwMTVmMzI4YmJmYjdjNmIwNDZjYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-04-04 14:24:45'),
	('0dc9960f9878f5177083d50cc9c23358', 'MTNiYmM4YzQwMWI5NTU1MzhmMzEwMTVmMzI4YmJmYjdjNmIwNDZjYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-04-02 19:29:31'),
	('1f562d195110e30f293f0fa6ed612ed1', 'MTNiYmM4YzQwMWI5NTU1MzhmMzEwMTVmMzI4YmJmYjdjNmIwNDZjYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-04-05 23:55:02');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.django_site
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.django_site: 1 rows
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
	(1, 'example.com', 'example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `end_date` date NOT NULL,
  `value` double NOT NULL,
  `obs` varchar(200) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_777d41c8` (`type_id`),
  KEY `product_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.product: 21 rows
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `date`, `end_date`, `value`, `obs`, `type_id`, `user_id`, `status`) VALUES
	(1, 'Previdência Privada Itaú', '2013-03-05', '2020-03-05', 50, '', 4, 1, 1),
	(2, 'Sem Parar', '2013-03-05', '2013-12-05', 78.73, '', 1, 1, 1),
	(3, 'American Express', '2013-03-05', '2013-03-05', 55.12, '', 3, 1, 1),
	(4, 'Visa', '2013-03-05', '2013-03-05', 498.7, '', 3, 1, 1),
	(5, 'Empréstimo Bradesco', '2013-03-06', '2013-04-06', 845.99, '', 7, 1, 1),
	(6, 'Financiamento', '2013-03-19', '2014-10-19', 1568.16, '', 1, 1, 0),
	(7, 'Boleto Construtora', '2013-03-05', '2013-03-05', 1849.75, '', 2, 1, 1),
	(8, 'Net', '2013-03-05', '2013-12-05', 25, '', 8, 1, 0),
	(9, 'Net (Pai)', '2013-03-05', '2013-03-05', 200, '', 8, 1, 1),
	(10, 'Contador', '2013-03-15', '2013-12-15', 207.5, '', 6, 1, 1),
	(11, 'Bilhete único', '2013-03-02', '2013-03-12', 120, '', 5, 1, 1),
	(12, 'Tarifa Itaú', '2013-03-04', '2013-12-04', 28, '', 7, 1, 1),
	(13, 'Gasolina', '2013-03-06', '2013-03-06', 50, '', 1, 1, 1),
	(14, 'Net - Filme alugado', '2013-03-08', '2013-03-08', 10, '', 8, 1, 0),
	(15, 'Tarifa Bradesco', '2013-03-15', '2013-05-15', 25.4, '', 7, 1, 0),
	(16, 'Débito LPS Brasil', '2013-03-05', '2013-03-05', 729.99, '', 2, 1, 1),
	(17, 'Arquitetura', '2013-03-06', '2013-03-06', 400, '', 9, 1, 1),
	(18, 'DAS', '2013-03-20', '2013-03-20', 132, '', 6, 1, 1),
	(19, 'Consultor de Imóveis', '2013-03-15', '2013-03-15', 1077.8, '', 2, 1, 0),
	(20, 'Condomínio (Pai)', '2013-03-07', '2013-06-07', 614.05, '', 8, 1, 0),
	(21, 'King Host', '2013-03-21', '2013-03-21', 19, '', 11, 1, 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.product_log
DROP TABLE IF EXISTS `product_log`;
CREATE TABLE IF NOT EXISTS `product_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `value` double NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_log_44bdf3ee` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.product_log: 22 rows
/*!40000 ALTER TABLE `product_log` DISABLE KEYS */;
INSERT INTO `product_log` (`id`, `product_id`, `value`, `date`) VALUES
	(1, 7, 1849.75, '2013-03-02'),
	(2, 1, 50, '2013-03-04'),
	(3, 9, 200, '2013-03-04'),
	(4, 3, 55.12, '2013-03-05'),
	(5, 12, 28, '2013-03-05'),
	(6, 13, 50, '2013-03-05'),
	(7, 11, 120, '2013-03-05'),
	(8, 2, 78.73, '2013-03-06'),
	(9, 4, 498.7, '2013-03-06'),
	(10, 5, 845.99, '2013-03-06'),
	(11, 16, 729.99, '2013-03-06'),
	(12, 17, 400, '2013-03-06'),
	(13, 10, 207.5, '2013-03-07'),
	(14, 18, 132, '2013-03-11'),
	(15, 19, 1077.8, '2013-03-14'),
	(16, 20, 614.05, '2013-03-14'),
	(17, 21, 19, '2013-03-21'),
	(18, 8, 25, '2013-03-21'),
	(19, 14, 10, '2013-03-21'),
	(20, 15, 25.4, '2013-03-21'),
	(21, 6, 1568.16, '2013-03-22'),
	(22, 1, 50, '2013-04-02');
/*!40000 ALTER TABLE `product_log` ENABLE KEYS */;


-- Copiando estrutura para tabela finance.product_type
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_type_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela finance.product_type: 11 rows
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` (`id`, `name`, `user_id`) VALUES
	(1, 'Carro', 1),
	(2, 'Apartamento', 1),
	(3, 'Cartão de Crédito', 1),
	(4, 'Investimento', 1),
	(5, 'Transporte', 1),
	(6, 'PH M Cons. Ltda', 1),
	(7, 'Banco', 1),
	(8, 'Casa', 1),
	(9, 'Pipocket', 1),
	(10, 'Infraestrutura', 2),
	(11, 'Snc', 1);
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
