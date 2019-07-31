/*
Navicat MySQL Data Transfer

Source Server         : iot-cs
Source Server Version : 50644
Source Host           : 192.168.0.44:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2019-07-31 16:58:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'TASK_10', 'DEFAULT', '0/1 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'TASK_11', 'demo', '0/1 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'TASK_10', 'DEFAULT', null, 'cc.envi.quartz.common.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001963632E656E76692E71756172747A2E656E746974792E4A6F62058D52AC1093A30402000D49000764656C466C61674C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000863726561746542797400104C6A6176612F6C616E672F4C6F6E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000967726F75704E616D6571007E00094C00056A6F62496471007E000A4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00094C0008757064617465427971007E000A4C000A75706461746554696D6571007E000B787000000000740008746573745461736B707372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C473160507874000D302F31202A202A202A202A203F707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000A7400057465737431740000740006E6B58BE8AF957400013170707800);
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'TASK_10', 'test', null, 'cc.envi.quartz.common.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001963632E656E76692E71756172747A2E656E746974792E4A6F62058D52AC1093A30402000D49000764656C466C61674C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000863726561746542797400104C6A6176612F6C616E672F4C6F6E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000967726F75704E616D6571007E00094C00056A6F62496471007E000A4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00094C0008757064617465427971007E000A4C000A75706461746554696D6571007E000B787000000000740008746573745461736B7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000087372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C473161977874000D302F31202A202A202A202A203F740004746573747371007E000E000000000000000A7400057465737431740000740006E6B58BE8AF957400013170707800);
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'TASK_11', 'demo', null, 'cc.envi.quartz.common.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001963632E656E76692E71756172747A2E656E746974792E4A6F62058D52AC1093A30402000D49000764656C466C61674C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000863726561746542797400104C6A6176612F6C616E672F4C6F6E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000967726F75704E616D6571007E00094C00056A6F62496471007E000A4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00094C0008757064617465427971007E000A4C000A75706461746554696D6571007E000B787000000000740008746573745461736B7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000087372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C473AB98B7874000D302F31202A202A202A202A203F74000464656D6F7371007E000E000000000000000B740004746573747400146869207468697320697320746573742064656D6F74000A64656D6FE6B58BE8AF957400013170707800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'BIZJ63QEC6654IN1564562885066', '1564563497686', '10000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'TASK_10', 'DEFAULT', 'TASK_10', 'test', null, '1564562649000', '1564562648000', '5', 'PAUSED', 'CRON', '1564562514000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'TASK_11', 'demo', 'TASK_11', 'demo', null, '1564563292000', '1564563291000', '5', 'PAUSED', 'CRON', '1564563126000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) NOT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '开发部', '1', '2019-06-14 20:56:41', null);
INSERT INTO `sys_dept` VALUES ('2', '1', '开发一部', '1', '2019-06-14 20:58:46', null);
INSERT INTO `sys_dept` VALUES ('3', '1', '开发二部', '2', '2019-06-14 20:58:56', null);
INSERT INTO `sys_dept` VALUES ('4', '0', '采购部', '2', '2019-06-14 20:59:56', null);
INSERT INTO `sys_dept` VALUES ('5', '0', '财务部', '3', '2019-06-14 21:00:08', null);
INSERT INTO `sys_dept` VALUES ('6', '0', '销售部', '4', '2019-06-14 21:00:15', null);
INSERT INTO `sys_dept` VALUES ('7', '0', '工程部', '5', '2019-06-14 21:00:42', null);
INSERT INTO `sys_dept` VALUES ('8', '0', '行政部', '6', '2019-06-14 21:00:49', null);
INSERT INTO `sys_dept` VALUES ('9', '0', '人力资源部', '8', '2019-06-14 21:01:14', '2019-06-14 21:01:34');
INSERT INTO `sys_dept` VALUES ('10', '0', '系统部', '7', '2019-06-14 21:01:31', null);

-- ----------------------------
-- Table structure for sys_eximport
-- ----------------------------
DROP TABLE IF EXISTS `sys_eximport`;
CREATE TABLE `sys_eximport` (
  `FIELD1` varchar(20) NOT NULL COMMENT '字段1',
  `FIELD2` int(11) NOT NULL COMMENT '字段2',
  `FIELD3` varchar(100) NOT NULL COMMENT '字段3',
  `CREATE_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Excel导入导出测试';

-- ----------------------------
-- Records of sys_eximport
-- ----------------------------
INSERT INTO `sys_eximport` VALUES ('字段1', '1', 'mrbird0@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '2', 'mrbird1@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '3', 'mrbird2@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '4', 'mrbird3@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '5', 'mrbird4@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '6', 'mrbird5@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '7', 'mrbird6@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '8', 'mrbird7@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '9', 'mrbird8@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '10', 'mrbird9@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '11', 'mrbird10@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '12', 'mrbird11@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '13', 'mrbird12@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '14', 'mrbird13@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '15', 'mrbird14@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '16', 'mrbird15@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '17', 'mrbird16@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '18', 'mrbird17@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '19', 'mrbird18@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `sys_eximport` VALUES ('字段1', '20', 'mrbird19@gmail.com', '2019-06-13 03:14:06');

-- ----------------------------
-- Table structure for sys_generator_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_generator_config`;
CREATE TABLE `sys_generator_config` (
  `id` int(11) NOT NULL COMMENT '主键',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `base_package` varchar(50) NOT NULL COMMENT '基础包名',
  `entity_package` varchar(20) NOT NULL COMMENT 'entity文件存放路径',
  `mapper_package` varchar(20) NOT NULL COMMENT 'mapper文件存放路径',
  `mapper_xml_package` varchar(20) NOT NULL COMMENT 'mapper xml文件存放路径',
  `service_package` varchar(20) NOT NULL COMMENT 'servcie文件存放路径',
  `service_impl_package` varchar(20) NOT NULL COMMENT 'serviceImpl文件存放路径',
  `controller_package` varchar(20) NOT NULL COMMENT 'controller文件存放路径',
  `is_trim` char(1) NOT NULL COMMENT '是否去除前缀 1是 0否',
  `trim_value` varchar(10) DEFAULT NULL COMMENT '前缀内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成配置表';

-- ----------------------------
-- Records of sys_generator_config
-- ----------------------------
INSERT INTO `sys_generator_config` VALUES ('1', 'MrBird', 'cc.mrbird.febs.gen', 'entity', 'mapper', 'mapper', 'service', 'service.impl', 'controller', '1', 't_');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `JOB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `GROUP_NAME` varchar(255) NOT NULL DEFAULT '' COMMENT '任务分组名称',
  `CRON_EXPRESSION` varchar(100) NOT NULL COMMENT 'cron表达式',
  `STATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务状态  0：正常  1：暂停',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_BY` bigint(20) NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` bigint(20) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `DEL_FLAG` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识（0：正常；1：删除）',
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('10', 'testTask', 'test1', '', 'test', '0/1 * * * * ?', '1', '测试', '8', '2019-07-31 16:41:54', null, null, '0');
INSERT INTO `sys_job` VALUES ('11', 'testTask', 'test', 'hi this is test demo', 'demo', '0/1 * * * * ?', '1', 'demo测试', '8', '2019-07-31 16:52:07', null, null, '0');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `JOB_LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint(20) NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `STATUS` char(2) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `ERROR` text COMMENT '失败信息',
  `ELAPSED_TIME` decimal(11,0) DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`JOB_LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=69978 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text COMMENT '操作内容',
  `TIME` decimal(11,0) DEFAULT NULL COMMENT '耗时',
  `METHOD` text COMMENT '操作方法',
  `PARAMS` text COMMENT '方法参数',
  `IP` varchar(64) DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('890', 'MrBird', '修改角色', '1144', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 16:40:57 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 08:40:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('891', 'MrBird', '修改角色', '267', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=75, roleName=可怜, remark=, createTime=null, modifyTime=Thu Jun 13 16:47:00 CST 2019, menuIds=115)\"', '127.0.0.1', '2019-06-13 08:47:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('892', 'MrBird', '修改角色', '478', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 16:47:15 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 08:47:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('893', 'MrBird', '删除角色', '233', 'cc.mrbird.febs.system.controller.RoleController.deleteRoles()', ' roleIds: \"75\"', '127.0.0.1', '2019-06-13 08:47:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('894', 'MrBird', '修改用户', '128', 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=tester, password=null, deptId=6, email=tester@qq.com, mobile=13888888888, status=1, createTime=null, modifyTime=Thu Jun 13 16:56:29 CST 2019, lastLoginTime=null, sex=1, avatar=null, theme=null, isTab=null, description=我是测试用户, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null)\"', '127.0.0.1', '2019-06-13 08:56:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('895', 'MrBird', '修改用户', '323', 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=tester, password=null, deptId=6, email=tester@qq.com, mobile=13888888888, status=1, createTime=null, modifyTime=Thu Jun 13 16:56:36 CST 2019, lastLoginTime=null, sex=0, avatar=null, theme=null, isTab=null, description=我是测试用户, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null)\"', '127.0.0.1', '2019-06-13 08:56:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('896', 'MrBird', '修改菜单/按钮', '172', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 16:57:10 CST 2019)\"', '127.0.0.1', '2019-06-13 08:57:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('897', 'MrBird', '修改菜单/按钮', '164', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=4, parentId=1, menuName=角色管理, url=/system/role, perms=role:view, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 16:57:18 CST 2019)\"', '127.0.0.1', '2019-06-13 08:57:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('898', 'MrBird', '修改菜单/按钮', '81', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=5, parentId=1, menuName=菜单管理, url=/system/menu, perms=menu:view, icon=, type=0, orderNum=3, createTime=null, modifyTime=Thu Jun 13 16:57:33 CST 2019)\"', '127.0.0.1', '2019-06-13 08:57:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('899', 'MrBird', '修改角色', '436', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 16:59:24 CST 2019, menuIds=1,3,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 08:59:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('900', 'MrBird', '修改角色', '329', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 16:59:55 CST 2019, menuIds=1,3,11,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 08:59:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('901', 'MrBird', '修改角色', '270', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:00:39 CST 2019, menuIds=1,3,11,12,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:00:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('902', 'MrBird', '修改角色', '238', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:01:47 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:01:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('903', 'MrBird', '修改角色', '202', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:02:28 CST 2019, menuIds=1,3,11,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:02:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('904', 'MrBird', '修改角色', '446', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:14:28 CST 2019, menuIds=1,3,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:14:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('905', 'MrBird', '修改角色', '150', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:14:47 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:14:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('906', 'MrBird', '修改角色', '88', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:14:55 CST 2019, menuIds=1,3,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:14:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('907', 'MrBird', '修改角色', '177', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:18:58 CST 2019, menuIds=1,3,11,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:18:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('908', 'MrBird', '修改角色', '286', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:22:52 CST 2019, menuIds=1,3,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:22:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('909', 'MrBird', '修改角色', '105', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:23:08 CST 2019, menuIds=1,3,11,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:23:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('910', 'MrBird', '修改角色', '275', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:32:55 CST 2019, menuIds=1,3,11,13,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:32:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('911', 'MrBird', '修改角色', '348', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 18:53:31 CST 2019, menuIds=1,3,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 10:53:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('912', 'MrBird', '修改角色', '114', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 18:53:49 CST 2019, menuIds=1,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 10:53:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('913', 'MrBird', '修改角色', '255', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 18:54:08 CST 2019, menuIds=1,3,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 10:54:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('914', 'MrBird', '修改菜单/按钮', '51', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view啊, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 18:54:28 CST 2019)\"', '127.0.0.1', '2019-06-13 10:54:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('915', 'MrBird', '修改菜单/按钮', '150', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 18:54:46 CST 2019)\"', '127.0.0.1', '2019-06-13 10:54:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('916', 'MrBird', '修改角色', '259', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 18:55:01 CST 2019, menuIds=1,3,11,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 10:55:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('917', 'MrBird', '修改菜单/按钮', '118', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:viewa, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 18:57:57 CST 2019)\"', '127.0.0.1', '2019-06-13 10:57:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('918', 'MrBird', '修改角色', '431', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 19:13:30 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 11:13:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('919', 'MrBird', '修改菜单/按钮', '157', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 19:13:44 CST 2019)\"', '127.0.0.1', '2019-06-13 11:13:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('920', 'MrBird', '修改菜单/按钮', '149', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view, icon=layui-icon-meh, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 19:13:55 CST 2019)\"', '127.0.0.1', '2019-06-13 11:13:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('921', 'MrBird', '修改菜单/按钮', '163', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=2, parentId=0, menuName=系统监控, url=, perms=, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 19:14:34 CST 2019)\"', '127.0.0.1', '2019-06-13 11:14:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('922', 'MrBird', '修改菜单/按钮', '146', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=2, parentId=0, menuName=系统监控, url=, perms=, icon=layui-icon-alert, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 19:20:40 CST 2019)\"', '127.0.0.1', '2019-06-13 11:20:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('923', 'MrBird', '修改角色', '70', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 21:24:53 CST 2019, menuIds=1,3,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 13:24:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('924', 'MrBird', '修改角色', '22', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 21:25:06 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 13:25:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('925', 'MrBird', '修改角色', '60', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，只可查看，不可操作, createTime=null, modifyTime=Thu Jun 13 22:24:09 CST 2019, menuIds=1,3,4,14,5,6,2,8,10,136,113,114,127,128,129,130,131,101,102,109,137,138,139,115,132,133,135,134,126,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 14:24:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('926', 'MrBird', '修改角色', '69', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，只可查看，不可操作, createTime=null, modifyTime=Thu Jun 13 22:24:58 CST 2019, menuIds=1,3,4,5,6,2,8,10,136,113,114,127,128,129,130,131,101,102,109,137,138,139,115,132,133,135,134,126,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 14:24:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('927', 'scott', '新增角色', '5', 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=76, roleName=1341234, remark=, createTime=Thu Jun 13 22:25:21 CST 2019, modifyTime=null, menuIds=)\"', '127.0.0.1', '2019-06-13 14:25:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('928', 'MrBird', '新增菜单/按钮', '7', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=162, parentId=4, menuName=导出角色, url=null, perms=role:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:29:00 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:29:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('929', 'MrBird', '修改菜单/按钮', '9', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=162, parentId=4, menuName=导出Excel, url=null, perms=role:export, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jun 13 22:29:11 CST 2019)\"', '172.18.96.1', '2019-06-13 14:29:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('930', 'MrBird', '新增菜单/按钮', '14', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=163, parentId=5, menuName=导出Excel, url=null, perms=menu:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:29:32 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:29:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('931', 'MrBird', '新增菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=164, parentId=6, menuName=导出Excel, url=null, perms=dept:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:29:58 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:29:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('932', 'MrBird', '修改菜单/按钮', '6', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=8, parentId=2, menuName=在线用户, url=/monitor/online, perms=online:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 22:30:30 CST 2019)\"', '172.18.96.1', '2019-06-13 14:30:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('933', 'MrBird', '修改菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=10, parentId=2, menuName=系统日志, url=/monitor/log, perms=log:view, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 22:30:37 CST 2019)\"', '172.18.96.1', '2019-06-13 14:30:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('934', 'MrBird', '修改菜单/按钮', '17', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=113, parentId=2, menuName=Redis监控, url=/monitor/redis/info, perms=redis:view, icon=, type=0, orderNum=4, createTime=null, modifyTime=Thu Jun 13 22:30:44 CST 2019)\"', '172.18.96.1', '2019-06-13 14:30:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('935', 'MrBird', '修改菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=114, parentId=2, menuName=Redis终端, url=/monitor/redis/terminal, perms=redis:terminal:view, icon=, type=0, orderNum=5, createTime=null, modifyTime=Thu Jun 13 22:30:53 CST 2019)\"', '172.18.96.1', '2019-06-13 14:30:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('936', 'MrBird', '修改菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=139, parentId=137, menuName=代码生成, url=/generator/generator, perms=generator:view, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 22:31:38 CST 2019)\"', '172.18.96.1', '2019-06-13 14:31:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('937', 'MrBird', '新增菜单/按钮', '15', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=165, parentId=138, menuName=修改配置, url=null, perms=configure:config:update, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:32:08 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:32:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('938', 'MrBird', '修改菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=165, parentId=138, menuName=修改配置, url=null, perms=generator:configure:update, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jun 13 22:32:19 CST 2019)\"', '172.18.96.1', '2019-06-13 14:32:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('939', 'MrBird', '新增菜单/按钮', '6', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=166, parentId=139, menuName=生成代码, url=null, perms=generator:generate, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:32:50 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:32:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('940', 'MrBird', '新增菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=167, parentId=125, menuName=模板下载, url=null, perms=eximport:template, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:33:36 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:33:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('941', 'MrBird', '新增菜单/按钮', '16', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=168, parentId=125, menuName=导出Excel, url=null, perms=eximport:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:33:56 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:33:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('942', 'MrBird', '新增菜单/按钮', '4', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=169, parentId=125, menuName=导入Excel, url=null, perms=eximport:import, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:34:19 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:34:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('943', 'MrBird', '新增菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=170, parentId=10, menuName=导出Excel, url=null, perms=log:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:34:55 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:34:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('944', 'MrBird', '新增菜单/按钮', '11', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=171, parentId=136, menuName=删除日志, url=null, perms=loginLog:delete, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:35:26 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:35:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('945', 'MrBird', '修改菜单/按钮', '15', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=136, parentId=2, menuName=登录日志, url=/monitor/loginlog, perms=loginlog:view, icon=, type=0, orderNum=3, createTime=null, modifyTime=Thu Jun 13 22:35:56 CST 2019)\"', '172.18.96.1', '2019-06-13 14:35:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('946', 'MrBird', '修改菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=171, parentId=136, menuName=删除日志, url=null, perms=loginlog:delete, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jun 13 22:36:07 CST 2019)\"', '172.18.96.1', '2019-06-13 14:36:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('947', 'MrBird', '新增菜单/按钮', '11', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=172, parentId=136, menuName=导出Excel, url=null, perms=loginlog:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:36:25 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:36:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('948', 'MrBird', '修改菜单/按钮', '14', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=127, parentId=2, menuName=请求追踪, url=/monitor/httptrace, perms=httptrace:view, icon=, type=0, orderNum=6, createTime=null, modifyTime=Thu Jun 13 22:36:43 CST 2019)\"', '172.18.96.1', '2019-06-13 14:36:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('949', 'MrBird', '修改菜单/按钮', '5', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=129, parentId=128, menuName=JVM信息, url=/monitor/jvm, perms=jvm:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 22:36:50 CST 2019)\"', '172.18.96.1', '2019-06-13 14:36:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('950', 'MrBird', '修改菜单/按钮', '5', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=130, parentId=128, menuName=Tomcat信息, url=/monitor/tomcat, perms=tomcat:view, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 22:36:57 CST 2019)\"', '172.18.96.1', '2019-06-13 14:36:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('951', 'MrBird', '修改菜单/按钮', '13', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=131, parentId=128, menuName=服务器信息, url=/monitor/server, perms=server:view, icon=, type=0, orderNum=3, createTime=null, modifyTime=Thu Jun 13 22:37:03 CST 2019)\"', '172.18.96.1', '2019-06-13 14:37:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('952', 'MrBird', '新增菜单/按钮', '4', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=173, parentId=102, menuName=导出Excel, url=null, perms=job:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:37:24 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:37:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('953', 'MrBird', '新增菜单/按钮', '5', 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=174, parentId=109, menuName=导出Excel, url=null, perms=joblog:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:37:46 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:37:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('954', 'MrBird', '修改菜单/按钮', '7', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=174, parentId=109, menuName=导出Excel, url=null, perms=job:log:export, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jun 13 22:38:02 CST 2019)\"', '172.18.96.1', '2019-06-13 14:38:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('955', 'MrBird', '修改角色', '75', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，只可查看，不可操作, createTime=null, modifyTime=Thu Jun 13 22:39:57 CST 2019, menuIds=1,3,4,5,163,6,2,8,10,136,113,114,127,128,129,130,131,101,102,109,137,138,139,115,132,133,135,134,126,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 14:39:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('956', 'MrBird', '修改角色', '67', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，只可查看，不可操作, createTime=null, modifyTime=Thu Jun 13 22:42:14 CST 2019, menuIds=1,3,4,5,163,6,164,2,8,10,136,113,114,127,128,129,130,131,101,102,109,137,138,139,115,132,133,135,134,126,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 14:42:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('957', 'MrBird', '删除角色', '129', 'cc.mrbird.febs.system.controller.RoleController.deleteRoles()', ' roleIds: \"76\"', '192.168.33.1', '2019-06-14 05:58:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('958', 'MrBird', '修改角色', '242', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Fri Jun 14 14:38:42 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '192.168.33.1', '2019-06-14 06:38:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('959', 'MrBird', '修改用户', '112', 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=tester, password=null, deptId=6, email=tester@qq.com, mobile=13888888888, status=1, createTime=null, modifyTime=Fri Jun 14 15:04:29 CST 2019, lastLoginTime=null, sex=0, avatar=null, theme=null, isTab=null, description=我是测试用户, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=68, roleName=null)\"', '192.168.33.1', '2019-06-14 07:04:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('960', 'MrBird', '修改角色', '768', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=68, roleName=系统监控员, remark=负责系统监控模块, createTime=null, modifyTime=Fri Jun 14 15:05:10 CST 2019, menuIds=2,8,23,10,24,136,113,114,127,128,129,130,131)\"', '192.168.33.1', '2019-06-14 07:05:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('961', 'MrBird', '修改菜单/按钮', '57', 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=6, parentId=1, menuName=部门管理, url=/system/dept, perms=dept:view, icon=, type=0, orderNum=4, createTime=null, modifyTime=Fri Jun 14 19:55:59 CST 2019)\"', '172.18.96.1', '2019-06-14 19:56:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('962', 'MrBird', '修改角色', '77', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限, createTime=null, modifyTime=Fri Jun 14 20:47:47 CST 2019, menuIds=1,3,161,4,14,162,5,17,163,6,20,164,2,8,10,170,136,172,113,114,127,128,129,130,131,101,102,173,109,174,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '172.18.96.1', '2019-06-14 20:47:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('963', 'MrBird', '新增角色', '61', 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=77, roleName=Redis监控员, remark=负责Redis模块, createTime=Fri Jun 14 20:49:21 CST 2019, modifyTime=null, menuIds=2,113,114)\"', '172.18.96.1', '2019-06-14 20:49:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('964', 'MrBird', '新增角色', '66', 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=78, roleName=系统监控员, remark=负责整个系统监控模块, createTime=Fri Jun 14 20:50:06 CST 2019, modifyTime=null, menuIds=2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131)\"', '172.18.96.1', '2019-06-14 20:50:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('965', 'MrBird', '新增角色', '62', 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=79, roleName=跑批人员, remark=负责任务调度跑批模块, createTime=Fri Jun 14 20:51:01 CST 2019, modifyTime=null, menuIds=101,102,103,104,105,106,107,108,173,109,110,174)\"', '172.18.96.1', '2019-06-14 20:51:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('966', 'MrBird', '新增角色', '58', 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=80, roleName=开发人员, remark=拥有代码生成模块的权限, createTime=Fri Jun 14 20:51:25 CST 2019, modifyTime=null, menuIds=137,138,165,139,166)\"', '172.18.96.1', '2019-06-14 20:51:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('967', 'MrBird', '修改角色', '72', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限(●\'◡\'●), createTime=null, modifyTime=Fri Jun 14 20:51:57 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '172.18.96.1', '2019-06-14 20:51:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('968', 'MrBird', '修改角色', '27', 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Jun 14 20:52:14 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '172.18.96.1', '2019-06-14 20:52:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('969', 'MrBird', '新增用户', '20', 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=45, username=Scott, password=1d685729d113cfd03872f154939bee1c, deptId=null, email=scott@gmail.com, mobile=17722222222, status=1, createTime=Fri Jun 14 20:55:52 CST 2019, modifyTime=null, lastLoginTime=null, sex=0, avatar=default.jpg, theme=black, isTab=1, description=我是scott。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null)\"', '172.18.96.1', '2019-06-14 20:55:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('970', 'MrBird', '新增部门', '14', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=7, parentId=0, deptName=开发部, orderNum=1, createTime=Fri Jun 14 20:56:40 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 20:56:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('971', 'MrBird', '新增部门', '17', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=2, parentId=1, deptName=开发一部, orderNum=1, createTime=Fri Jun 14 20:58:46 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 20:58:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('972', 'MrBird', '新增部门', '5', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=3, parentId=1, deptName=开发二部, orderNum=2, createTime=Fri Jun 14 20:58:55 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 20:58:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('973', 'MrBird', '新增部门', '6', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=4, parentId=0, deptName=采购部, orderNum=2, createTime=Fri Jun 14 20:59:55 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 20:59:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('974', 'MrBird', '新增部门', '13', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=5, parentId=0, deptName=财务部, orderNum=3, createTime=Fri Jun 14 21:00:08 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:00:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('975', 'MrBird', '新增部门', '5', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=6, parentId=0, deptName=销售部, orderNum=4, createTime=Fri Jun 14 21:00:15 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:00:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('976', 'MrBird', '新增部门', '5', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=7, parentId=0, deptName=工程部, orderNum=5, createTime=Fri Jun 14 21:00:41 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:00:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('977', 'MrBird', '新增部门', '12', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=8, parentId=0, deptName=行政部, orderNum=6, createTime=Fri Jun 14 21:00:48 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:00:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('978', 'MrBird', '新增部门', '4', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=9, parentId=0, deptName=人力资源部, orderNum=7, createTime=Fri Jun 14 21:01:14 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:01:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('979', 'MrBird', '新增部门', '12', 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=10, parentId=0, deptName=系统部, orderNum=7, createTime=Fri Jun 14 21:01:30 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:01:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('980', 'MrBird', '修改部门', '15', 'cc.mrbird.febs.system.controller.DeptController.updateDept()', ' dept: \"Dept(deptId=9, parentId=0, deptName=人力资源部, orderNum=8, createTime=null, modifyTime=Fri Jun 14 21:01:34 CST 2019)\"', '172.18.96.1', '2019-06-14 21:01:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('981', 'MrBird', '修改用户', '26', 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=2, username=Scott, password=null, deptId=10, email=scott@gmail.com, mobile=17722222222, status=1, createTime=null, modifyTime=Fri Jun 14 21:02:10 CST 2019, lastLoginTime=null, sex=0, avatar=null, theme=null, isTab=null, description=我是scott。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null)\"', '172.18.96.1', '2019-06-14 21:02:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('982', 'MrBird', '新增用户', '15', 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=3, username=Reina, password=1461afff857c02afbfb768aa3771503d, deptId=4, email=Reina@hotmail.com, mobile=17711111111, status=1, createTime=Fri Jun 14 21:07:37 CST 2019, modifyTime=null, lastLoginTime=null, sex=1, avatar=default.jpg, theme=black, isTab=1, description=由于公款私用，已被封禁。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=77, roleName=null)\"', '172.18.96.1', '2019-06-14 21:07:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('983', 'MrBird', '修改用户', '15', 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=3, username=Reina, password=null, deptId=4, email=Reina@hotmail.com, mobile=17711111111, status=0, createTime=null, modifyTime=Fri Jun 14 21:08:48 CST 2019, lastLoginTime=null, sex=1, avatar=null, theme=null, isTab=null, description=由于公款私用，已被封禁。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=77, roleName=null)\"', '172.18.96.1', '2019-06-14 21:08:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('984', 'MrBird', '新增用户', '14', 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=4, username=Micaela, password=9f2daa2c7bed6870fcbb5b9a51d6300e, deptId=10, email=Micaela@163.com, mobile=17733333333, status=1, createTime=Fri Jun 14 21:10:13 CST 2019, modifyTime=null, lastLoginTime=null, sex=0, avatar=default.jpg, theme=black, isTab=1, description=我叫米克拉, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=78, roleName=null)\"', '172.18.96.1', '2019-06-14 21:10:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('985', 'MrBird', '新增用户', '6', 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=5, username=Jana, password=176679b77b3c3e352bd3b30ddc81083e, deptId=8, email=Jana@126.com, mobile=17744444444, status=1, createTime=Fri Jun 14 21:12:16 CST 2019, modifyTime=null, lastLoginTime=null, sex=1, avatar=default.jpg, theme=black, isTab=1, description=大家好，我叫简娜, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=79, roleName=null)\"', '172.18.96.1', '2019-06-14 21:12:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('986', 'MrBird', '新增用户', '63', 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=6, username=Georgie, password=dffc683378cdaa015a0ee9554c532225, deptId=3, email=Georgie@qq.com, mobile=17766666666, status=1, createTime=Fri Jun 14 21:15:09 CST 2019, modifyTime=null, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=生产环境执行rm -rf *，账号封禁中T T, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=80, roleName=null)\"', '172.18.96.1', '2019-06-14 21:15:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('987', 'MrBird', '修改用户', '54', 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=Georgie, password=null, deptId=3, email=Georgie@qq.com, mobile=17766666666, status=1, createTime=null, modifyTime=Fri Jun 14 21:15:44 CST 2019, lastLoginTime=null, sex=2, avatar=null, theme=null, isTab=null, description=生产执行rm -rf *，账号封禁T T, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=80, roleName=null)\"', '172.18.96.1', '2019-06-14 21:15:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('988', 'MrBird', '新增用户', '24', 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=7, username=Margot, password=31379841b9f4bfde22b8b40471e9a6ce, deptId=9, email=Margot@qq.com, mobile=13444444444, status=1, createTime=Fri Jun 14 21:17:52 CST 2019, modifyTime=null, lastLoginTime=null, sex=1, avatar=default.jpg, theme=black, isTab=1, description=大家好我叫玛戈, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=77,78, roleName=null)\"', '172.18.96.1', '2019-06-14 21:17:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('989', 'MrBird', '修改用户', '67', 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=7, username=Margot, password=null, deptId=9, email=Margot@qq.com, mobile=13444444444, status=1, createTime=null, modifyTime=Fri Jun 14 21:18:59 CST 2019, lastLoginTime=null, sex=1, avatar=null, theme=null, isTab=null, description=大家好我叫玛戈, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=78,79,80, roleName=null)\"', '172.18.96.1', '2019-06-14 21:18:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('990', 'admin', '执行定时任务', '78', 'cc.envi.quartz.controller.JobController.runJob()', ' jobIds: \"9\"', '127.0.0.1', '2019-07-31 15:48:02', '');
INSERT INTO `sys_log` VALUES ('991', 'admin', '执行定时任务', '67', 'cc.envi.quartz.controller.JobController.runJob()', ' jobIds: \"9\"', '127.0.0.1', '2019-07-31 15:49:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('992', 'admin', '恢复定时任务', '233', 'cc.envi.quartz.controller.JobController.resumeJob()', ' jobIds: \"9\"', '127.0.0.1', '2019-07-31 15:53:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('993', 'admin', '暂停定时任务', '37', 'cc.envi.quartz.controller.JobController.pauseJob()', ' jobIds: \"9\"', '127.0.0.1', '2019-07-31 15:54:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('994', 'admin', '暂停定时任务', '72', 'cc.envi.quartz.controller.JobController.pauseJob()', ' jobIds: \"9\"', '127.0.0.1', '2019-07-31 16:25:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('995', 'admin', '删除定时任务', '38', 'cc.envi.quartz.controller.JobController.deleteJob()', ' jobIds: \"9\"', '127.0.0.1', '2019-07-31 16:26:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('996', 'admin', '新增定时任务', '13504', 'cc.envi.quartz.controller.JobController.addJob()', ' job: \"Job(jobId=10, beanName=testTask, methodName=test1, groupName=test, params=, cronExpression=0/1 * * * * ?, status=1, remark=测试, createTime=Wed Jul 31 16:41:54 CST 2019, updateTime=null, createBy=8, updateBy=null, delFlag=0, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-07-31 16:42:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('997', 'admin', '恢复定时任务', '65', 'cc.envi.quartz.controller.JobController.resumeJob()', ' jobIds: \"10\"', '127.0.0.1', '2019-07-31 16:42:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('998', 'admin', '暂停定时任务', '17', 'cc.envi.quartz.controller.JobController.pauseJob()', ' jobIds: \"10\"', '127.0.0.1', '2019-07-31 16:44:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('999', 'admin', '新增定时任务', '68', 'cc.envi.quartz.controller.JobController.addJob()', ' job: \"Job(jobId=11, beanName=testTask, methodName=test, groupName=demo, params=hi this is test demo, cronExpression=0/1 * * * * ?, status=1, remark=demo测试, createTime=Wed Jul 31 16:52:06 CST 2019, updateTime=null, createBy=8, updateBy=null, delFlag=0, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-07-31 16:52:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('1000', 'admin', '恢复定时任务', '65', 'cc.envi.quartz.controller.JobController.resumeJob()', ' jobIds: \"11\"', '127.0.0.1', '2019-07-31 16:54:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES ('1001', 'admin', '暂停定时任务', '41', 'cc.envi.quartz.controller.JobController.pauseJob()', ' jobIds: \"11\"', '127.0.0.1', '2019-07-31 16:54:52', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `USERNAME` varchar(50) NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(50) DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `SYSTEM` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `BROWSER` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('3', 'mrbird', '2019-06-11 06:50:22', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('4', 'mrbird', '2019-06-11 06:54:15', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('5', 'mrbird', '2019-06-11 07:15:41', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('6', 'mrbird', '2019-06-12 00:46:00', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('7', 'mrbird', '2019-06-12 03:47:35', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('8', 'mrbird', '2019-06-12 06:03:49', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('9', 'mrbird', '2019-06-12 07:29:52', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('10', 'mrbird', '2019-06-12 09:16:05', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('11', 'mrbird', '2019-06-12 12:35:17', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('12', 'mrbird', '2019-06-12 12:38:21', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('13', 'mrbird', '2019-06-12 12:40:04', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('14', 'mrbird', '2019-06-12 15:34:34', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('15', 'mrbird', '2019-06-13 01:03:01', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('16', 'mrbird', '2019-06-13 05:45:25', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('17', 'mrbird', '2019-06-13 08:00:07', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('18', 'mrbird', '2019-06-13 08:07:23', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('19', 'mrbird', '2019-06-13 08:12:43', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('20', 'mrbird', '2019-06-13 08:15:32', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('21', 'nikki', '2019-06-13 08:30:36', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('22', 'mrbird', '2019-06-13 08:31:12', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('23', 'nikki', '2019-06-13 08:31:53', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('24', 'mrbird', '2019-06-13 08:32:21', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('25', 'mrbird', '2019-06-13 09:01:03', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('26', 'mrbird', '2019-06-13 09:19:38', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('27', 'mrbird', '2019-06-13 09:22:34', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('28', 'mrbird', '2019-06-13 10:52:53', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('29', 'mrbird', '2019-06-13 11:14:19', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('30', 'mrbird', '2019-06-13 13:08:44', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('31', 'mrbird', '2019-06-13 13:11:23', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('32', 'mrbird', '2019-06-13 13:18:40', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('33', 'mrbird', '2019-06-13 13:21:11', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('34', 'mrbird', '2019-06-13 13:24:34', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('35', 'scott', '2019-06-13 14:18:20', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('36', 'scott', '2019-06-13 14:19:16', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Firefox 62');
INSERT INTO `sys_login_log` VALUES ('37', 'scott', '2019-06-13 14:20:47', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('38', 'scott', '2019-06-13 14:24:34', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('39', 'scott', '2019-06-13 14:25:14', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('40', 'scott', '2019-06-13 14:26:21', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('41', 'scott', '2019-06-13 14:40:18', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('42', 'scott', '2019-06-13 14:42:33', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'IE 11');
INSERT INTO `sys_login_log` VALUES ('43', 'mrbird', '2019-06-14 05:54:19', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('44', 'scott', '2019-06-14 06:11:16', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'MSIE 7');
INSERT INTO `sys_login_log` VALUES ('45', 'nikki', '2019-06-14 07:03:48', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'MSIE 7');
INSERT INTO `sys_login_log` VALUES ('46', 'nikki', '2019-06-14 07:04:41', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'MSIE 7');
INSERT INTO `sys_login_log` VALUES ('47', 'nikki', '2019-06-14 07:06:15', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'MSIE 7');
INSERT INTO `sys_login_log` VALUES ('48', 'scott', '2019-06-14 07:09:41', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'MSIE 7');
INSERT INTO `sys_login_log` VALUES ('49', 'scott', '2019-06-14 07:16:35', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('50', 'scott', '2019-06-14 07:21:10', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'MSIE 7');
INSERT INTO `sys_login_log` VALUES ('51', 'mrbird', '2019-06-14 07:36:58', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('52', 'mrbird', '2019-06-14 16:25:34', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('53', 'mrbird', '2019-06-14 16:28:10', '内网IP|0|0|内网IP|内网IP', '192.168.33.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('54', 'mrbird', '2019-06-14 19:29:19', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('55', 'mrbird', '2019-06-14 19:34:20', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 70');
INSERT INTO `sys_login_log` VALUES ('56', 'mrbird', '2019-06-14 20:43:01', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('57', 'mrbird', '2019-06-14 20:54:13', '内网IP|0|0|内网IP|内网IP', '172.18.96.1', 'Windows 10', 'Chrome 74');
INSERT INTO `sys_login_log` VALUES ('58', 'scott', '2019-06-14 21:03:37', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 70');
INSERT INTO `sys_login_log` VALUES ('59', 'reina', '2019-06-14 21:08:26', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 70');
INSERT INTO `sys_login_log` VALUES ('60', 'Micaela', '2019-06-14 21:10:37', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 70');
INSERT INTO `sys_login_log` VALUES ('61', 'Jana', '2019-06-14 21:12:31', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 70');
INSERT INTO `sys_login_log` VALUES ('62', 'Georgie', '2019-06-14 21:16:11', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 70');
INSERT INTO `sys_login_log` VALUES ('63', 'Margot', '2019-06-14 21:18:06', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 70');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text COMMENT '权限标识',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, 'layui-icon-setting', '0', '1', '2017-12-27 16:39:07', null);
INSERT INTO `sys_menu` VALUES ('2', '0', '系统监控', '', '', 'layui-icon-alert', '0', '2', '2017-12-27 16:45:51', '2019-06-13 11:20:40');
INSERT INTO `sys_menu` VALUES ('3', '1', '用户管理', '/system/user', 'user:view', 'layui-icon-meh', '0', '1', '2017-12-27 16:47:13', '2019-06-13 11:13:55');
INSERT INTO `sys_menu` VALUES ('4', '1', '角色管理', '/system/role', 'role:view', '', '0', '2', '2017-12-27 16:48:09', '2019-06-13 08:57:19');
INSERT INTO `sys_menu` VALUES ('5', '1', '菜单管理', '/system/menu', 'menu:view', '', '0', '3', '2017-12-27 16:48:57', '2019-06-13 08:57:34');
INSERT INTO `sys_menu` VALUES ('6', '1', '部门管理', '/system/dept', 'dept:view', '', '0', '4', '2017-12-27 16:57:33', '2019-06-14 19:56:00');
INSERT INTO `sys_menu` VALUES ('8', '2', '在线用户', '/monitor/online', 'online:view', '', '0', '1', '2017-12-27 16:59:33', '2019-06-13 14:30:31');
INSERT INTO `sys_menu` VALUES ('10', '2', '系统日志', '/monitor/log', 'log:view', '', '0', '2', '2017-12-27 17:00:50', '2019-06-13 14:30:37');
INSERT INTO `sys_menu` VALUES ('11', '3', '新增用户', null, 'user:add', null, '1', null, '2017-12-27 17:02:58', null);
INSERT INTO `sys_menu` VALUES ('12', '3', '修改用户', null, 'user:update', null, '1', null, '2017-12-27 17:04:07', null);
INSERT INTO `sys_menu` VALUES ('13', '3', '删除用户', null, 'user:delete', null, '1', null, '2017-12-27 17:04:58', null);
INSERT INTO `sys_menu` VALUES ('14', '4', '新增角色', null, 'role:add', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `sys_menu` VALUES ('15', '4', '修改角色', null, 'role:update', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `sys_menu` VALUES ('16', '4', '删除角色', null, 'role:delete', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `sys_menu` VALUES ('17', '5', '新增菜单', null, 'menu:add', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `sys_menu` VALUES ('18', '5', '修改菜单', null, 'menu:update', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `sys_menu` VALUES ('19', '5', '删除菜单', null, 'menu:delete', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `sys_menu` VALUES ('20', '6', '新增部门', null, 'dept:add', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `sys_menu` VALUES ('21', '6', '修改部门', null, 'dept:update', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `sys_menu` VALUES ('22', '6', '删除部门', null, 'dept:delete', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `sys_menu` VALUES ('23', '8', '踢出用户', null, 'user:kickout', null, '1', null, '2017-12-27 17:11:13', null);
INSERT INTO `sys_menu` VALUES ('24', '10', '删除日志', null, 'log:delete', null, '1', null, '2017-12-27 17:11:45', '2019-06-06 05:56:40');
INSERT INTO `sys_menu` VALUES ('101', '0', '任务调度', null, null, 'layui-icon-time-circle', '0', '3', '2018-02-24 15:52:57', null);
INSERT INTO `sys_menu` VALUES ('102', '101', '定时任务', '/job/job', 'job:view', '', '0', '1', '2018-02-24 15:53:53', '2018-04-25 09:05:12');
INSERT INTO `sys_menu` VALUES ('103', '102', '新增任务', null, 'job:add', null, '1', null, '2018-02-24 15:55:10', null);
INSERT INTO `sys_menu` VALUES ('104', '102', '修改任务', null, 'job:update', null, '1', null, '2018-02-24 15:55:53', null);
INSERT INTO `sys_menu` VALUES ('105', '102', '删除任务', null, 'job:delete', null, '1', null, '2018-02-24 15:56:18', null);
INSERT INTO `sys_menu` VALUES ('106', '102', '暂停任务', null, 'job:pause', null, '1', null, '2018-02-24 15:57:08', null);
INSERT INTO `sys_menu` VALUES ('107', '102', '恢复任务', null, 'job:resume', null, '1', null, '2018-02-24 15:58:21', null);
INSERT INTO `sys_menu` VALUES ('108', '102', '立即执行任务', null, 'job:run', null, '1', null, '2018-02-24 15:59:45', null);
INSERT INTO `sys_menu` VALUES ('109', '101', '调度日志', '/job/log', 'job:log:view', '', '0', '2', '2018-02-24 16:00:45', '2019-06-09 02:48:19');
INSERT INTO `sys_menu` VALUES ('110', '109', '删除日志', null, 'job:log:delete', null, '1', null, '2018-02-24 16:01:21', null);
INSERT INTO `sys_menu` VALUES ('113', '2', 'Redis监控', '/monitor/redis/info', 'redis:view', '', '0', '4', '2018-06-28 14:29:42', '2019-06-13 14:30:45');
INSERT INTO `sys_menu` VALUES ('114', '2', 'Redis终端', '/monitor/redis/terminal', 'redis:terminal:view', '', '0', '5', '2018-06-28 15:35:21', '2019-06-13 14:30:54');
INSERT INTO `sys_menu` VALUES ('115', '0', '其他模块', null, null, 'layui-icon-gift', '0', '5', '2019-05-27 10:18:07', null);
INSERT INTO `sys_menu` VALUES ('116', '115', 'Apex图表', '', '', null, '0', '2', '2019-05-27 10:21:35', null);
INSERT INTO `sys_menu` VALUES ('117', '116', '线性图表', '/others/apex/line', 'apex:line:view', null, '0', '1', '2019-05-27 10:24:49', null);
INSERT INTO `sys_menu` VALUES ('118', '115', '高德地图', '/others/map', 'map:view', '', '0', '3', '2019-05-27 17:13:12', '2019-06-12 15:33:00');
INSERT INTO `sys_menu` VALUES ('119', '116', '面积图表', '/others/apex/area', 'apex:area:view', null, '0', '2', '2019-05-27 18:49:22', null);
INSERT INTO `sys_menu` VALUES ('120', '116', '柱形图表', '/others/apex/column', 'apex:column:view', null, '0', '3', '2019-05-27 18:51:33', null);
INSERT INTO `sys_menu` VALUES ('121', '116', '雷达图表', '/others/apex/radar', 'apex:radar:view', null, '0', '4', '2019-05-27 18:56:05', null);
INSERT INTO `sys_menu` VALUES ('122', '116', '条形图表', '/others/apex/bar', 'apex:bar:view', null, '0', '5', '2019-05-27 18:57:02', null);
INSERT INTO `sys_menu` VALUES ('123', '116', '混合图表', '/others/apex/mix', 'apex:mix:view', '', '0', '6', '2019-05-27 18:58:04', '2019-06-06 02:55:23');
INSERT INTO `sys_menu` VALUES ('125', '115', '导入导出', '/others/eximport', 'others:eximport:view', '', '0', '4', '2019-05-27 19:01:57', '2019-06-13 01:20:14');
INSERT INTO `sys_menu` VALUES ('126', '132', '系统图标', '/others/febs/icon', 'febs:icons:view', '', '0', '4', '2019-05-27 19:03:18', '2019-06-06 03:05:26');
INSERT INTO `sys_menu` VALUES ('127', '2', '请求追踪', '/monitor/httptrace', 'httptrace:view', '', '0', '6', '2019-05-27 19:06:38', '2019-06-13 14:36:43');
INSERT INTO `sys_menu` VALUES ('128', '2', '系统信息', null, null, null, '0', '7', '2019-05-27 19:08:23', null);
INSERT INTO `sys_menu` VALUES ('129', '128', 'JVM信息', '/monitor/jvm', 'jvm:view', '', '0', '1', '2019-05-27 19:08:50', '2019-06-13 14:36:51');
INSERT INTO `sys_menu` VALUES ('130', '128', 'Tomcat信息', '/monitor/tomcat', 'tomcat:view', '', '0', '2', '2019-05-27 19:09:26', '2019-06-13 14:36:57');
INSERT INTO `sys_menu` VALUES ('131', '128', '服务器信息', '/monitor/server', 'server:view', '', '0', '3', '2019-05-27 19:10:07', '2019-06-13 14:37:04');
INSERT INTO `sys_menu` VALUES ('132', '115', 'FEBS组件', '', '', null, '0', '1', '2019-05-27 19:13:54', null);
INSERT INTO `sys_menu` VALUES ('133', '132', '表单组件', '/others/febs/form', 'febs:form:view', null, '0', '1', '2019-05-27 19:14:45', null);
INSERT INTO `sys_menu` VALUES ('134', '132', 'FEBS工具', '/others/febs/tools', 'febs:tools:view', '', '0', '3', '2019-05-29 10:11:22', '2019-06-12 13:21:27');
INSERT INTO `sys_menu` VALUES ('135', '132', '表单组合', '/others/febs/form/group', 'febs:formgroup:view', null, '0', '2', '2019-05-29 10:16:19', null);
INSERT INTO `sys_menu` VALUES ('136', '2', '登录日志', '/monitor/loginlog', 'loginlog:view', '', '0', '3', '2019-05-29 15:56:15', '2019-06-13 14:35:56');
INSERT INTO `sys_menu` VALUES ('137', '0', '代码生成', '', null, 'layui-icon-verticalright', '0', '4', '2019-06-03 15:35:58', null);
INSERT INTO `sys_menu` VALUES ('138', '137', '生成配置', '/generator/configure', 'generator:configure:view', null, '0', '1', '2019-06-03 15:38:36', null);
INSERT INTO `sys_menu` VALUES ('139', '137', '代码生成', '/generator/generator', 'generator:view', '', '0', '2', '2019-06-03 15:39:15', '2019-06-13 14:31:38');
INSERT INTO `sys_menu` VALUES ('159', '132', '其他组件', '/others/febs/others', 'others:febs:others', '', '0', '5', '2019-06-12 07:51:08', '2019-06-12 07:51:40');
INSERT INTO `sys_menu` VALUES ('160', '3', '密码重置', null, 'user:password:reset', null, '1', null, '2019-06-13 08:40:13', null);
INSERT INTO `sys_menu` VALUES ('161', '3', '导出Excel', null, 'user:export', null, '1', null, '2019-06-13 08:40:34', null);
INSERT INTO `sys_menu` VALUES ('162', '4', '导出Excel', null, 'role:export', null, '1', null, '2019-06-13 14:29:00', '2019-06-13 14:29:11');
INSERT INTO `sys_menu` VALUES ('163', '5', '导出Excel', null, 'menu:export', null, '1', null, '2019-06-13 14:29:32', null);
INSERT INTO `sys_menu` VALUES ('164', '6', '导出Excel', null, 'dept:export', null, '1', null, '2019-06-13 14:29:59', null);
INSERT INTO `sys_menu` VALUES ('165', '138', '修改配置', null, 'generator:configure:update', null, '1', null, '2019-06-13 14:32:09', '2019-06-13 14:32:20');
INSERT INTO `sys_menu` VALUES ('166', '139', '生成代码', null, 'generator:generate', null, '1', null, '2019-06-13 14:32:51', null);
INSERT INTO `sys_menu` VALUES ('167', '125', '模板下载', null, 'eximport:template', null, '1', null, '2019-06-13 14:33:37', null);
INSERT INTO `sys_menu` VALUES ('168', '125', '导出Excel', null, 'eximport:export', null, '1', null, '2019-06-13 14:33:57', null);
INSERT INTO `sys_menu` VALUES ('169', '125', '导入Excel', null, 'eximport:import', null, '1', null, '2019-06-13 14:34:19', null);
INSERT INTO `sys_menu` VALUES ('170', '10', '导出Excel', null, 'log:export', null, '1', null, '2019-06-13 14:34:55', null);
INSERT INTO `sys_menu` VALUES ('171', '136', '删除日志', null, 'loginlog:delete', null, '1', null, '2019-06-13 14:35:27', '2019-06-13 14:36:08');
INSERT INTO `sys_menu` VALUES ('172', '136', '导出Excel', null, 'loginlog:export', null, '1', null, '2019-06-13 14:36:26', null);
INSERT INTO `sys_menu` VALUES ('173', '102', '导出Excel', null, 'job:export', null, '1', null, '2019-06-13 14:37:25', null);
INSERT INTO `sys_menu` VALUES ('174', '109', '导出Excel', null, 'job:log:export', null, '1', null, '2019-06-13 14:37:46', '2019-06-13 14:38:02');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '系统管理员，拥有所有操作权限 ^_^', '2019-06-14 16:23:11', '2019-06-14 20:52:14');
INSERT INTO `sys_role` VALUES ('2', '注册账户', '注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限', '2019-06-14 16:00:15', '2019-06-14 20:47:47');
INSERT INTO `sys_role` VALUES ('77', 'Redis监控员', '负责Redis模块', '2019-06-14 20:49:22', null);
INSERT INTO `sys_role` VALUES ('78', '系统监控员', '负责整个系统监控模块', '2019-06-14 20:50:07', null);
INSERT INTO `sys_role` VALUES ('79', '跑批人员', '负责任务调度跑批模块', '2019-06-14 20:51:02', null);
INSERT INTO `sys_role` VALUES ('80', '开发人员', '拥有代码生成模块的权限', '2019-06-14 20:51:26', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `MENU_ID` bigint(20) NOT NULL COMMENT '菜单/按钮ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '161');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '162');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '163');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '164');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '170');
INSERT INTO `sys_role_menu` VALUES ('2', '136');
INSERT INTO `sys_role_menu` VALUES ('2', '172');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '127');
INSERT INTO `sys_role_menu` VALUES ('2', '128');
INSERT INTO `sys_role_menu` VALUES ('2', '129');
INSERT INTO `sys_role_menu` VALUES ('2', '130');
INSERT INTO `sys_role_menu` VALUES ('2', '131');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '173');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '174');
INSERT INTO `sys_role_menu` VALUES ('2', '137');
INSERT INTO `sys_role_menu` VALUES ('2', '138');
INSERT INTO `sys_role_menu` VALUES ('2', '139');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '132');
INSERT INTO `sys_role_menu` VALUES ('2', '133');
INSERT INTO `sys_role_menu` VALUES ('2', '135');
INSERT INTO `sys_role_menu` VALUES ('2', '134');
INSERT INTO `sys_role_menu` VALUES ('2', '126');
INSERT INTO `sys_role_menu` VALUES ('2', '159');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '117');
INSERT INTO `sys_role_menu` VALUES ('2', '119');
INSERT INTO `sys_role_menu` VALUES ('2', '120');
INSERT INTO `sys_role_menu` VALUES ('2', '121');
INSERT INTO `sys_role_menu` VALUES ('2', '122');
INSERT INTO `sys_role_menu` VALUES ('2', '123');
INSERT INTO `sys_role_menu` VALUES ('2', '118');
INSERT INTO `sys_role_menu` VALUES ('2', '125');
INSERT INTO `sys_role_menu` VALUES ('2', '167');
INSERT INTO `sys_role_menu` VALUES ('2', '168');
INSERT INTO `sys_role_menu` VALUES ('2', '169');
INSERT INTO `sys_role_menu` VALUES ('77', '2');
INSERT INTO `sys_role_menu` VALUES ('77', '113');
INSERT INTO `sys_role_menu` VALUES ('77', '114');
INSERT INTO `sys_role_menu` VALUES ('78', '2');
INSERT INTO `sys_role_menu` VALUES ('78', '8');
INSERT INTO `sys_role_menu` VALUES ('78', '23');
INSERT INTO `sys_role_menu` VALUES ('78', '10');
INSERT INTO `sys_role_menu` VALUES ('78', '24');
INSERT INTO `sys_role_menu` VALUES ('78', '170');
INSERT INTO `sys_role_menu` VALUES ('78', '136');
INSERT INTO `sys_role_menu` VALUES ('78', '171');
INSERT INTO `sys_role_menu` VALUES ('78', '172');
INSERT INTO `sys_role_menu` VALUES ('78', '113');
INSERT INTO `sys_role_menu` VALUES ('78', '114');
INSERT INTO `sys_role_menu` VALUES ('78', '127');
INSERT INTO `sys_role_menu` VALUES ('78', '128');
INSERT INTO `sys_role_menu` VALUES ('78', '129');
INSERT INTO `sys_role_menu` VALUES ('78', '130');
INSERT INTO `sys_role_menu` VALUES ('78', '131');
INSERT INTO `sys_role_menu` VALUES ('79', '101');
INSERT INTO `sys_role_menu` VALUES ('79', '102');
INSERT INTO `sys_role_menu` VALUES ('79', '103');
INSERT INTO `sys_role_menu` VALUES ('79', '104');
INSERT INTO `sys_role_menu` VALUES ('79', '105');
INSERT INTO `sys_role_menu` VALUES ('79', '106');
INSERT INTO `sys_role_menu` VALUES ('79', '107');
INSERT INTO `sys_role_menu` VALUES ('79', '108');
INSERT INTO `sys_role_menu` VALUES ('79', '173');
INSERT INTO `sys_role_menu` VALUES ('79', '109');
INSERT INTO `sys_role_menu` VALUES ('79', '110');
INSERT INTO `sys_role_menu` VALUES ('79', '174');
INSERT INTO `sys_role_menu` VALUES ('80', '137');
INSERT INTO `sys_role_menu` VALUES ('80', '138');
INSERT INTO `sys_role_menu` VALUES ('80', '165');
INSERT INTO `sys_role_menu` VALUES ('80', '139');
INSERT INTO `sys_role_menu` VALUES ('80', '166');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '160');
INSERT INTO `sys_role_menu` VALUES ('1', '161');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '162');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '163');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '164');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '170');
INSERT INTO `sys_role_menu` VALUES ('1', '136');
INSERT INTO `sys_role_menu` VALUES ('1', '171');
INSERT INTO `sys_role_menu` VALUES ('1', '172');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '127');
INSERT INTO `sys_role_menu` VALUES ('1', '128');
INSERT INTO `sys_role_menu` VALUES ('1', '129');
INSERT INTO `sys_role_menu` VALUES ('1', '130');
INSERT INTO `sys_role_menu` VALUES ('1', '131');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '173');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '174');
INSERT INTO `sys_role_menu` VALUES ('1', '137');
INSERT INTO `sys_role_menu` VALUES ('1', '138');
INSERT INTO `sys_role_menu` VALUES ('1', '165');
INSERT INTO `sys_role_menu` VALUES ('1', '139');
INSERT INTO `sys_role_menu` VALUES ('1', '166');
INSERT INTO `sys_role_menu` VALUES ('1', '115');
INSERT INTO `sys_role_menu` VALUES ('1', '132');
INSERT INTO `sys_role_menu` VALUES ('1', '133');
INSERT INTO `sys_role_menu` VALUES ('1', '135');
INSERT INTO `sys_role_menu` VALUES ('1', '134');
INSERT INTO `sys_role_menu` VALUES ('1', '126');
INSERT INTO `sys_role_menu` VALUES ('1', '159');
INSERT INTO `sys_role_menu` VALUES ('1', '116');
INSERT INTO `sys_role_menu` VALUES ('1', '117');
INSERT INTO `sys_role_menu` VALUES ('1', '119');
INSERT INTO `sys_role_menu` VALUES ('1', '120');
INSERT INTO `sys_role_menu` VALUES ('1', '121');
INSERT INTO `sys_role_menu` VALUES ('1', '122');
INSERT INTO `sys_role_menu` VALUES ('1', '123');
INSERT INTO `sys_role_menu` VALUES ('1', '118');
INSERT INTO `sys_role_menu` VALUES ('1', '125');
INSERT INTO `sys_role_menu` VALUES ('1', '167');
INSERT INTO `sys_role_menu` VALUES ('1', '168');
INSERT INTO `sys_role_menu` VALUES ('1', '169');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) NOT NULL COMMENT '密码',
  `DEPT_ID` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `IS_TAB` char(1) DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
  `THEME` varchar(10) DEFAULT NULL COMMENT '主题',
  `AVATAR` varchar(100) DEFAULT NULL COMMENT '头像',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'MrBird', 'cb62ad1497597283961545d608f80241', '1', 'mrbird@qq.com', '17788888888', '1', '2019-06-14 20:39:22', '2019-06-14 20:44:42', '2019-07-31 15:50:42', '0', '1', 'white', 'cnrhVkzwxjPwAaCfPbdc.png', '我是帅比作者。');
INSERT INTO `sys_user` VALUES ('2', 'Scott', '1d685729d113cfd03872f154939bee1c', '10', 'scott@gmail.com', '17722222222', '1', '2019-06-14 20:55:53', '2019-06-14 21:05:43', '2019-06-14 21:05:47', '0', '1', 'black', 'gaOngJwsRYRaVAuXXcmB.png', '我是scott。');
INSERT INTO `sys_user` VALUES ('3', 'Reina', '1461afff857c02afbfb768aa3771503d', '4', 'Reina@hotmail.com', '17711111111', '0', '2019-06-14 21:07:38', '2019-06-14 21:09:06', '2019-06-14 21:08:26', '1', '1', 'black', '5997fedcc7bd4cffbd350b40d1b5b987.jpg', '由于公款私用，已被封禁。');
INSERT INTO `sys_user` VALUES ('4', 'Micaela', '9f2daa2c7bed6870fcbb5b9a51d6300e', '10', 'Micaela@163.com', '17733333333', '1', '2019-06-14 21:10:13', '2019-06-14 21:11:26', '2019-06-14 21:10:37', '0', '0', 'white', '20180414165909.jpg', '我叫米克拉');
INSERT INTO `sys_user` VALUES ('5', 'Jana', '176679b77b3c3e352bd3b30ddc81083e', '8', 'Jana@126.com', '17744444444', '1', '2019-06-14 21:12:16', '2019-06-14 21:12:52', '2019-06-14 21:12:32', '1', '1', 'white', '20180414165821.jpg', '大家好，我叫简娜');
INSERT INTO `sys_user` VALUES ('6', 'Georgie', 'dffc683378cdaa015a0ee9554c532225', '3', 'Georgie@qq.com', '17766666666', '0', '2019-06-14 21:15:09', '2019-06-14 21:16:25', '2019-06-14 21:16:11', '2', '0', 'black', 'BiazfanxmamNRoxxVxka.png', '生产执行rm -rf *，账号封禁T T');
INSERT INTO `sys_user` VALUES ('7', 'Margot', '31379841b9f4bfde22b8b40471e9a6ce', '9', 'Margot@qq.com', '13444444444', '1', '2019-06-14 21:17:53', '2019-06-14 21:18:59', '2019-06-14 21:18:07', '1', '1', 'white', '20180414165834.jpg', '大家好我叫玛戈');
INSERT INTO `sys_user` VALUES ('8', 'admin', '856aea89ad509f163284abb75579dcfc', '1', 'xiekang123@163.com', '15755559623', '1', '2019-07-31 14:25:35', '2019-07-31 15:08:18', '2019-07-31 15:53:01', '0', '1', 'black', 'BiazfanxmamNRoxxVxka.png', '注册用户');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '77');
INSERT INTO `sys_user_role` VALUES ('4', '78');
INSERT INTO `sys_user_role` VALUES ('5', '79');
INSERT INTO `sys_user_role` VALUES ('6', '80');
INSERT INTO `sys_user_role` VALUES ('7', '78');
INSERT INTO `sys_user_role` VALUES ('7', '79');
INSERT INTO `sys_user_role` VALUES ('7', '80');
INSERT INTO `sys_user_role` VALUES ('8', '1');

-- ----------------------------
-- Function structure for findDeptChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `findDeptChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `findDeptChildren`(rootId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
    DECLARE sTemp VARCHAR(4000);
    DECLARE sTempChd VARCHAR(4000);
    SET sTemp = '$';
    SET sTempChd = CAST(rootId as CHAR);
    WHILE sTempChd is not null DO
        SET sTemp = CONCAT(sTemp,',',sTempChd);
    SELECT GROUP_CONCAT(dept_id) INTO sTempChd FROM t_dept
    WHERE FIND_IN_SET(parent_id,sTempChd)>0;
END WHILE;
RETURN sTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for findMenuChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `findMenuChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `findMenuChildren`(rootId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
    DECLARE sTemp VARCHAR(4000);
    DECLARE sTempChd VARCHAR(4000);
    SET sTemp = '$';
    SET sTempChd = CAST(rootId as CHAR);
    WHILE sTempChd is not null DO
        SET sTemp = CONCAT(sTemp,',',sTempChd);
    SELECT GROUP_CONCAT(menu_id) INTO sTempChd FROM t_menu
    WHERE FIND_IN_SET(parent_id,sTempChd)>0;
END WHILE;
RETURN sTemp;
END
;;
DELIMITER ;
