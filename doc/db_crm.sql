/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.1.49-community : Database - db_crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_crm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `java1707crm`;


/*Table structure for table `customer` */
/*客户实体*/
DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `num` varchar(20) DEFAULT NULL COMMENT '客户编号',
  `name` varchar(20) DEFAULT NULL COMMENT '客户姓名（公司名称',
  `region` varchar(20) DEFAULT NULL COMMENT '客户地区',
  `manager_name` varchar(20) DEFAULT NULL COMMENT '客户经理姓名',
  `level` varchar(30) DEFAULT NULL COMMENT '客户等级',
  `satisfy` varchar(30) DEFAULT NULL COMMENT '客户满意度',
  `credit` varchar(30) DEFAULT NULL COMMENT '客户信用度',
  `address` varchar(500) DEFAULT NULL COMMENT '客户地址',
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `web_site` varchar(20) DEFAULT NULL COMMENT '网址',
  `licence_no` varchar(50) DEFAULT NULL COMMENT '营业执照注册号',
  `legal_person` varchar(20) DEFAULT NULL COMMENT '法人',
  `bankroll` varchar(20) DEFAULT NULL COMMENT '注册资金(万元)',
  `turnover` varchar(20) DEFAULT NULL COMMENT '年营业额',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '开户帐号',
  `local_tax_no` varchar(50) DEFAULT NULL COMMENT '地税登记号',
  `national_tax_no` varchar(50) DEFAULT NULL COMMENT '国税登记号',
  `status` int(11) DEFAULT NULL COMMENT '客户状态 0 正常  1 客户流失',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`id`,`num`,`name`,`region`,`manager_name`,`level`,`satisfy`,`credit`,`address`,`post_code`,`phone`,`fax`,`web_site`,`licence_no`,`legal_person`,`bankroll`,`turnover`,`bank_name`,`bank_account`,`local_tax_no`,`national_tax_no`,`status`) values (1,'KH21321321','北京大牛科技','北京','小张','战略合作伙伴','☆☆☆','☆☆☆','北京海淀区双榆树东里15号','100027','010-62263393','010-62263393','www.daniu.com','420103000057404','张三','1000','5000','中国银行 ','6225231243641','4422214321321','4104322332',0),(16,'KH20150526073022','风驰科技','北京','小红','大客户','☆','☆','321','21','321','321','321','321','321','','21','321','321','321','3213',1),(17,'KH20150526073023','巨人科技',NULL,'小丽','普通客户',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(18,'KH20150526073024','新人科技',NULL,NULL,'重点开发客户',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'KH20150526073025','好人集团',NULL,NULL,'合作伙伴',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'KH20150526073026','新浪',NULL,NULL,'大客户',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'KH20150526073027','百度',NULL,NULL,'大客户',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'KH20150729090910','12','南京','小张','战略合作伙伴','☆☆☆☆☆','☆☆☆☆☆','62','22','32','42','52','112','722','122','82','102','92','132','142',1);

/*Table structure for table `customer_contact` */
/*客户交往记录*/
DROP TABLE IF EXISTS `customer_contact`;

CREATE TABLE `customer_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `customer_id` int(11) DEFAULT NULL COMMENT '所属客户id',
  `time` date DEFAULT NULL COMMENT '交往时间',
  `address` varchar(500) DEFAULT NULL COMMENT '交往地点',
  `overview` varchar(100) DEFAULT NULL COMMENT '概要',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `customer_contact` */

insert  into `customer_contact`(`id`,`customer_id`,`time`,`address`,`overview`) values (1,1,'2015-05-14','1','2'),(2,1,'2015-05-06','12','22'),(3,1,'2015-08-22','珠江路2','吃饭2');

/*Table structure for table `customer_linkman` */
/*客户公司联系人*/
DROP TABLE IF EXISTS `customer_linkman`;

CREATE TABLE `customer_linkman` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `customer_id` int(11) DEFAULT NULL COMMENT '所属客户',
  `link_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `gender` varchar(20) DEFAULT NULL COMMENT '性别',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `office_phone` varchar(50) DEFAULT NULL COMMENT '办公电话',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `customer_linkman` */

insert  into `customer_linkman`(`id`,`customer_id`,`link_name`,`gender`,`position`,`office_phone`,`phone`) values (1,1,'1','男','321','321','21321'),(2,1,'2','女','21','321','321'),(4,1,'3','女','4','5','6'),(5,1,'33','男','44','55','66'),(6,1,'张三','男','经理','21321','32132121'),(7,1,'是','女','发送','2321','321321'),(10,1,'da','女','s','fd','fda');

/*Table structure for table `customer_loss` */
/*客户流失表*/
DROP TABLE IF EXISTS `customer_loss`;

CREATE TABLE `customer_loss` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `customer_no` varchar(40) DEFAULT NULL COMMENT '客户编号',
  `customer_name` varchar(20) DEFAULT NULL COMMENT '客户名称',
  `customer_manager` varchar(20) DEFAULT NULL COMMENT '客户经理',
  `last_order_time` date DEFAULT NULL COMMENT '上次下单日期',
  `confirm_loss_time` date DEFAULT NULL COMMENT '确认流失日期',
  `status` int(11) DEFAULT NULL COMMENT '状态 0 暂缓流失 1 确认流失',
  `loss_reason` varchar(1000) DEFAULT NULL COMMENT '流失原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `customer_loss` */

insert  into `customer_loss`(`id`,`customer_no`,`customer_name`,`customer_manager`,`last_order_time`,`confirm_loss_time`,`status`,`loss_reason`) values (9,'KH20150526073022','风驰科技','小红','2014-03-02','2015-08-21',1,'客户公司倒闭！'),(10,'KH20150526073023','巨人科技','小丽','2014-02-03',NULL,0,NULL),(11,'KH20150729090910','12','小张',NULL,NULL,0,NULL);


/*Table structure for table `customer_loss_measure` */
/*客户流失暂缓措施*/
DROP TABLE IF EXISTS `customer_loss_measure`;

CREATE TABLE `customer_loss_measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `loss_id` int(11) DEFAULT NULL COMMENT '客户流失表id',
  `measure` varchar(500) DEFAULT NULL COMMENT '暂缓措施',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `customer_loss_measure` */

insert  into `customer_loss_measure`(`id`,`loss_id`,`measure`) values (1,9,'ss2'),(3,10,'111'),(4,9,'打电话咨询客户'),(5,9,'请吃饭');

/*Table structure for table `customer_service` */
/*客户服务*/
DROP TABLE IF EXISTS `customer_service`;

CREATE TABLE `customer_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `service_type` varchar(30) DEFAULT NULL COMMENT '服务类型 1,咨询 2，建议 3，投诉',
  `overview` varchar(500) DEFAULT NULL COMMENT '概要',
  `customer` varchar(30) DEFAULT NULL COMMENT '客户',
  `status` varchar(20) DEFAULT NULL COMMENT '1，新创建 2，已分配 3，已处理 4，已归档',
  `service_request` varchar(500) DEFAULT NULL COMMENT '服务请求',
  `create_people` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `assigner` varchar(100) DEFAULT NULL COMMENT '分配人',
  `assign_time` datetime DEFAULT NULL COMMENT '分配日期',
  `service_deal` varchar(500) DEFAULT NULL COMMENT '服务处理描述',
  `service_deal_people` varchar(20) DEFAULT NULL COMMENT '服务处理人',
  `service_deal_time` datetime DEFAULT NULL COMMENT '编号',
  `service_deal_result` varchar(500) DEFAULT NULL COMMENT '编号',
  `satisfy` varchar(50) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `customer_service` */

insert  into `customer_service`(`id`,`service_type`,`overview`,`customer`,`status`,`service_request`,`create_people`,`create_time`,`assigner`,`assign_time`,`service_deal`,`service_deal_people`,`service_deal_time`,`service_deal_result`,`satisfy`) values (1,'咨询','咨询下Think pad价格','大浪技术','已归档','。。。测试','Jack','2015-06-03 00:00:00','小红','2015-06-03 00:00:00','s','Jack','2015-06-04 00:00:00','OK','☆☆☆☆'),(2,'咨询','321','1','已归档','321','Jack','2015-06-03 00:00:00',NULL,NULL,'sss','Jack','2015-06-04 00:00:00','OK','☆☆☆'),(3,'咨询','21','21','已归档','1','Jack','2015-06-03 00:00:00','小红','2015-06-03 00:00:00','sds','Jack','2015-06-04 00:00:00','OK','☆☆☆☆'),(6,'咨询','321','21','已归档','321','Jack','2015-06-03 00:00:00','小红','2015-06-04 00:00:00','ds','Jack','2015-06-04 00:00:00','OK','☆☆☆'),(7,'咨询','s','222','已归档','ss','Jack','2015-06-04 00:00:00','小明','2015-06-04 00:00:00','ss','Jack','2015-06-04 00:00:00','OK','☆☆'),(8,'建议','4','3','已处理','5','Jack','2015-06-04 00:00:00','小张','2015-06-04 00:00:00','111','Jack','2015-06-04 00:00:00',NULL,NULL),(9,'投诉','2','1','已归档','3','Jack','2015-06-04 00:00:00','小明','2015-06-04 00:00:00','333','Jack','2015-06-04 00:00:00','OK','☆☆☆☆☆'),(10,'建议','32','32','新创建','32','Jack','2015-06-04 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'建议','21','21','已归档','21','Jack','2015-06-04 00:00:00','小明','2015-06-11 00:00:00','fds','Jack','2015-06-11 00:00:00','d','☆☆☆'),(12,'建议','fda','大牛科技','已归档','fda','Jack','2015-06-10 00:00:00','小红','2015-06-10 00:00:00','fda','Jack','2015-06-10 00:00:00','good','☆☆☆☆☆'),(13,'咨询','咨询下Think pad价格。。','大众科技','已归档','发达龙卷风大。。。。','Jack','2015-06-11 00:00:00','小红','2015-06-11 00:00:00','。。。\r\n1，2\r\n，3。。。','Jack','2015-06-11 00:00:00','OK','☆☆☆☆☆'),(14,'咨询','11','sss','新创建','22','Jack','2015-08-24 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'咨询','问下think pad xx型号 多少钱？','大牛科技',NULL,'xxxx.\r\nxxx.\r\nxxxxx\r\n嗯。','Jack','2015-08-25 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'投诉','垃圾电脑，刚用就坏。','牛逼科技','已归档','嘻嘻嘻\r\n范德萨','Jack','2015-08-25 00:00:00','小明','2015-08-27 00:00:00','进行了....客户交流。。。\r\n','Jack','2015-08-31 00:00:00','OK','☆☆☆☆☆');

/*Table structure for table `data_dic` */

/*数据字典实体类*/
DROP TABLE IF EXISTS `data_dic`;

CREATE TABLE `data_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `data_dic_name` varchar(50) DEFAULT NULL COMMENT '数据字典名称',
  `data_dic_value` varchar(50) DEFAULT NULL COMMENT '数据字典值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `datadic` */

insert  into `data_dic`(`id`,`data_dic_name`,`data_dic_value`) values (1,'客户等级','普通客户'),(2,'客户等级','重点开发客户'),(3,'客户等级','大客户'),(4,'客户等级','合作伙伴'),(5,'客户等级','战略合作伙伴'),(6,'服务类型','咨询'),(7,'服务类型','建议'),(8,'服务类型','投诉');

/*Table structure for table `customer_order` */
/*订单表*/
DROP TABLE IF EXISTS `customer_order`;

CREATE TABLE `customer_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `customer_id` int(11) DEFAULT NULL COMMENT '所属客户id',
  `order_no` varchar(40) DEFAULT NULL COMMENT '订单号',
  `order_date` date DEFAULT NULL COMMENT '订购日期',
  `address` varchar(200) DEFAULT NULL COMMENT '送货地址',
  `status` int(11) DEFAULT NULL COMMENT '状态 0 未回款 1 已回款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `customer_order` */

insert  into `customer_order`(`id`,`customer_id`,`order_no`,`order_date`,`address`,`status`) values (1,1,'DD11213','2015-07-01','11',0),(2,16,'DD11212','2014-03-02','22',1),(3,16,'DD21321','2014-02-02','22',1),(4,17,'DD2121','2014-02-03','ss',1);


/*Table structure for table `order_details` */
/*订单项*/
DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` int(11) DEFAULT NULL COMMENT '所属订单',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `price` float DEFAULT NULL COMMENT '价格',
  `sum` float DEFAULT NULL COMMENT '总金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `order_details` */

insert  into `order_item`(`id`,`order_id`,`product_name`,`product_num`,`unit`,`price`,`sum`) values (1,1,'联想笔记本',2,'台',4900,9800),(2,1,'惠普音响',4,'台',200,800),(3,2,'罗技键盘',10,'个',90,900),(4,3,'艾利鼠标',20,'个',20,400),(5,3,'东芝U盘',5,'个',105,525),(6,4,'充电器',1,'个',30,30);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

/*产品实体*/
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(300) DEFAULT NULL COMMENT '产品名称',
  `model` varchar(150) DEFAULT NULL COMMENT '型号',
  `unit` varchar(60) DEFAULT NULL COMMENT '单位',
  `price` float DEFAULT NULL COMMENT '价格',
  `stock` double DEFAULT NULL COMMENT '库存',
  `remark` varchar(3000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`model`,`unit`,`price`,`stock`,`remark`) values (1,'联想笔记本','Y450','台',4500,120,'好');

/*Table structure for table `sale_chance` */
/*销售机会实体*/
DROP TABLE IF EXISTS `sale_chance`;

CREATE TABLE `sale_chance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `chance_source` varchar(300) DEFAULT NULL COMMENT '机会来源',
  `customer_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `success_rate` int(11) DEFAULT NULL COMMENT '成功几率',
  `overview` varchar(300) DEFAULT NULL COMMENT '概要',
  `link_man` varchar(100) DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `description` varchar(1000) DEFAULT NULL COMMENT '机会描述',
  `create_man` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `assign_man` varchar(100) DEFAULT NULL COMMENT '指派人',
  `assign_time` datetime DEFAULT NULL COMMENT '指派时间',
  `status` int(11) DEFAULT NULL COMMENT '分配状态 0 未分配 1 已分配',
  `dev_result` int(11) DEFAULT NULL COMMENT '客户开发状态 0 未开发 1 开发中 2 开发成功 3 开发失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `sale_chance` */

insert  into `sale_chance`(`id`,`chance_source`,`customer_name`,`success_rate`,`overview`,`link_man`,`link_phone`,`description`,`create_man`,`create_time`,`assign_man`,`assign_time`,`status`,`dev_result`) values (1,'主动来找的','风软科技',100,'采购笔记本意向','张先生','137234576543','。。。','Jack','2014-01-01 00:00:00','3','2015-05-24 16:15:00',1,3),(2,'','1',12,'','','','','12',NULL,'3','2015-05-25 11:21:00',1,1),(8,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(9,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(10,NULL,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(11,'','10',1,'','','','','321',NULL,'',NULL,0,0),(12,NULL,'11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(13,'','21',1,'','','','','21',NULL,'3',NULL,0,0),(14,'2','1',5,'6','3','4','7','8',NULL,'3',NULL,0,0),(15,'213','112',22,'','','','','221','2013-01-01 11:20:00','3','2013-01-01 11:20:00',1,1),(16,'22','11',55,'66','33','44','77','88','2013-01-01 11:20:00','4','2013-01-01 11:20:00',1,3),(17,'321','121',1,'321','321','213','321','321','2015-05-22 11:23:00','3',NULL,0,0),(18,'321','321',11,'321','321','213','321','Jack','2015-05-22 11:43:00','',NULL,0,0),(19,'321','213',21,'21','21','321','321','Jack','2015-05-24 11:33:00','3','2015-05-24 11:34:00',1,3),(20,'321','213',100,'321','321','321','321','Jack','2015-05-24 11:35:00','',NULL,0,0),(21,'行业介绍','大鸟爱科技',80,'阿凡达深刻理解','张先生','0231-321321','发达放大空间发大水发大水了发','Jack','2015-06-10 16:32:00','4','2015-06-10 16:33:00',1,3),(22,'同行介绍','鸟人科技',90,'采购IBM服务器意向','张三','2321321321',',...','Jack','2015-06-11 08:35:00','5','2015-06-11 08:36:00',1,2);

/*Table structure for table `cus_dev_plan` */
/*客户开发计划实体*/
DROP TABLE IF EXISTS `cus_dev_plan`;

CREATE TABLE `cus_dev_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sale_chance_id` int(11) DEFAULT NULL COMMENT '销售机会',
  `plan_item` varchar(100) DEFAULT NULL COMMENT '计划项',
  `plan_date` date DEFAULT NULL COMMENT '计划日期',
  `exe_affect` varchar(100) DEFAULT NULL COMMENT '执行效果',
  PRIMARY KEY (`id`),
  KEY `FK_t_cus_dev_plan` (`sale_chance_id`),
  CONSTRAINT `FK_t_cus_dev_plan` FOREIGN KEY (`sale_chance_id`) REFERENCES `sale_chance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `cus_dev_plan` */

insert  into `cus_dev_plan`(`id`,`sale_chance_id`,`plan_item`,`plan_date`,`exe_affect`) values (6,16,'2121','2015-05-28',''),(7,16,'21121','2015-05-19',''),(8,19,'21','2015-05-28',''),(9,2,'1','2015-05-27','2'),(10,2,'2','2015-05-28',''),(11,21,'好','2015-06-09','额'),(12,22,'联系客户，介绍产品','2015-06-01','有点效果'),(13,22,'请客户吃饭，洽谈','2015-06-07','成功了'),(14,15,'洽谈','2015-06-09','可以'),(24,1,'213','2015-07-14','321');


/*Table structure for table `user` */
/* 用户表*/
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `true_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(30) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名称 系统管理员 销售主管 客户经理 高管',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`true_name`,`email`,`phone`,`role_name`) values (1,'java1234','123','Jack','java1234@qq.com','123456789','系统管理员'),(2,'json1234','123','Json','json@qq.com','232132121','销售主管'),(3,'xiaoming','123','小明','khjl01@qq.com','2321321','客户经理'),(4,'xiaohong','123','小红','khjl02@qq.com','21321','客户经理'),(5,'xiaozhang','123','小张','khjl03@qq.com','3242323','客户经理'),(6,'daqian','123','曹大千','gaoguan@qq.com','5434232','高管'),(7,'21','321','321321','321@qq.com','321','系统管理员'),(9,'21','32132','321','321@qq.com','321','销售主管');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
