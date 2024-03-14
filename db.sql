/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - zaixianwenjuandiaocha
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zaixianwenjuandiaocha` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zaixianwenjuandiaocha`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/zaixianwenjuandiaocha/upload/1638238942609.jpg'),(2,'picture2','http://localhost:8080/zaixianwenjuandiaocha/upload/1638238950169.jpg'),(3,'picture3','http://localhost:8080/zaixianwenjuandiaocha/upload/1638238959682.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_types` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_types`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2022-03-13 10:09:07'),(2,'sex_types','性别',2,'女',NULL,'2022-03-13 10:09:07'),(3,'exampaper_types','问卷状态',1,'启用',NULL,'2022-03-13 10:09:07'),(4,'exampaper_types','问卷状态',2,'禁用',NULL,'2022-03-13 10:09:07'),(5,'examquestion_types','试题类型',1,'单选',NULL,'2022-03-13 10:09:07'),(6,'examquestion_types','试题类型',2,'多选',NULL,'2022-03-13 10:09:07'),(9,'examredetails_types','审核结果',1,'正确',NULL,'2022-03-13 10:09:07'),(10,'examredetails_types','审核结果',2,'错误',NULL,'2022-03-13 10:09:07'),(11,'news_types','新闻类型名称',1,'新闻类型1',NULL,'2022-03-13 10:09:07'),(12,'news_types','新闻类型名称',2,'新闻类型2',NULL,'2022-03-13 10:09:07');

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '问卷名称 Search111',
  `exampaper_date` int(11) NOT NULL COMMENT '时长(分钟)',
  `exampaper_jieshuyu` varchar(255) DEFAULT NULL COMMENT '结束语',
  `exampaper_types` int(11) NOT NULL DEFAULT '0' COMMENT '问卷状态 Search111',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='问卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`exampaper_name`,`exampaper_date`,`exampaper_jieshuyu`,`exampaper_types`,`create_time`) values (2,'《永劫无间》调查问卷',60,'非常感谢您的参与！希望您能够继续关注《永劫无间》的游戏以及周边产品哦！',1,'2022-03-13 10:09:07'),(3,'问卷2',100,'感谢您的参与',1,'2022-03-15 11:56:25');

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int(20) NOT NULL COMMENT '所属问卷id（外键）',
  `examquestion_name` varchar(200) NOT NULL COMMENT '试题名称 Search111',
  `examquestion_options` longtext COMMENT '选项',
  `examquestion_types` int(20) DEFAULT '0' COMMENT '试题类型',
  `examquestion_sequence` int(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`exampaper_id`,`examquestion_name`,`examquestion_options`,`examquestion_types`,`examquestion_sequence`,`create_time`) values (20,2,'您对于《永劫无间》这款游戏的体验程度是？','[{\"text\":\"玩过\",\"code\":\"A\"},{\"text\":\"没玩过但看过直播/录播\",\"code\":\"B\"},{\"text\":\"其他\",\"code\":\"C\"}]',1,1,'2022-03-13 10:09:07'),(21,2,'您比较喜欢下列哪些种类的游戏？','[{\"text\":\"卡牌类（炉石传说、明日方舟，皇室战争）\",\"code\":\"A\"},{\"text\":\"养成类（宝可梦，奇迹暖暖，阴阳师）\",\"code\":\"B\"},{\"text\":\"竞速类（qq飞车，跑跑卡丁车等）\",\"code\":\"C\"},{\"text\":\"moba类（王者荣耀，lol，虚荣）\",\"code\":\"D\"}]',2,2,'2022-03-13 10:09:07'),(22,2,'您的年龄段是？','[{\"text\":\"16-18岁\",\"code\":\"A\"},{\"text\":\"19-24岁\",\"code\":\"B\"},{\"text\":\"25-30岁\",\"code\":\"C\"},{\"text\":\"30岁以上\",\"code\":\"D\"}]',1,3,'2022-03-13 10:09:07'),(23,2,'您的性别是？','[{\"text\":\"男\",\"code\":\"A\"},{\"text\":\"女\",\"code\":\"B\"},{\"text\":\"其他\",\"code\":\"C\"}]',1,4,'2022-03-13 10:09:07'),(24,2,'您的职业或身份是？','[{\"text\":\"学生\",\"code\":\"A\"},{\"text\":\"公职人员（教师，医生，公务员等）\",\"code\":\"B\"},{\"text\":\"公司员工（主要是指定期上班的员工等）\",\"code\":\"C\"},{\"text\":\"个体经营者（比如个体经营户，自由插画师等等）\",\"code\":\"D\"}]',1,5,'2022-03-13 10:09:07'),(25,2,'test','[{\"text\":\"测试\",\"code\":\"A\"},{\"text\":\"测试2\",\"code\":\"B\"},{\"text\":\"测试3\",\"code\":\"C\"}]',2,1111,'2022-03-13 10:09:07'),(26,2,'1111111','[{\"text\":\"123\",\"code\":\"A\"},{\"text\":\"321\",\"code\":\"B\"},{\"text\":\"312\",\"code\":\"C\"},{\"text\":\"231\",\"code\":\"D\"}]',2,1111,'2022-03-13 10:09:07'),(27,3,'题目11','[{\"text\":\"答案A\",\"code\":\"A\"},{\"text\":\"答案B\",\"code\":\"B\"},{\"text\":\"C\",\"code\":\"C\"}]',2,1,'2022-03-15 11:57:00');

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '问卷调查编号',
  `yonghu_id` int(20) NOT NULL COMMENT '问卷调查用户',
  `exampaper_id` int(20) NOT NULL COMMENT '所属问卷id（外键）',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '问卷调查时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='问卷调查记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`examrecord_uuid_number`,`yonghu_id`,`exampaper_id`,`insert_time`,`create_time`) values (21,'1638238591293',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(22,'1638239123796',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(23,'1638241520089',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(28,'1638253662630',3,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(29,'1638255075263',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(30,'1638841594276',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(31,'1638842379989',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(32,'1638842537045',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(33,'1644313967343',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(34,'1644314075973',2,2,'2022-03-13 10:09:07','2022-03-13 10:09:07'),(35,'1647316484174',2,2,'2022-03-15 11:54:44','2022-03-15 11:54:44');

/*Table structure for table `examredetails` */

DROP TABLE IF EXISTS `examredetails`;

CREATE TABLE `examredetails` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '问卷编号',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '用户选项',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='答题详情表';

/*Data for the table `examredetails` */

insert  into `examredetails`(`id`,`examredetails_uuid_number`,`yonghu_id`,`examquestion_id`,`examredetails_myanswer`,`create_time`) values (54,'1638238591293',2,24,'A','2022-03-13 10:09:07'),(55,'1638238591293',2,23,'B','2022-03-13 10:09:07'),(56,'1638238591293',2,22,'B','2022-03-13 10:09:07'),(57,'1638238591293',2,21,'A,C','2022-03-13 10:09:07'),(58,'1638238591293',2,20,'B','2022-03-13 10:09:07'),(59,'1638239123796',2,24,'D','2022-03-13 10:09:07'),(60,'1638239123796',2,23,'B','2022-03-13 10:09:07'),(61,'1638239123796',2,22,'D','2022-03-13 10:09:07'),(62,'1638239123796',2,21,'B,C','2022-03-13 10:09:07'),(63,'1638239123796',2,20,'C','2022-03-13 10:09:07'),(64,'1638241520089',2,24,'A','2022-03-13 10:09:07'),(65,'1638241520089',2,23,'C','2022-03-13 10:09:07'),(66,'1638241520089',2,22,'B','2022-03-13 10:09:07'),(67,'1638241520089',2,21,'C','2022-03-13 10:09:07'),(68,'1638241520089',2,20,'B','2022-03-13 10:09:07'),(89,'1638253662630',3,24,'A','2022-03-13 10:09:07'),(90,'1638253662630',3,23,'B','2022-03-13 10:09:07'),(91,'1638253662630',3,22,'C','2022-03-13 10:09:07'),(92,'1638253662630',3,21,'C,D','2022-03-13 10:09:07'),(93,'1638253662630',3,20,'C','2022-03-13 10:09:07'),(94,'1638255075263',2,20,'未作答','2022-03-13 10:09:07'),(95,'1638255075263',2,21,'未作答','2022-03-13 10:09:07'),(96,'1638255075263',2,22,'未作答','2022-03-13 10:09:07'),(97,'1638255075263',2,23,'未作答','2022-03-13 10:09:07'),(98,'1638255075263',2,24,'未作答','2022-03-13 10:09:07'),(99,'1638255075263',2,25,'未作答','2022-03-13 10:09:07'),(100,'1638841594276',2,20,'未作答','2022-03-13 10:09:07'),(101,'1638841594276',2,21,'未作答','2022-03-13 10:09:07'),(102,'1638841594276',2,22,'未作答','2022-03-13 10:09:07'),(103,'1638841594276',2,23,'未作答','2022-03-13 10:09:07'),(104,'1638841594276',2,24,'未作答','2022-03-13 10:09:07'),(105,'1638841594276',2,25,'未作答','2022-03-13 10:09:07'),(106,'1638842379989',2,20,'未作答','2022-03-13 10:09:07'),(107,'1638842379989',2,21,'未作答','2022-03-13 10:09:07'),(108,'1638842379989',2,22,'未作答','2022-03-13 10:09:07'),(109,'1638842379989',2,23,'未作答','2022-03-13 10:09:07'),(110,'1638842379989',2,24,'未作答','2022-03-13 10:09:07'),(111,'1638842379989',2,25,'未作答','2022-03-13 10:09:07'),(112,'1638842537045',2,20,'未作答','2022-03-13 10:09:07'),(113,'1638842537045',2,21,'未作答','2022-03-13 10:09:07'),(114,'1638842537045',2,22,'未作答','2022-03-13 10:09:07'),(115,'1638842537045',2,23,'未作答','2022-03-13 10:09:07'),(116,'1638842537045',2,24,'未作答','2022-03-13 10:09:07'),(117,'1638842537045',2,25,'未作答','2022-03-13 10:09:07'),(118,'1644313967343',2,25,'B,A,C','2022-03-13 10:09:07'),(119,'1644313967343',2,24,'B','2022-03-13 10:09:07'),(120,'1644313967343',2,23,'B','2022-03-13 10:09:07'),(121,'1644313967343',2,22,'A','2022-03-13 10:09:07'),(122,'1644313967343',2,21,'C','2022-03-13 10:09:07'),(123,'1644313967343',2,20,'B','2022-03-13 10:09:07'),(124,'1644314075973',2,25,'B,C,A','2022-03-13 10:09:07'),(125,'1644314075973',2,26,'B,C,D','2022-03-13 10:09:07'),(126,'1644314075973',2,24,'B','2022-03-13 10:09:07'),(127,'1644314075973',2,23,'B','2022-03-13 10:09:07'),(128,'1644314075973',2,22,'D','2022-03-13 10:09:07'),(129,'1644314075973',2,21,'C','2022-03-13 10:09:07'),(130,'1644314075973',2,20,'C','2022-03-13 10:09:07'),(131,'1647316484174',2,25,'A,B,C','2022-03-15 11:54:49'),(132,'1647316484174',2,26,'A,B','2022-03-15 11:54:51'),(133,'1647316484174',2,24,'B','2022-03-15 11:54:53'),(134,'1647316484174',2,23,'B','2022-03-15 11:54:55'),(135,'1647316484174',2,22,'A','2022-03-15 11:54:57'),(136,'1647316484174',2,21,'B,C','2022-03-15 11:54:59'),(137,'1647316484174',2,20,'B','2022-03-15 11:55:01');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '新闻资讯名称  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '新闻类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '新闻资讯图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '新闻资讯时间',
  `news_content` text COMMENT '新闻资讯详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 show1 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='新闻资讯';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'新闻资讯2',2,'http://localhost:8080/zaixianwenjuandiaocha/upload/1638238932640.jpg','2022-03-13 10:09:07','<p><span style=\"color: rgb(96, 98, 102);\">新闻资讯22</span></p>','2022-03-13 10:09:07'),(2,'新闻资讯1',1,'http://localhost:8080/zaixianwenjuandiaocha/upload/1638238915744.jpg','2022-03-13 10:09:07','<p><span style=\"color: rgb(96, 98, 102);\">新闻资讯11</span></p>','2022-03-13 10:09:07');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','ybth5yn3avq3l79iop0vw9pg9nab3joo','2022-03-13 10:09:07','2022-03-15 12:55:26'),(2,2,'111','yonghu','用户','qlgk1twkj28cx83wvazgda5rpbsv459i','2022-03-13 10:09:07','2022-03-15 12:57:24'),(3,3,'222','yonghu','用户','926z8cwu8q8wljpmgj65wsytzybxrbnx','2022-03-13 10:09:07','2022-03-13 10:09:07');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-03-13 10:09:07');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名  Search111',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`sex_types`,`yonghu_id_number`,`yonghu_phone`,`yonghu_photo`,`create_time`) values (2,'a1','123456','用户1',1,'410882199211261544','17785544961','http://localhost:8080/zaixianwenjuandiaocha/upload/1638238202964.jpg','2022-03-13 10:09:07'),(3,'a2','123456','用户2',1,'410882198911261244','17785596968','http://localhost:8080/zaixianwenjuandiaocha/upload/1638253648945.jpg','2022-03-13 10:09:07');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
