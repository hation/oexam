/*
MySQL Data Transfer
Source Host: localhost
Source Database: oexam
Target Host: localhost
Target Database: oexam
Date: 2016/12/30 9:42:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `realname` varchar(50) NOT NULL,
  `flag` tinyint(4) NOT NULL COMMENT '0->老师，1->管理员',
  `telephone` varchar(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `sans` varchar(200) DEFAULT NULL,
  `dans` varchar(200) DEFAULT NULL,
  `jans` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
CREATE TABLE `grade` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(100) NOT NULL,
  `pid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `subtime` datetime NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jtest
-- ----------------------------
CREATE TABLE `jtest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `explain` varchar(200) NOT NULL,
  `ans` varchar(5) NOT NULL,
  `aid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for painfo
-- ----------------------------
CREATE TABLE `painfo` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) NOT NULL,
  `endtime` datetime NOT NULL,
  `examtime` datetime NOT NULL,
  `totaltime` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `code` char(5) NOT NULL COMMENT '试题码',
  `aid` int(11) NOT NULL COMMENT '老师id',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for paper
-- ----------------------------
CREATE TABLE `paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `sids` varchar(500) DEFAULT NULL,
  `dids` varchar(500) DEFAULT NULL,
  `jids` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `degree` tinyint(4) DEFAULT NULL,
  `intro` text,
  `pic` varchar(60) DEFAULT NULL,
  `studentid` varchar(20) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for test
-- ----------------------------
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tyid` char(2) NOT NULL COMMENT 'd 多选题 s单选题  j填空题',
  `content` varchar(200) NOT NULL,
  `op1` varchar(40) NOT NULL,
  `op2` varchar(40) NOT NULL,
  `op3` varchar(40) NOT NULL,
  `op4` varchar(40) NOT NULL,
  `ans` varchar(40) NOT NULL,
  `aid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `explain` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for type
-- ----------------------------
CREATE TABLE `type` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(40) NOT NULL,
  `aid` int(11) NOT NULL,
  `changetime` datetime NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2016-09-20/57e13b716af8e.gif', '81dc9bdb52d04dc20036dbd8313ed055', '1', '', null);
INSERT INTO `admin` VALUES ('4', '123', 'e10adc3949ba59abbe56e057f20f883e', '2016-12-12/584e8c7e2ad24.jpg', '甘鑫', '0', '15898145017', '331596350@qq.com');
INSERT INTO `answer` VALUES ('10', '10', 'A,B,C,C,C,D', 'ABC,BCD,BCD,BCD,BCD,BCD', 'T,F');
INSERT INTO `grade` VALUES ('10', '18', '78', '7', '2016-12-30 09:40:43');
INSERT INTO `jtest` VALUES ('193', '数据库管理系统（DBMS）是一种应用软件。', '无', 'F', '4', '58');
INSERT INTO `jtest` VALUES ('194', '一个表的主码一定是候选码。', '无', 'T', '4', '58');
INSERT INTO `jtest` VALUES ('195', '在数据库系统中，最小的存取单位是记录。', '无', 'T', '4', '58');
INSERT INTO `jtest` VALUES ('196', '在 E-R 图中，一个联系可以是孤立存在的。', '无', 'F', '4', '58');
INSERT INTO `painfo` VALUES ('77', '手动生成测试试卷', '2016-12-31 09:34:32', '2016-12-30 09:34:32', '10', '58', 'XkYf7', '4');
INSERT INTO `painfo` VALUES ('78', '自动生成测试试卷', '2016-12-31 09:35:11', '2016-12-30 09:35:11', '10', '58', 'eRmEs', '4');
INSERT INTO `paper` VALUES ('66', '77', '4', '592,593,594,595,596,597,598', '599,600,601,602,603,604', '193,194,195,196');
INSERT INTO `paper` VALUES ('67', '78', '4', '592,594,595,596,597,598', '599,600,601,602,603,604', '195,196');
INSERT INTO `student` VALUES ('18', '甘鑫', '202cb962ac59075b964b07152d234b70', '0', '2016-12-07', '3', '个性签名', '2016-12-12/584e7aad685c7.jpg', '14110100123');
INSERT INTO `student` VALUES ('19', '123', '202cb962ac59075b964b07152d234b70', '0', '2016-12-03', '2', 'sssss', '2016-12-14/585106988000d.jpg', '14110100123');
INSERT INTO `student` VALUES ('20', '222', '202cb962ac59075b964b07152d234b70', '0', '2016-12-14', '3', 'ss', '2016-12-14/585106e605686.jpg', '14110100123');
INSERT INTO `test` VALUES ('592', 's', '32位微型计算机中乘除法部件位于（  ）中。', 'CPU', '接口', '检测器', '专用芯片', 'A', '4', '58', '乘除法部件属于运算器部位，而运算器是cpu的重要组成部件');
INSERT INTO `test` VALUES ('593', 's', '计算机中一次能处理的最大二进制位数称为（）', '位', '字节', '字长', '代码', 'C', '4', '58', '字长是由计算机数据线的条数决定的，一条数据线可以读写一位数据，数据线的条数就决定了计算机中一次能处理的最大二进制位数');
INSERT INTO `test` VALUES ('594', 's', '微型机计算机的发展以（）技术为指标', '操作系统', '微处理器', '磁盘', '软件', 'B', '4', '58', '无');
INSERT INTO `test` VALUES ('595', 's', 'CPU中不包含（）', '存储器', '运算器', '寄存器', '控制器', 'A', '4', '58', '无');
INSERT INTO `test` VALUES ('596', 's', '二进制1001101B的十进制表示为（）', '4DH', '95D', '77D', '9AD', 'D', '4', '58', '无');
INSERT INTO `test` VALUES ('597', 's', '某存储器芯片的存储容量为8K*1位，则它的地址线和数据线引脚相加的和为（）', '11', '12', '13', '14', 'D', '4', '58', '8K*1即2^13*1(位)，因此地址线位13条，数据线为1条，一条信号线对应一个芯片的引脚，引脚总和即为信号线的总和。');
INSERT INTO `test` VALUES ('598', 's', 'Cache的速度应比从主存储器取数据的速度()', '快', '稍慢', '慢', '相等', 'A', '4', '58', 'Cache的作用是为了提高存取速度，肯定要比主存速度快');
INSERT INTO `test` VALUES ('599', 'd', '关于MCS-51单片机时序描述正确的有', '若外接晶振频率为12MHz，则每秒钟有12M个时钟周期', '1个机器周期等于12个时钟周期', '指令周期为整数个机器周期，指令不同，指令周期也不近相同', ' 指令周期为整数个机器周期，指令虽不同，指令周期却完全相同', 'ABC', '4', '58', '无');
INSERT INTO `test` VALUES ('600', 'd', '浮点运算指令不属于', '算术运算指令', '逻辑运算指令', '移位操作指令', '特权指令', 'BCD', '4', '58', '无');
INSERT INTO `test` VALUES ('601', 'd', '数据库管理系统的工作包括', '定义数据库', '对已定义的数据库进行管理', '数据通信 ', '为定义的数据库提供操作系统', 'ABC', '4', '58', '无');
INSERT INTO `test` VALUES ('602', 'd', '关于MCS-51单片机时序描述正确的有', '若外接晶振频率为12MHz，则每秒钟有12M个时钟周期', '1个机器周期等于12个时钟周期', '指令周期为整数个机器周期，指令不同，指令周期也不近相同', ' 指令周期为整数个机器周期，指令虽不同，指令周期却完全相同', 'ABC', '4', '58', '无');
INSERT INTO `test` VALUES ('603', 'd', '浮点运算指令不属于', '算术运算指令', '逻辑运算指令', '移位操作指令', '特权指令', 'BCD', '4', '58', '无');
INSERT INTO `test` VALUES ('604', 'd', '数据库管理系统的工作包括', '定义数据库', '对已定义的数据库进行管理', '数据通信 ', '为定义的数据库提供操作系统', 'ABC', '4', '58', '无');
INSERT INTO `type` VALUES ('58', '测试题库', '4', '2016-12-30 09:34:15');
