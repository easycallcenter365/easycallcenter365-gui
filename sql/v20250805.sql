USE `easycallcenter365`;

/*Table structure for table `ai_phone_list` */

DROP TABLE IF EXISTS `ai_phone_list`;

CREATE TABLE `ai_phone_list` (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                 `phone` varchar(32) DEFAULT NULL COMMENT 'ai客服号码',
                                 `ext_num` varchar(32) DEFAULT NULL COMMENT '分机号',
                                 `user_no` varchar(32) DEFAULT NULL COMMENT '绑定的用户账号',
                                 `start_date` datetime DEFAULT NULL COMMENT '有效期起',
                                 `end_date` datetime DEFAULT NULL COMMENT '有效期止',
                                 `ali_access_key_id` varchar(255) DEFAULT NULL COMMENT '阿里云账号access_key_id',
                                 `ali_access_key_secret` varchar(255) DEFAULT NULL COMMENT '阿里云账号access_key_secret',
                                 `ali_app_key` varchar(255) DEFAULT NULL COMMENT '阿里云账号app_key',
                                 `ali_status` int DEFAULT NULL COMMENT '阿里云账号状态（1有效，0无效）',
                                 `coze-server-url` varchar(255) DEFAULT NULL COMMENT '智能体服务地址',
                                 `coze-bot-id` varchar(255) DEFAULT NULL COMMENT '机器人id',
                                 `coze-token` varchar(255) DEFAULT NULL COMMENT '智能体token',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ai_phone_list` */

/*Table structure for table `cc_agent_online` */

DROP TABLE IF EXISTS `cc_agent_online`;

CREATE TABLE `cc_agent_online` (
                                   `id` varchar(50) NOT NULL,
                                   `extnum` varchar(50) NOT NULL,
                                   `opnum` varchar(50) NOT NULL,
                                   `group_id` varchar(50) NOT NULL,
                                   `session_id` varchar(100) NOT NULL,
                                   `agent_status` int NOT NULL,
                                   `last_hangup_time` bigint NOT NULL,
                                   `login_time` bigint NOT NULL,
                                   `client_ip` varchar(50) NOT NULL,
                                   `busy_lock_time` bigint NOT NULL,
                                   `skill_level` int NOT NULL,
                                   `state_change_time` bigint NOT NULL DEFAULT '0' COMMENT 'The timestamp of state change',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `cc_agent_online` */

insert  into `cc_agent_online`(`id`,`extnum`,`opnum`,`group_id`,`session_id`,`agent_status`,`last_hangup_time`,`login_time`,`client_ip`,`busy_lock_time`,`skill_level`,`state_change_time`) values ('2508041509450110001','1001','admin','1','82c0fcfffe5329ca-000a0b57-00004831-98baed9f44e0143d-e6bee644',3,0,1754291385408,'/192.168.67.32:64804',0,9,1754291385460);

/*Table structure for table `cc_biz_group` */

DROP TABLE IF EXISTS `cc_biz_group`;

CREATE TABLE `cc_biz_group` (
                                `group_id` bigint NOT NULL AUTO_INCREMENT COMMENT '业务组编号',
                                `biz_group_name` varchar(50) NOT NULL COMMENT '业务组名称',
                                `sort_no` int DEFAULT NULL COMMENT '排序',
                                `notes` varchar(255) DEFAULT NULL COMMENT '备注',
                                `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_biz_group` */

insert  into `cc_biz_group`(`group_id`,`biz_group_name`,`sort_no`,`notes`,`create_time`) values (1,'金牌客服组',2,'金牌',NULL);
insert  into `cc_biz_group`(`group_id`,`biz_group_name`,`sort_no`,`notes`,`create_time`) values (2,'银牌客服组',3,'',NULL);
insert  into `cc_biz_group`(`group_id`,`biz_group_name`,`sort_no`,`notes`,`create_time`) values (3,'测试业务组',3,'3',NULL);
insert  into `cc_biz_group`(`group_id`,`biz_group_name`,`sort_no`,`notes`,`create_time`) values (4,'默认组',1,'缺省值',NULL);

/*Table structure for table `cc_call_phone` */

DROP TABLE IF EXISTS `cc_call_phone`;

CREATE TABLE `cc_call_phone` (
                                 `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                 `batch_id` int NOT NULL COMMENT '任务批次id',
                                 `telephone` varchar(50) NOT NULL,
                                 `cust_name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户称呼',
                                 `createtime` bigint NOT NULL DEFAULT '0' COMMENT '任务创建时间',
                                 `callstatus` smallint NOT NULL DEFAULT '0' COMMENT '0. Not dialed  \r\n1. Entered call queue  \r\n2. Dialing (in progress)  \r\n3. Not connected (If the empty number detection feature is turned off)\r\n4. Connected  \r\n5. Call dropped (hung up before transferring to agent)  \r\n6. Successfully transferred to agent or AI  \r\n7. Line failure  \r\n\r\n30. Not connected\r\n31. Customer is on another call  \r\n32. Phone is powered off  \r\n33. Invalid number  \r\n34. No answer  \r\n35. Suspended service  \r\n36. Network busy  \r\n37. Voice assistant\r\n38. Temporarily unavailable\r\n39. Call restriction',
                                 `callout_time` bigint NOT NULL DEFAULT '0' COMMENT '外呼时间',
                                 `callcount` smallint NOT NULL DEFAULT '0' COMMENT '呼叫次数',
                                 `call_end_time` bigint NOT NULL DEFAULT '0' COMMENT '呼叫结束时间',
                                 `time_len` int NOT NULL DEFAULT '0' COMMENT '通话时长; 秒;',
                                 `valid_time_len` int NOT NULL DEFAULT '0' COMMENT '人工接听的通话时长; 秒',
                                 `uuid` varchar(50) NOT NULL DEFAULT '' COMMENT '通话唯一标志',
                                 `connected_time` bigint NOT NULL DEFAULT '0' COMMENT '通话接通时间',
                                 `hangup_cause` varchar(50) NOT NULL DEFAULT 'Normal Clearing' COMMENT '挂机原因',
                                 `answered_time` bigint NOT NULL DEFAULT '0' COMMENT '人工坐席应答时间',
                                 `dialogue` text COMMENT '对话内容',
                                 `wavfile` varchar(200) NOT NULL DEFAULT '' COMMENT '全程通话录音文件名',
                                 `record_server_url` varchar(255) NOT NULL DEFAULT '' COMMENT '录音文件路径前缀',
                                 `biz_json` varchar(5000) NOT NULL DEFAULT '' COMMENT '业务json数据',
                                 `dialogue_count` int DEFAULT '0' COMMENT '交互轮次（一问一答算一轮交互）',
                                 `acd_opnum` varchar(50) NOT NULL DEFAULT '' COMMENT '人工坐席工号',
                                 `acd_queue_time` bigint NOT NULL DEFAULT '0' COMMENT '加入转人工排队的时间; ',
                                 `acd_wait_time` int NOT NULL DEFAULT '0' COMMENT '人工排队等待时长,秒',
                                 `tts_text` text COMMENT 'tts text for voice call notification.',
                                 `empty_number_detection_text` varchar(1000) NOT NULL DEFAULT '',
                                 `intent` varchar(32) DEFAULT '' COMMENT '客户意向',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='外呼号码表';

/*Data for the table `cc_call_phone` */

/*Table structure for table `cc_call_task` */

DROP TABLE IF EXISTS `cc_call_task`;

CREATE TABLE `cc_call_task` (
                                `batch_id` int NOT NULL AUTO_INCREMENT,
                                `group_id` varchar(256) NOT NULL DEFAULT '1' COMMENT '外呼任务的业务组 ',
                                `batch_name` varchar(50) NOT NULL DEFAULT '外呼任务名称',
                                `ifcall` smallint NOT NULL DEFAULT '0' COMMENT '是否启动任务, 1 启动， 0 停止',
                                `rate` double NOT NULL DEFAULT '5' COMMENT '外呼速率',
                                `thread_num` int NOT NULL DEFAULT '30' COMMENT '当前任务最大可用外线数',
                                `createtime` bigint NOT NULL DEFAULT '0' COMMENT '任务创建时间',
                                `executing` int NOT NULL DEFAULT '0' COMMENT '任务是否正在执行;',
                                `stop_time` bigint NOT NULL DEFAULT '0' COMMENT '任务停止时间',
                                `userid` varchar(32) NOT NULL DEFAULT '' COMMENT '任务创建者用户id',
                                `task_type` int NOT NULL DEFAULT '1' COMMENT '0 Pure manual outbound call; 1 AI outbound calling; 2 voice call notification.',
                                `gateway_id` int NOT NULL COMMENT '使用哪条线路外呼',
                                `voice_code` varchar(255) NOT NULL DEFAULT '' COMMENT '外呼任务，机器人的发音人',
                                `voice_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL DEFAULT 'aliyun_tts' COMMENT '外呼任务，机器人的tts提供者',
                                `avg_ring_time_len` double(8,3) NOT NULL DEFAULT '0.000' COMMENT 'The average ringing duration of the call; seconds',
  `avg_call_talk_time_len` double(8,3) NOT NULL DEFAULT '0.000' COMMENT 'The average pure call duration per call; seconds',
  `avg_call_end_process_time_len` double(8,3) NOT NULL DEFAULT '0.000' COMMENT 'The duration of form filling after the call ends; seconds',
  `call_node_no` varchar(11) NOT NULL DEFAULT '01' COMMENT '外呼节点',
  `llm_account_id` int NOT NULL DEFAULT '0' COMMENT '大模型底座账号的Id',
  `play_times` int NOT NULL DEFAULT '2' COMMENT 'voice call notification play times.',
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='外呼任务表';

/*Data for the table `cc_call_task` */

/*Table structure for table `cc_call_voice_notification` */

DROP TABLE IF EXISTS `cc_call_voice_notification`;

CREATE TABLE `cc_call_voice_notification` (
                                              `id` varchar(32) NOT NULL,
                                              `telephone` varchar(50) NOT NULL,
                                              `createtime` bigint NOT NULL DEFAULT '0' COMMENT '任务创建时间',
                                              `callstatus` smallint NOT NULL DEFAULT '1' COMMENT '1  已经进入呼叫队列;  2 正在呼叫;  3  未接通;  4   已接通; 5 语音文件不存在',
                                              `callout_time` bigint NOT NULL DEFAULT '0' COMMENT '外呼时间',
                                              `callcount` smallint NOT NULL DEFAULT '0' COMMENT '呼叫次数',
                                              `call_end_time` bigint NOT NULL DEFAULT '0' COMMENT '呼叫结束时间',
                                              `time_len` int NOT NULL DEFAULT '0' COMMENT '通话时长; 秒;',
                                              `valid_time_len` int NOT NULL DEFAULT '0' COMMENT '有效通话时长; 秒',
                                              `uuid` varchar(50) NOT NULL DEFAULT '' COMMENT '通话唯一标志',
                                              `connected_time` bigint NOT NULL DEFAULT '0' COMMENT '通话接通时间',
                                              `hangup_cause` varchar(50) NOT NULL DEFAULT '' COMMENT '挂机原因',
                                              `dialogue` text COMMENT '对话内容',
                                              `recordings_file` varchar(200) NOT NULL DEFAULT '' COMMENT '全程通话录音文件名',
                                              `gateway_id` int NOT NULL DEFAULT '0' COMMENT '使用哪条线路外呼; ',
                                              `gateway_name` varchar(50) NOT NULL DEFAULT '' COMMENT '外呼使用的网关名称; gateway_id为0时，才启用该参数;',
                                              `voice_file_save_path` varchar(1024) NOT NULL DEFAULT '' COMMENT '录音通知文件的本地路径',
                                              `voice_file_url` varchar(1024) NOT NULL DEFAULT '' COMMENT '录音通知文件的原始url地址',
                                              `batch_id` varchar(32) NOT NULL DEFAULT '' COMMENT '批次id',
                                              PRIMARY KEY (`id`),
                                              UNIQUE KEY `id` (`id`) USING BTREE,
                                              KEY `telephone` (`telephone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='外呼号码表';

/*Data for the table `cc_call_voice_notification` */

/*Table structure for table `cc_conference_list` */

DROP TABLE IF EXISTS `cc_conference_list`;

CREATE TABLE `cc_conference_list` (
                                      `id` bigint NOT NULL,
                                      `moderator` varchar(50) NOT NULL COMMENT '主持人手机号',
                                      `user_id` varchar(50) NOT NULL COMMENT '会议主持人的员工id',
                                      `start_time` bigint NOT NULL COMMENT '会议开始时间',
                                      `end_time` bigint NOT NULL COMMENT '会议结束时间',
                                      `time_len` int DEFAULT '0' COMMENT '会议时长; 秒数',
                                      `conf_password` varchar(50) NOT NULL COMMENT '会议进入密码',
                                      `max_concurrency` int NOT NULL COMMENT '会议的最大参会人数',
                                      `record_path` varchar(500) NOT NULL DEFAULT '',
                                      `room_no` varchar(50) NOT NULL DEFAULT '',
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_conference_list` */

/*Table structure for table `cc_conference_members` */

DROP TABLE IF EXISTS `cc_conference_members`;

CREATE TABLE `cc_conference_members` (
                                         `id` varchar(20) NOT NULL COMMENT '参会者id流水号',
                                         `conference_id` varchar(20) NOT NULL COMMENT '会议id',
                                         `phone` varchar(50) NOT NULL COMMENT '参会者号码',
                                         `user_id` varchar(50) NOT NULL COMMENT '参会者的员工id',
                                         `start_time` bigint NOT NULL COMMENT '加入会议时间',
                                         `end_time` bigint NOT NULL COMMENT '退出会议时间',
                                         `time_len` int NOT NULL DEFAULT '0' COMMENT '通话时长; 秒数',
                                         PRIMARY KEY (`id`,`conference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_conference_members` */

/*Table structure for table `cc_conference_transcriptions` */

DROP TABLE IF EXISTS `cc_conference_transcriptions`;

CREATE TABLE `cc_conference_transcriptions` (
                                                `id` bigint NOT NULL AUTO_INCREMENT,
                                                `conference_id` bigint NOT NULL COMMENT '会议Id',
                                                `conf_member_mobile` varchar(20) NOT NULL COMMENT '参会者的mobile',
                                                `asr_text` varchar(500) NOT NULL COMMENT '转写文本',
                                                `vad_start_time` bigint NOT NULL COMMENT '讲话开始时间',
                                                `vad_end_time` bigint NOT NULL COMMENT '讲话结束时间',
                                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_conference_transcriptions` */

/*Table structure for table `cc_cust_call_record` */

DROP TABLE IF EXISTS `cc_cust_call_record`;

CREATE TABLE `cc_cust_call_record` (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                       `uuid` varchar(32) DEFAULT NULL COMMENT '通话id',
                                       `call_type` int DEFAULT NULL COMMENT '1:呼入，2:外呼',
                                       `cust_id` bigint DEFAULT NULL COMMENT '对应客户id',
                                       `notes` varchar(512) DEFAULT NULL COMMENT '沟通内容',
                                       `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                       `user_id` varchar(255) DEFAULT NULL COMMENT '坐席用户id',
                                       `user_real_name` varchar(255) DEFAULT NULL COMMENT '坐席姓名',
                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='沟通记录表';

/*Data for the table `cc_cust_call_record` */

/*Table structure for table `cc_cust_info` */

DROP TABLE IF EXISTS `cc_cust_info`;

CREATE TABLE `cc_cust_info` (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                `cust_name` varchar(32) DEFAULT NULL COMMENT '姓名',
                                `province` varchar(255) DEFAULT NULL COMMENT '省',
                                `province_code` varchar(255) DEFAULT NULL COMMENT '省份编号',
                                `city` varchar(255) DEFAULT NULL COMMENT '市',
                                `city_code` varchar(255) DEFAULT NULL COMMENT '市编号',
                                `county` varchar(255) DEFAULT NULL COMMENT '县',
                                `county_code` varchar(255) DEFAULT NULL COMMENT '区县编号',
                                `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
                                `gender` int DEFAULT NULL COMMENT '性别（0男，1女）',
                                `phone_num` varchar(32) DEFAULT NULL COMMENT '号码',
                                `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户信息表';

/*Data for the table `cc_cust_info` */

/*Table structure for table `cc_ext_num` */

DROP TABLE IF EXISTS `cc_ext_num`;

CREATE TABLE `cc_ext_num` (
                              `ext_id` int NOT NULL AUTO_INCREMENT COMMENT '流水编号',
                              `ext_num` int NOT NULL COMMENT '分机号',
                              `ext_pass` varchar(50) NOT NULL DEFAULT '' COMMENT '分机密码',
                              `user_code` varchar(32) NOT NULL COMMENT '所属员工/绑定关系',
                              PRIMARY KEY (`ext_id`),
                              KEY `extnum` (`ext_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `cc_ext_num` */

insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (1,1001,'1234567','admin');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (2,1002,'123456','easycallcenter365');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (3,1003,'123456','test01');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (4,1004,'123456','1004');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (5,1005,'123456','1005');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (6,1006,'123456','1006');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (7,1007,'123456','1007');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (8,1008,'123456','1008');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (9,1009,'123456','1009');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (10,1010,'123456','1010');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (11,1011,'123456','1011');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (12,1012,'123456','1012');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (13,1013,'123456','1013');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (14,1014,'123456','1014');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (15,1015,'123456','1015');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (16,1016,'123456','1016');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (17,1017,'123456','1017');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (18,1018,'123456','1018');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (19,1019,'123456','1019');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (20,1020,'123456','1020');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (21,1021,'123456','1021');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (22,1022,'123456','1022');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (23,1023,'123456','1023');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (24,1024,'123456','1024');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (25,1025,'123456','1025');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (26,1026,'123456','1026');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (27,1027,'123456','1027');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (28,1028,'123456','1028');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (29,1029,'123456','1029');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (30,1030,'123456','1030');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (31,1031,'123456','1031');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (32,1032,'123456','1032');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (33,1033,'123456','1033');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (34,1034,'123456','1034');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (35,1035,'123456','1035');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (36,1036,'123456','1036');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (37,1037,'123456','1037');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (38,1038,'123456','1038');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (39,1039,'123456','1039');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (40,1040,'123456','1040');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (41,1041,'123456','10418');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (42,1042,'123456','1042');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (43,1043,'123456','1043');
insert  into `cc_ext_num`(`ext_id`,`ext_num`,`ext_pass`,`user_code`) values (44,1000,'123456','1000');

/*Table structure for table `cc_ext_power` */

DROP TABLE IF EXISTS `cc_ext_power`;

CREATE TABLE `cc_ext_power` (
                                `power_id` int NOT NULL AUTO_INCREMENT,
                                `ext_num` varchar(10) NOT NULL COMMENT '分机号',
                                `group_id` varchar(2000) NOT NULL DEFAULT '0' COMMENT '业务组id; 如果为0，则可以监控全部通话; 多个以逗号,分隔',
                                PRIMARY KEY (`power_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='该表定义了分机权限。可以管理哪些业务组的分机，比如监听、语音指导、im消息等。';

/*Data for the table `cc_ext_power` */

insert  into `cc_ext_power`(`power_id`,`ext_num`,`group_id`) values (1,'1019','0');
insert  into `cc_ext_power`(`power_id`,`ext_num`,`group_id`) values (2,'1002','1,2');
insert  into `cc_ext_power`(`power_id`,`ext_num`,`group_id`) values (3,'1003','2');
insert  into `cc_ext_power`(`power_id`,`ext_num`,`group_id`) values (4,'1001','0');

/*Table structure for table `cc_extension_bind` */

DROP TABLE IF EXISTS `cc_extension_bind`;

CREATE TABLE `cc_extension_bind` (
                                     `id` int NOT NULL,
                                     `extnum` varchar(50) DEFAULT '' COMMENT '分机号',
                                     `opnum` varchar(50) DEFAULT '' COMMENT '工号',
                                     PRIMARY KEY (`id`),
                                     UNIQUE KEY `unique_index` (`extnum`,`opnum`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_extension_bind` */

/*Table structure for table `cc_fs_modules` */

DROP TABLE IF EXISTS `cc_fs_modules`;

CREATE TABLE `cc_fs_modules` (
                                 `id` int NOT NULL,
                                 `module_label` varchar(50) NOT NULL COMMENT '模块别名',
                                 `module_name` varchar(50) NOT NULL COMMENT '模块名称',
                                 `module_desc` varchar(50) NOT NULL COMMENT '模块描述',
                                 `cat_id` int NOT NULL COMMENT '模块类别',
                                 `module_enabled` int NOT NULL COMMENT '是否启用模块; 1启用;  0禁用',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_fs_modules` */

/*Table structure for table `cc_fs_modules_cat` */

DROP TABLE IF EXISTS `cc_fs_modules_cat`;

CREATE TABLE `cc_fs_modules_cat` (
                                     `id` int NOT NULL AUTO_INCREMENT,
                                     `cat_name` varchar(50) NOT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_fs_modules_cat` */

insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (1,'Applications');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (2,'ASR / TTS');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (3,'Codec Interfaces');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (4,'Dialplan Interfaces');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (5,'Directory Interfaces');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (6,'Endpoints');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (7,'Event Handlers');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (8,'File Format Interfaces');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (9,'Languages');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (10,'Loggers');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (11,'Multi-Faceted');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (12,'Say');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (13,'snom');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (14,'Streams / Files');
insert  into `cc_fs_modules_cat`(`id`,`cat_name`) values (15,'XML Interfaces');

/*Table structure for table `cc_gateways` */

DROP TABLE IF EXISTS `cc_gateways`;

CREATE TABLE `cc_gateways` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `gw_name` varchar(32) DEFAULT NULL COMMENT '网关名称',
                               `profile_name` varchar(32) DEFAULT NULL COMMENT 'profile名称',
                               `caller` varchar(20) NOT NULL DEFAULT '' COMMENT '外呼的主叫号码',
                               `callee_prefix` varchar(20) NOT NULL DEFAULT '' COMMENT '被叫前缀;',
                               `gw_addr` varchar(30) NOT NULL DEFAULT '' COMMENT '网关地址; ip地址:端口',
                               `codec` varchar(10) NOT NULL DEFAULT 'pcma' COMMENT '外呼语音编码',
                               `gw_desc` varchar(30) NOT NULL COMMENT '网关名称描述;',
                               `max_concurrency` int NOT NULL DEFAULT '1' COMMENT '网关最大并发数; 仅用作手工选择参考，不用于程序判断：',
                               `auth_username` varchar(50) DEFAULT '' COMMENT '注册模式下；认证用户名',
                               `auth_password` varchar(50) DEFAULT '' COMMENT '注册模式下；认证密码',
                               `priority` int NOT NULL COMMENT '使用优先级; 数字1-9； 数字越小，越优先被使用',
                               `update_time` bigint NOT NULL COMMENT '网关信息更新时间',
                               `register` int NOT NULL COMMENT '是否需要认证注册； 0 对接模式； 1注册模式',
                               `configs` varchar(512) DEFAULT NULL COMMENT '自定义参数',
                               `purpose` int DEFAULT '0' COMMENT '0 dropped; 1 phonebar; 2 outbound tasks; 3 Unlimited',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='外呼主叫号码表; ';

/*Data for the table `cc_gateways` */

insert  into `cc_gateways`(`id`,`gw_name`,`profile_name`,`caller`,`callee_prefix`,`gw_addr`,`codec`,`gw_desc`,`max_concurrency`,`auth_username`,`auth_password`,`priority`,`update_time`,`register`,`configs`,`purpose`) values (9,'outbound','internal','008','','192.168.11.1:5060','pcma','外呼网关',1,'','',1,1750731474119,0,'{}',3);
insert  into `cc_gateways`(`id`,`gw_name`,`profile_name`,`caller`,`callee_prefix`,`gw_addr`,`codec`,`gw_desc`,`max_concurrency`,`auth_username`,`auth_password`,`priority`,`update_time`,`register`,`configs`,`purpose`) values (10,'test2','internal','007','','192.168.67.228:5092','pcma','test2',100,'','',1,1753436072711,0,'{}',2);

/*Table structure for table `cc_inbound_black` */

DROP TABLE IF EXISTS `cc_inbound_black`;

CREATE TABLE `cc_inbound_black` (
                                    `id` int NOT NULL AUTO_INCREMENT,
                                    `caller` varchar(15) NOT NULL COMMENT '黑名单主叫号码',
                                    `expired_time` bigint NOT NULL COMMENT '黑名单有效期',
                                    `add_time` bigint NOT NULL COMMENT '添加时间',
                                    `add_user` varchar(50) NOT NULL COMMENT '添加人',
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_inbound_black` */

insert  into `cc_inbound_black`(`id`,`caller`,`expired_time`,`add_time`,`add_user`) values (1,'15005600327',1600090461029,1700030461229,'zhangsan');

/*Table structure for table `cc_inbound_cdr` */

DROP TABLE IF EXISTS `cc_inbound_cdr`;

CREATE TABLE `cc_inbound_cdr` (
                                  `id` varchar(21) NOT NULL,
                                  `caller` varchar(30) NOT NULL COMMENT '主叫号码',
                                  `callee` varchar(30) NOT NULL COMMENT '被叫号码',
                                  `inbound_time` bigint NOT NULL COMMENT '呼入时间',
                                  `group_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '请求转接的坐席组',
                                  `answered_time` bigint NOT NULL DEFAULT '0' COMMENT '电话被接听时间',
                                  `extnum` varchar(50) NOT NULL DEFAULT '' COMMENT '接听电话的分机号码',
                                  `opnum` varchar(50) NOT NULL DEFAULT '' COMMENT '接听电话的员工工号',
                                  `hangup_time` bigint NOT NULL DEFAULT '0' COMMENT '挂机时间',
                                  `answered_time_len` bigint NOT NULL DEFAULT '0' COMMENT '服务时长',
                                  `time_len` bigint NOT NULL DEFAULT '0' COMMENT '通话总时长',
                                  `uuid` varchar(50) NOT NULL DEFAULT '' COMMENT '通话uuid',
                                  `wav_file` varchar(100) NOT NULL DEFAULT '' COMMENT '录音文件名',
                                  `chat_content` text COMMENT '对话内容。',
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_inbound_cdr` */

/*Table structure for table `cc_inbound_llm_account` */

DROP TABLE IF EXISTS `cc_inbound_llm_account`;

CREATE TABLE `cc_inbound_llm_account` (
                                          `id` int NOT NULL AUTO_INCREMENT,
                                          `llm_account_id` int NOT NULL COMMENT 'llm or ai-agent account id.',
                                          `callee` varchar(30) NOT NULL DEFAULT '' COMMENT 'callee number',
                                          `voice_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'TTS voice code for the robot',
                                          `voice_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL DEFAULT 'aliyun_tts' COMMENT 'tts provider',
                                          `service_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ai' COMMENT 'customer service mode: AI assistant or  ACD queue.  ai or acd',
                                          `group_id` int NOT NULL DEFAULT '0' COMMENT 'biz group id.',
                                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_inbound_llm_account` */

/*Table structure for table `cc_llm_agent_account` */

DROP TABLE IF EXISTS `cc_llm_agent_account`;

CREATE TABLE `cc_llm_agent_account` (
                                        `id` int NOT NULL AUTO_INCREMENT,
                                        `account_json` mediumtext COMMENT '账号详细信息',
                                        `provider_class_name` varchar(100) NOT NULL COMMENT 'Name of the implementation class.',
                                        `name` varchar(50) NOT NULL COMMENT '别名',
                                        `account_entity` varchar(50) NOT NULL DEFAULT '' COMMENT 'Entity class for storing account config info.',
                                        `interrupt_flag` int DEFAULT '0' COMMENT '是否打断（1：是，0：否）',
                                        `interrupt_keywords` text COMMENT '打断关键词列表',
                                        `interrupt_ignore_keywords` text COMMENT '打断忽略关键字列表',
                                        `intention_tips` text COMMENT '客户意向提示词',
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Conversation foundation:  configuration parameters for accessing large language models or ai agents.';

/*Data for the table `cc_llm_agent_account` */


/*Table structure for table `cc_llm_agent_provider` */

DROP TABLE IF EXISTS `cc_llm_agent_provider`;

CREATE TABLE `cc_llm_agent_provider` (
                                         `id` int NOT NULL AUTO_INCREMENT,
                                         `provider_class_name` varchar(100) NOT NULL,
                                         `note` varchar(100) DEFAULT NULL,
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_llm_agent_provider` */

insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (1,'DeepSeekChat','对接deepseek chat模型');
insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (2,'ChatGpt4o','对接chatgpt4o-mini');
insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (3,'Coze','对接字节扣子智能体');
insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (4,'MaxKB','对接MaxKB');
insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (5,'Dify','对接Dify');

/*Table structure for table `cc_llm_kb` */

DROP TABLE IF EXISTS `cc_llm_kb`;

CREATE TABLE `cc_llm_kb` (
                             `id` int NOT NULL,
                             `cat` varchar(50) NOT NULL COMMENT '知识类别',
                             `content` text NOT NULL COMMENT '答案'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cc_llm_kb` */

insert  into `cc_llm_kb`(`id`,`cat`,`content`) values (1,'计算机科学与技术','一、专业愿景\r\n\r\n       学计科，拿高薪，成就你的人生梦想\r\n\r\n二、专业解读\r\n\r\n       计算机科学与技术专业面向IT行业、企事业单位。主要培养能从事软硬件开发、系统维护和项目管理等工作，具有较强的软硬件工程实践能力和外语沟通能力的，以及计算机软硬件开发领域的高素质应用型人才。\r\n\r\n三、专业主干课程介绍\r\n\r\n       C语言程序设计、模拟电子技术基础、数字电路与逻辑设计、数据机构、单片机原理及应用、操作系统原理、计算机网络、计算机组成、嵌入式系统及应用、智能硬件应用及开发、算法分析与设计等。\r\n\r\n四、可获得的资格证书或可参加的赛事内容介绍\r\n\r\n1. 可获得的资格证书\r\n\r\n       计算机三级证书，网络工程师认证证书、数据库工程师认证、JAVA软件工程师认证、系统架构师认证、信息安全工程师认证。\r\n\r\n2. 可参加的赛事\r\n\r\nØ “互联网+”大学生创新创业大赛\r\n\r\nØ 全国大学生数学建模竞赛\r\n\r\nØ “挑战杯”全国大学生系列科技学术竞赛\r\n\r\nØ 中国大学生计算机设计大赛\r\n\r\nØ 安徽省机器人大赛\r\n\r\nØ 中国大学生服务外包创新创业大赛\r\n\r\nØ 全国大学生信息安全竞赛\r\n\r\n\r\n五、升学就业\r\n\r\n       毕业生可在嵌入式软硬件开发领域相关的计算机公司、软件开发公司、网络开发及应用等企事业单位从事软硬件系统研究、设计、开发、维护和管理等工作，也可在教育机构从事相关软硬件培训等工作，也可以继续攻读软件工程、计算机科学与技术、人工智能等专业的硕士。\r\n\r\n \r\n\r\n六、院长/教授带你逛专业\r\n\r\n       我们的计算机与科学技术专业为省级特色专业。该专业培养的学生具有较强的计算思维能力、算法设计与分析能力、程序设计与实现能力、系统集成能力、软硬件工程实践能力和创新创业能力。同时本专业是考研的热门专业，研究方向包含模式识别、人工智能等多个方向，是很多硕博导师比较喜欢的专业。\r\n\r\n                                 ——大数据与人工智能学院院长 吴建国\r\n\r\n七、企业带你看专业\r\n\r\n       一直以来，计算机科学与技术专业都坚持“特色发展”和“错位争先”的发展理念，扎实推进产学研合作育人。此专业与我公司合作多年。同时我公司积极参与到此专业的人才培养的工作之中，实现校企深度合作，并开展专业共建、实习实训、横向课题、共建实验室等多方面合作。在我们公司实习和就业的毕业生业务能力强、创新意识强、团队合作意识强，只需短期培训就可胜任工作岗位的需求，对自己的职业规划有清晰的认识，很快成长为业务骨干。\r\n\r\n——科大讯飞相关负责人\r\n\r\n八、学长学姐带你聊专业\r\n\r\n       经过大学四年的学习，我对计算机科学与技术专业有了更加深刻的认识和理解。计算机科学与技术专业是实践性很强的专业，在计算机软件和硬件方面都有较为深入的研究，更需要在学习中重视提升实践动手能力。本专业就业前景广阔，可以考研继续深造，可以进入大中型的IT公司进行项目研发，可以胜任与IT产品有关的产品推广和销售等工作，总之，学计科、拿高薪，满足你的职业梦想。但“梅花香自苦寒来，宝剑锋从磨砾出”，任何事都必须付出努力与汗水，才可能享受成功的喜悦。愿学弟学妹们，不负青春好时光，努力拼搏，开辟自己的大好前程。\r\n\r\n              ——2018级计算机科学与技术专业1班潘昊飞\r\n\r\n九、获批专业建设类项目情况或专业所获荣誉\r\n\r\n       本专业综合实力雄厚，在2009年获批省级质量工程项目“IT服务外包人才培养模式创新试验区”，2010年获批为省级特色专业，2011年获批省级质量工程项目“IT服务外包示范实习实训中心”，2013年获批省振兴计划项目“计算机科学与技术（IT服务外包方向）专业综合改革试点”，2014年获批省振兴计划重大教改项目“基于IT服务外包人才标准的实践教学体系构建与实施”，2015年“3个不断线1个强化”的服务外包应用型人才培养模式的创新与实践获得安徽省教学成果二等奖，2018年获批省质量工程“六卓越、一拔尖”卓越人才培养创新项目——计算机科学与技术卓越工程师教育培养计划，同年获批省级教学团队。');
insert  into `cc_llm_kb`(`id`,`cat`,`content`) values (2,'人工智能','一、专业愿景:\r\n\r\n智能新时代，自信赢未来。\r\n\r\n \r\n\r\n二、专业解读：\r\n\r\n        人工智能是研究开发用于模拟、延伸和扩展人的智能的理论、方法、技术及应用系统的一门新的技术科学。人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。人工智能从诞生以来，理论和技术日益成熟，应用领域也不断扩大。人工智能不是人的智能，但能像人那样思考、也可能超过人的智能。\r\n\r\n        人工智能专业培养适应数字经济发展需要，具有良好的工程素质和人文社会科学素养，掌握人工智能的基础理论与基本知识，能从事人工智能领域科学研究、产品设计与开发、项目管理等工作，能利用人工智能技术解决各行业普遍存在的数据采集与处理、算法分析、智能控制等问题，具有创新精神与实践能力的专业技术人才。\r\n\r\n\r\n\r\n \r\n\r\n三、主干课程：\r\n\r\n        电路与电子学、Python语言程序设计、信号与系统、机器学习、人工智能原理与应用、智能信息处理、神经网络与深度学习、计算机视觉技术、自然语言处理、最优化方法应用等。\r\n\r\n四、可获得的资格证书或可参加的学科竞赛：\r\n\r\n        华为人工智能工程师认证；百度深度学习工程师认证\r\n\r\n        程序设计、机器人、数学建模等竞赛、创新创业大赛、大数据竞赛等。\r\n\r\n \r\n\r\n\r\n五、升学就业：\r\n\r\n        毕业后可在工程开发、软件设计、电子自动化、通信、智能制造等相关领域的有关企业，从事产业设计、制造、新技术科研开发、应用研究与技术管理等工作，可以继续攻读计算机相关或者人工智能相关的研究生。\r\n\r\n \r\n\r\n六、院长/教授带你逛专业：\r\n\r\n        今日与未来，人工智能的潮流浩浩荡荡。我们的人工智能专业顺应时代发展的趋势，以培养具备计算机科学与技术、人工智能科学与技术的基本知识，具有深厚人文底蕴、高度社会责任感、强烈创新精神、扎实专业基础的创新型人才为目标。本专业要求学生学习智能科学的基本理论和基础知识，夯实计算机、网络与人工智能学科核心基础知识。同时又注重智能信息系统工程实践能力，培养科学研究与技术创新素养，加强学科交叉与国际交流特色，重点突出智能系统开发和人工智能应用程序开发等相关技能的训练。\r\n\r\n——人工智能专业张怡文教授\r\n\r\n \r\n\r\n七、企业带你看专业：\r\n\r\n        大数据与人工智能学院的人工智能专业致力于将学生的理论学习和实践能力相结合。在校企合作过程中，以产业发展促进专业建设，形成了“产教结合、产教并举、以教促产、以产养教”的良性循环。总体而言，我国AI建设仍处于初始或者试点阶段，人才需求量大，该专业必将成为该校的办学特色。目前，来我公司实习的新华毕业生通常学业名列前茅，入司表现出类拔萃，能胜任前端开发、后台编程等各岗位工作。\r\n\r\n——中软国际开发部负责人\r\n');
insert  into `cc_llm_kb`(`id`,`cat`,`content`) values (3,'土木工程','一、专业愿景\r\n\r\n       筑匠心，勇创新\r\n\r\n二、专业解读\r\n\r\n       土木工程专业就业面广，主要就业方向有工程技术方向，设计、规划及预算方向，质量监督及工程监理方向，公务员方向等。所涉行业包括建筑业、房地产开发业、路桥施工、工程勘察设计单位、交通或市政工程类政府机关职能部门、工程造价咨询机构、科研院所等。土木工程专业学生在参加工作之后，通过相关部门的统一考试，可以获得许多资格证书：注册结构师、注册造价师、注册监理工程师、房地产估价师、注册建筑师、注册建造师、注册岩土工程师等等，有了这些证书，在工作中会获得许多机会和较高的报酬。\r\n\r\n       土木工程专业面向建筑行业，培养德智体美劳全面发展，能在设计、施工和监理等企业，从事设计、施工和管理工作的高素质应用型工程技术人才。\r\n\r\n三、专业主干课程\r\n\r\n      土木工程材料、房屋建筑学、土力学与地基基础、钢结构基本原理、混凝土结构设计原理、土木工程施工、工程结构抗震、BIM技术原理及应用、混凝土结构设计、钢结构设计、建筑工业化与装配式建筑、高层建筑结构等。\r\n\r\n\r\n\r\n四、可获得的资格证书或可参加的赛事的内容介绍\r\n\r\n在校生可参加以下专业赛事：\r\n\r\n1.全国周培源大学生力学竞赛\r\n\r\n2.“高教杯”全国大学生先进成图技术与产品信息建模创新大赛\r\n\r\n3.安徽省大学生结构设计竞赛\r\n\r\n4.全国建设类院校施工技术应用技能大赛\r\n\r\n5.全国高等院校“斯维尔杯”BIM应用技能大赛\r\n\r\n6.建筑模型比赛\r\n\r\n7.工程测量比赛\r\n\r\n8.工程制图比赛\r\n\r\n \r\n\r\n五、升学就业\r\n\r\n       毕业生可在工程勘察设计单位、房地产开发企业、工程造价咨询公司、工程监理公司等从事工程设计、施工、监理、咨询、管理等工作。\r\n\r\n       该专业可报考结构工程、桥梁与隧道工程、防灾减灾工程及防护工程、岩土工程、水利工程、市政工程、供热、供燃气、通风及空调工程、工程力学等方向的硕士研究生。\r\n\r\n六、院长/教授带你逛专业\r\n\r\n       土木工程专业人才培养将理论与实践相结合，实现科研与教学互相促进，课内课外相结合，逐步形成“三融合-三意识-三能力”的人才培养模式，切实提高工程教育的质量与水平，实现人才培养目标，2020年土木工程专业获批安徽省一流专业建设点。\r\n\r\n       土木工程专业现有安徽路桥、安徽三建、苏亚建设等稳定的校内外实习实训基地12个。建有安徽省建筑结构重点实验室、建筑工程测量省级示范实验实训中心、建筑材料实验室、工程项目管理综合实验室等实验实训中心12个，占地总面积约为2800平方米。实验室现有各种设备仪器与装置系统总价值940余万元，可开出实验项目有90个。\r\n\r\n \r\n\r\n七、企业带你看专业\r\n\r\n       安徽省苏亚建设安装有限公司总经理吴德雨——我们招聘了多位土木工程专业的毕业生，他们在各个工作岗位上踏实肯干，求真务实，具有良好个人综合素质与执行力，能够与团队其他成员有效沟通，能够在工作中遵守工程职业道德和规范，履行责任，为企业的发展做出了贡献。\r\n\r\n \r\n\r\n八、学长学姐带你聊专业\r\n\r\n       2010级土木工程3班曾勇——校园环境优美，如图书馆门前的大草坪、道路两旁的银杏树、美如画的如琴湖等。学习上，有认真负责、爱心满满的专业教师团队以及宽敞、明亮、整洁的教室与图书馆自习室，为学生的学习提供了保障。生活上，校内有生活超市，能够满足学生的日常购物需求，学校还拥有丰富多样且美味的菜肴与小吃，一些小吃至今仍令我十分想念。课外活动上，校内设有多个社团，如建筑工程协会、书法协会、体育协会等，能够丰富学生的课外生活，在那里我们不仅能够学习专业知识，还能结识一些志同道合的朋友。是我大学生活的开始，我很开心也很享受在这里的4年时光，在这里我遇到了很多优秀的人，让我也变得很优秀。\r\n\r\n \r\n\r\n九、获批专业建设类项目情况或专业所获荣誉\r\n\r\n       土木工程专业2011年获批省特色专业，2012年获批省专业综合改革试点，2019年获批一流本科人才示范引领基地、教育厅重点实验室，土木工程教学团队获批省级教学团队，2019年以土木工程专业为主要支撑的土木水利专业硕士学位授权点获立项建设，并与安徽建筑大学联合培养研究生。2020年，获批安徽省一流本科专业建设点。\r\n');

/*Table structure for table `cc_outbound_cdr` */

DROP TABLE IF EXISTS `cc_outbound_cdr`;

CREATE TABLE `cc_outbound_cdr` (
                                   `id` varchar(30) NOT NULL,
                                   `caller` varchar(30) NOT NULL COMMENT '主叫号码',
                                   `opnum` varchar(50) NOT NULL COMMENT '工号',
                                   `callee` varchar(30) NOT NULL COMMENT '被叫号码',
                                   `start_time` bigint NOT NULL COMMENT '外呼时间',
                                   `answered_time` bigint NOT NULL DEFAULT '0' COMMENT '外线接听时间',
                                   `end_time` bigint NOT NULL COMMENT '挂机时间',
                                   `uuid` varchar(50) NOT NULL DEFAULT '' COMMENT '通话uuid',
                                   `call_type` varchar(10) NOT NULL DEFAULT 'audio' COMMENT '通话类型; audio or  video',
                                   `time_len` int NOT NULL COMMENT '通话时长的秒数',
                                   `time_len_valid` int NOT NULL COMMENT '通话时长; 被叫接通后起计算; 毫秒数',
                                   `record_filename` varchar(100) NOT NULL COMMENT '录音文件名称',
                                   `hangup_cause` varchar(50) NOT NULL COMMENT '挂机原因',
                                   PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='外呼通话监控表，每个通话结束时会自动删除记录';

/*Data for the table `cc_outbound_cdr` */

/*Table structure for table `cc_params` */

DROP TABLE IF EXISTS `cc_params`;

CREATE TABLE `cc_params` (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `param_name` varchar(255) NOT NULL DEFAULT '',
                             `param_code` varchar(100) NOT NULL,
                             `param_value` varchar(2000) NOT NULL DEFAULT '',
                             `param_type` varchar(50) NOT NULL DEFAULT '',
                             `hide_value` int NOT NULL DEFAULT '0' COMMENT '是否隐藏显示敏感字段信息',
                             PRIMARY KEY (`id`) USING BTREE,
                             UNIQUE KEY `param_code` (`param_code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1231315 DEFAULT CHARSET=utf8mb3;

/*Data for the table `cc_params` */

insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (1,'电话工具条-外呼电话的解密key','phone_encrypted_key','123456','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (2,'录音保存路径','recording_path','/home/Records/','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (3,'是否开启立体音','enable_cc_record_stereo','false','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (4,'话单推送接口','post_cdr_url','http://127.0.0.1:8880/call-center/saveCdrTest','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (5,'录音类型','recordings_extension','wav','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (6,'可用的会议布局','conference_video_templates','480p,720p','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (8,'电话视频会议网关地址','conference_gateway_addr','192.168.67.210:5090','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (9,'视频会议录音/录像保存路径','conference_recording_path','/home/Records/conference/','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (10,'电话视频会议主叫','conference_gateway_caller','055164901409','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (11,'视频清晰度列表','video_level_id_list','42e00b, 42e00c, 42e00d, 42e014, 42e015, 42e016, 42e01e, 42e01f','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (12,'电话视频会议外呼的profile','conference_outboud_profile','external','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (7,'电话视频会议的布局列表','conference_video_layouts','2x2, 3x3, 1up_top_left+3','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (13,'转人工方式; gateway/acd','transfer-to-agent-type','gateway','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (52,'对话机器人类型; 大模型(LlmChat)/扣子智能体(Coze)','chat-bot-type','Coze','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (14,'转人工; 转接到外部网关的号码','transfer-to-agent-gateway-number','15005600328','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (15,'转人工; 转接到外部网关的配置','transfer-to-agent-gateway-info','gatewayAddr=192.168.14.252:5090&caller=64901409&profile=external&calleePrefix=','phone-bar',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (16,'是否启用通话监听','call_monitor_enabled','true','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (17,'FreeSWITCH日志路径','fs_log_file_path','/home/freeswitch/var/log/freeswitch/freeswitch.log','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (18,'call-center日志路径','cc_log_file_path','/home/call-center/logs/easycallcenter365.log','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (19,'是否启动双向asr语音识别并推送结果','fs_call_asr_enabled','false','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (20,'是否启用呼入电话排队监控','inbound_call_monitor_enabled','true','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (21,'Freeswitch的docker容器名称','fs_docker_container_name','freeswitch-debian12','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (22,'Freeswitch配置文件路径','fs_conf_directory','/home/freeswitch/etc/freeswitch','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (23,'大模型底座的 Api-key','model-api-key','Your model API Key','sys',1);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (24,'大模型底座的 地址','model-url','https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (25,'大模型底座的 名字','model-name','deepseek-v3','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (26,'语音识别类型; mrcp、websocket','robot-asr-type','websocket','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (28,'mrcp 语音识别请求参数','fs-asr-mrcp-param','unimrcp:aliyun hello hello','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (29,'机器人通话中，最大客户静默时长; 客户超时不讲话通话会被自动掐断','robot-max-no-speak-time','300','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (30,'呼入通话最大并发数限制','max-call-concurrency','100','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (31,'asr按需识别，仅在机器话术播报完毕后才启动','asr-pause-enabled','false','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (32,'检测到客户说话开始后，等待说话结束的最大时长;秒','max-wait-time-after-vad-start','15','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (33,'优先启用机器人接听电话','ai-answer-call-first','true','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (34,'呼入电话转接坐席超时时间; 秒','inbound-transfer-agent-timeout','30','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (35,'转接到坐席时，隐藏呼入号码','hide-inbound-number','true','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (36,'转接到坐席时，是否播报工号','inbound-play-opnum','true','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (37,'event socket ip address','event-socket-ip','127.0.0.1','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (38,'event socket port','event-socket-port','8021','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (39,'event socket password','event-socket-pass','ClueCon','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (40,'event socket connection pool size','event-socket-conn-pool-size','10','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (41,'最大坐席人数','max-agent-number','100','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (42,'解密并验证token的Key','ws-server-auth-token-secret','TeleRobot2048AbDfF@#!','sys',1);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (43,'(websocket server) 电话工具条端口','ws-server-port','1081','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (44,'是否开启vad智能等待','vad-intelligent-wait','false','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (45,'vad智能等待的毫秒数','vad-intelligent-wait-ms','600','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (46,'流式tts提供者名字','stream-tts-voice-source','aliyuntts','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (47,'流式tts发音人','stream-tts-voice-name','aixia','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (27,'知识库faq文档目录','model-faq-dir','/home/call-center/kb/','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (48,'智能体 coze-server-url','coze-server-url','https://api.coze.cn/v3/chat','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (49,'智能体 coze-pat-token','coze-pat-token','pat token string.....','sys',1);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (50,'智能体 coze-bot-id','coze-bot-id','7447790819148414***','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (51,'自定义对话接口地址','custom-robot-server-url','https://oa.test.com/chat.php','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (53,'COZE OAUTH 认证模式下的 CLIENT_ID','coze_jwt_oauth_client_id','1182131784***','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (54,'COZE OAUTH 认证模式下的 私钥','coze_jwt_oauth_private_key','-----BEGIN PRIVATE KEY-----\r\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCW2PEhI4xw6i37\r\n6NXf/rtmtLY+zkgqUTeEXbpG8y3Aa7k74ih2M7k1J2SHoSr30xZELtpQ05tmsgsa\r\nlYAfDfxgaXE3ywJiGE42Hb6G3xvplMSHk6FbFzDBcWD6WB3CWLsC0PFSqinbIMJ9\r\nQls6cpDvyncrcp2mWC7N/46lNNmyERudSvs2BoUeNVUn+6Ti/WNK9fMG4/YmxFx5\r\nRhxc+NoOfIVASx0qlZ4WWWawk9G2Gb/vFQcnIl3SGVLRO6G8f/zumdJBFstR9XK6\r\nsnSm3dROU3w9PiUkODLvr4c4l01RdUSih7E9byjteuUT9JE7SzHN1xsxwZBkmXwe\r\nRzDOawt9AgMBAAECggEAAVef2arOep4S162BjbM0vrFiom9vzp9CDmBOd919GDu9\r\nKQ5roWr3aG+Cd6nUTzfmeFKEaHi25snfIGxDzhhFQ88HDgyKkmM4pZxL0DkXBKk+\r\nux1yBPSmtJSfh3Vrml7zbGR96T2QuXLyrW5UOn0U02q/9w0s4EiOQ2X/7Ry/HSms\r\npRdIA5H0nq/4gOsuuUMNFZp/qVK5LNOjcLBrPjrb0Ph0NtYcYC9yC3NpRpDkelCd\r\nPR03QV3R8UcBbWAqaJJ8IakRx+kSLoI7wa0JDnYBoVEdlMd+rE+usjYU/FIWRdJz\r\nlQ4+ZBMnwW/sgrooNg6AHB7kBcMD2H4qoAEwWKPU6+9MixjdE9IzSzL/GQKBgQCg\r\nBka+sIVkjrLo4eyHqhPYWNgxyj1tHjUV/qwJ7gtrCW5mDuvdYlBEzK0/cj7jlkmW\r\nOJtgitHCvGhUNRAc512coGpr7bS9a6tpq9BsErZvYMfhbMTQi5Lok/djPhtIcnYZ\r\n7ZW47pFk3xWAslehnLiy492LSHTxAIKOOf33dTEOdQKBgQCGWz8kdz2pbSkDT36s\r\n4gyER48rxMECh0keIfKr+2JUInH0geXq2+ul0uasdPnZVvRPJQ5zWAFyRfh+w3zH\r\nR+KmsMFLcrChYDtVcw4XWeoisP97d7cUF1EdWP+tcU2MAUCSJDPMCB2pwyBgANg+\r\nCSDaqops6Vf8No4AXC0GkGLAUg==\r\n-----END PRIVATE KEY-----','sys',1);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (55,'COZE OAUTH 认证模式下的 公钥指纹','coze_jwt_oauth_public_key_id','n4BuIv2p2T-GurWev-Px_-FPfeJHkEJ-********','sys',1);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (56,'COZE_TOKEN_TYPE 可选值 oauth/pat','coze_token_type','pat','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (57,'MaxKB 的访问url','maxkb-server-url','http://222.134.154.142:8081/api/application/abbed614-2313-11f0-b414-0242ac110002/chat/completions','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (58,'MaxKB 的 API-Key','maxkb-api-key','**********************','sys',1);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (59,'MaxKB 的 model','maxkb-model','gemma3:12b','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (60,'机器人语音播报允许被打断','robot-speech-interrupt-allowed','true','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (61,'呼叫中心WebAPI的 server-port (只读)','call-center-server-port','8880','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (62,'FreeSWITCH 部署方式; docker/native','fs-deploy-type','docker','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (63,'FreeSWITCH native部署方式的启动脚本路径','fs-deploy-native-start-up-script','/usr/local/freeswitchvideo/bin/freeswitch.sh','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (64,'FreeSWITCH 程序根目录','fs-root-directory','/usr/local/freeswitchvideo/','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (65,'服务器对外暴露的IP地址','call-center-server-ip-addr','192.168.1.210','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (66,'呼叫中心电话工具条端口','call-center-websocket-port','1081','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (67,'当前软件的版本; 企业版/社区版  (只读)','current-software-version','enterprise','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (68,'语音通知的访问Token','call-center-api-token','sk-35ae192********************','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (69,'语音通知的可用线路并发数','voice-notification-thread-num','1','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (70,'语音通知的最大尝试外呼次数','voice-notification-max-retry','5','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (71,'语音通知的重新呼叫时间间隔; 单位分钟','voice-notification-retry-time-interval','5','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (72,'语音通知的外呼最大时效时间; 超过时效后不再拨打; 单位分钟','voice-notification-max-valid-time-len','60','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (73,'全局参数; 可用的最大外呼并发数','outbound-max-line-number','1000','batchcall',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (77,'群呼转人工坐席的场景下，是否开启预测外呼算法','outbound-enable-prediction-algorithm','false','batchcall',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (78,'阿里云tts账号参数json','aliyun-tts-account-json','{\"access_key_id\":\"LTAI5t**********\",\"app_key\":\"nbfbi********\",\"sample_rate\":\"16000\",\"voice_volume\":\"50\",\"write_pcm_enable\":\"0\",\"ws_conn_timeout_ms\":\"9000\",\"access_key_secret\":\"auOzNt*************\",\"speech_rate\":\"-100\",\"voice_name\":\"aixia\",\"server_url\":\"wss://nls-gateway.aliyuncs.com/ws/v1\",\"server_url_webapi\":\"https://nls-gateway.aliyuncs.com/stream/v1/tts\"}','tts',1);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (79,'空号识别功能是否开启','empty-number-detection-enabled','false','batchcall',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (80,'空号识别定义','empty-number-detection-config','[{\"key\":\"ASSISTANT\",\"code\":37,\"cat\":\"语音助手\",\"words\":\"留言,结束请挂机,语音信箱服务,语音助手,秘书,助理\"},{\"key\":\"NO_ANSWER\",\"code\":34,\"cat\":\"无人接听\",\"words\":\"无人接听,暂时无人\"},{\"key\":\"BUSY\",\"code\":31,\"cat\":\"占线\",\"words\":\"用户正忙,正在通话中,电话通话中,电话正在通话\"},{\"key\":\"EMPTY\",\"code\":33,\"cat\":\"空号\",\"words\":\"是空号,号码不存在\"},{\"key\":\"OFF\",\"code\":32,\"cat\":\"关机\",\"words\":\"用户已关机,电话已关机\"},{\"key\":\"STOP\",\"code\":35,\"cat\":\"停机\",\"words\":\"已停机,已暂停服务\"},{\"key\":\"NETWORK_BUSY\",\"code\":36,\"cat\":\"网络忙\",\"words\":\"网络忙\"},{\"key\":\"NOT_AVAILABLE\",\"code\":38,\"cat\":\"无法接通\",\"words\":\"暂时无法接通,不在服务区\"},{\"key\":\"REMINDER\",\"code\":30,\"cat\":\"来电提醒\",\"words\":\"来电提醒,来电信息将以短信,短信提醒,短信通知,短信的形式,启动通信助理\"},{\"key\":\"LIMIT\",\"code\":39,\"cat\":\"呼入限制\",\"words\":\"已呼入限制,已互祝限制\"}]','sys',0);
insert  into `cc_params`(`id`,`param_name`,`param_code`,`param_value`,`param_type`,`hide_value`) values (81,'打断忽略关键字列表默认值','default_interrupt_ignore_keywords','呃 哦 哦哦 嗯 嗯嗯 嗯好的 好的 对 对对 是的 明白 啊 这样啊 是这样啊这样的 您好 你好','sys',0);

/*Table structure for table `cc_tts_aliyun` */

DROP TABLE IF EXISTS `cc_tts_aliyun`;

CREATE TABLE `cc_tts_aliyun` (
                                 `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                 `voice_name` varchar(100) NOT NULL COMMENT 'tts发音人名称',
                                 `voice_code` varchar(100) NOT NULL COMMENT 'tts发音人代码',
                                 `voice_enabled` int NOT NULL DEFAULT '1' COMMENT '是否启用',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='阿里云音色列表';

/*Data for the table `cc_tts_aliyun` */

insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (5,'阿斌 - 广东普通话','abin',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (6,'知小白 - 普通话女声','zhixiaobai',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (7,'知小夏 - 普通话女声','zhixiaoxia',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (8,'知小妹 - 普通话女声','zhixiaomei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (9,'知柜 - 普通话女声','zhigui',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (10,'知硕 - 普通话男声','zhishuo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (11,'艾夏 - 普通话女声','aixia',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (12,'Cally - 美式英文女声','cally',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (13,'知锋_多情感 - 多种情感男声','zhifeng_emo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (14,'知冰_多情感 - 多种情感男声','zhibing_emo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (15,'知妙_多情感 - 多种情感女声','zhimiao_emo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (16,'知米_多情感 - 多种情感女声','zhimi_emo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (17,'知燕_多情感 - 多种情感女声','zhiyan_emo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (18,'知贝_多情感 - 多种情感童声','zhibei_emo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (19,'知甜_多情感 - 多种情感女声','zhitian_emo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (20,'小云 - 标准女声','xiaoyun',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (21,'小刚 - 标准男声','xiaogang',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (22,'若兮 - 温柔女声','ruoxi',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (23,'思琪 - 温柔女声','siqi',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (24,'思佳 - 标准女声','sijia',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (25,'思诚 - 标准男声','sicheng',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (26,'艾琪 - 温柔女声','aiqi',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (27,'艾佳 - 标准女声','aijia',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (28,'艾诚 - 标准男声','aicheng',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (29,'艾达 - 标准男声','aida',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (30,'宁儿 - 标准女声','ninger',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (31,'瑞琳 - 标准女声','ruilin',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (32,'思悦 - 温柔女声','siyue',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (33,'艾雅 - 严厉女声','aiya',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (34,'艾美 - 甜美女声','aimei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (35,'艾雨 - 自然女声','aiyu',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (36,'艾悦 - 温柔女声','aiyue',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (37,'艾婧 - 严厉女声','aijing',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (38,'小美 - 甜美女声','xiaomei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (39,'艾娜 - 浙普女声','aina',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (40,'伊娜 - 浙普女声','yina',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (41,'思婧 - 严厉女声','sijing',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (42,'思彤 - 儿童音','sitong',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (43,'小北 - 萝莉女声','xiaobei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (44,'艾彤 - 儿童音','aitong',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (45,'艾薇 - 萝莉女声','aiwei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (46,'艾宝 - 萝莉女声','aibao',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (47,'Harry - 英音男声','harry',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (48,'Abby - 美音女声','abby',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (49,'Andy - 美音男声','andy',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (50,'Eric - 英音男声','eric',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (51,'Emily - 英音女声','emily',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (52,'Luna - 英音女声','luna',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (53,'Luca - 英音男声','luca',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (54,'Wendy - 英音女声','wendy',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (55,'William - 英音男声','william',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (56,'Olivia - 英音女声','olivia',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (57,'姗姗 - 粤语女声','shanshan',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (58,'艾媛 - 知心姐姐','aiyuan',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (59,'艾颖 - 软萌童声','aiying',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (60,'艾祥 - 磁性男声','aixiang',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (61,'艾墨 - 情感男声','aimo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (62,'艾晔 - 青年男声','aiye',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (63,'艾婷 - 电台女声','aiting',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (64,'艾凡 - 情感女声','aifan',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (65,'Lydia - 英中双语女声','lydia',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (66,'小玥 - 四川话女声','chuangirl',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (67,'艾硕 - 自然男声','aishuo',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (68,'青青 - 中国台湾话女声','qingqing',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (69,'翠姐 - 东北话女声','cuijie',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (70,'小泽 - 湖南重口音男声','xiaoze',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (71,'艾楠 - 广告男声','ainan',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (72,'艾浩 - 资讯男声','aihao',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (73,'艾茗 - 诙谐男声','aiming',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (74,'艾笑 - 资讯女声','aixiao',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (75,'艾厨 - 舌尖男声','aichu',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (76,'艾倩 - 资讯女声','aiqian',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (77,'智香 - 日语女声','tomoka',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (78,'智也 - 日语男声','tomoya',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (79,'Annie - 美语女声','annie',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (80,'艾树 - 资讯男声','aishu',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (81,'艾茹 - 新闻女声','airu',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (82,'佳佳 - 粤语女声','jiajia',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (83,'Indah - 印尼语女声','indah',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (84,'桃子 - 粤语女声','taozi',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (85,'柜姐 - 亲切女声','guijie',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (86,'Stella - 知性女声','stella',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (87,'Stanley - 沉稳男声','stanley',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (88,'Kenny - 沉稳男声','kenny',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (89,'Rosa - 自然女声','rosa',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (90,'Farah - 马来语女声','farah',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (91,'马树 - 儿童剧男声','mashu',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (92,'知琪 - 温柔女声','zhiqi',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (93,'知厨 - 舌尖男声','zhichu',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (94,'小仙 - 亲切女声','xiaoxian',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (95,'悦儿 - 儿童剧女声','yuer',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (96,'猫小美 - 活力女声','maoxiaomei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (97,'知祥 - 磁性男声','zhixiang',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (98,'知佳 - 标准女声','zhijia',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (99,'知楠 - 广告男声','zhinan',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (100,'知倩 - 资讯女声','zhiqian',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (101,'知茹 - 新闻女声','zhiru',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (102,'知德 - 新闻男声','zhide',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (103,'知飞 - 激昂解说','zhifei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (104,'艾飞 - 激昂解说','aifei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (105,'亚群 - 卖场广播','yaqun',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (106,'巧薇 - 卖场广播','qiaowei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (107,'大虎 - 东北话男声','dahu',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (108,'ava - 美语女生','ava',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (109,'知伦 - 悬疑解说','zhilun',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (110,'艾伦 - 悬疑解说','ailun',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (111,'杰力豆 - 治愈童声','jielidou',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (112,'知薇 - 萝莉女声','zhiwei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (113,'老铁 - 东北老铁','laotie',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (114,'老妹 - 吆喝女声','laomei',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (115,'艾侃 - 天津话男声','aikan',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (116,'Tala - 菲律宾语女声','tala',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (117,'知甜 - 甜美女声','zhitian',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (118,'知青 - 中国台湾话女生','zhiqing',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (119,'Tien - 越南语女声','tien',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (120,'Becca - 美语客服女声','becca',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (121,'Kyong - 韩语女声','Kyong',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (122,'masha - 俄语女声','masha',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (123,'camila - 西班牙语女声','camila',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (124,'perla - 意大利语女声','perla',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (125,'知猫 - 普通话女声','zhimao',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (126,'知媛 - 普通话女声','zhiyuan',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (127,'知雅 - 普通话女声','zhiya',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (128,'知悦 - 普通话女声','zhiyue',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (129,'知达 - 普通话男声','zhida',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (130,'知莎 - 普通话女声','zhistella',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (131,'Kelly - 香港粤语女声','kelly',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (132,'clara - 法语女声','clara',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (133,'hanna - 德语女声','hanna',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (134,'waan - 泰语女声','waan',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (135,'betty - 美式英文女声','betty',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (136,'beth - 美式英文女声','beth',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (137,'cindy - 美式英文女声','cindy',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (138,'donna - 美式英文女声','donna',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (139,'eva - 美式英文女声','eva',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (140,'brian - 美式英文男声','brian',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (141,'david - 美式英文男声','david',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (142,'abby_ecmix - 美式英文女声','abby_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (143,'annie_ecmix - 美式英文女声','annie_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (144,'andy_ecmix - 美式英文男声','andy_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (145,'ava_ecmix - 美式英文女声','ava_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (146,'betty_ecmix - 美式英文女声','betty_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (147,'beth_ecmix - 美式英文女声','beth_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (148,'brian_ecmix - 美式英文男声','brian_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (149,'cindy_ecmix - 美式英文女声','cindy_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (150,'cally_ecmix - 美式英文女声','cally_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (151,'donna_ecmix - 美式英文女声','donna_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (152,'david_ecmix - 美式英文男声','david_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (153,'eva_ecmix - 美式英文女声','eva_ecmix',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (154,'zhaohai - 声音克隆测试','cosyvoice-v2-zhaohai-87b2dd0',1);

/*Table structure for table `ds_faq` */

DROP TABLE IF EXISTS `ds_faq`;

CREATE TABLE `ds_faq` (
                          `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                          `question` varchar(255) DEFAULT NULL COMMENT '问题',
                          `answer` text COMMENT '答案',
                          `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                          `del_flag` int DEFAULT NULL COMMENT '删除标志（1：删除，0：有效）',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='问答库';

/*Data for the table `ds_faq` */

/*Table structure for table `fs_variables` */

DROP TABLE IF EXISTS `fs_variables`;

CREATE TABLE `fs_variables` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `cat` int NOT NULL COMMENT '1. vars.xml  2. switch.conf.xml  3. profile 4. xunfei_asr  5. aliyun asr  ',
                                `var_field_name` varchar(100) NOT NULL COMMENT '变量的字段名称',
                                `var_field_alias` varchar(100) NOT NULL COMMENT '变量的别名',
                                PRIMARY KEY (`id`),
                                UNIQUE KEY `unique_index` (`cat`,`var_field_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `fs_variables` */

insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (1,1,'recording_path','录音/录像路径');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (2,1,'global_codec_prefs','全局编码');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (3,1,'outbound_codec_prefs','外呼编码');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (4,2,'loglevel','日志等级(INFO/DEBUG)');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (5,2,'sessions-per-second','每秒通话数');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (6,2,'rtp-start-port','rtp起始端口');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (7,2,'rtp-end-port','rtp结束端口');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (8,2,'core-db-dsn','数据库连接字符串');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (9,3,'context','拨号计划环境');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (10,3,'sip-port','sip端口');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (11,3,'rtp-ip','媒体监听地址');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (12,3,'sip-ip','sip监听地址');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (13,3,'ext-rtp-ip','对外媒体监听地址');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (14,3,'ext-sip-ip','对外sip监听地址');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (15,3,'ws-binding','网页电话端口(ws)');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (16,3,'wss-binding','网页电话端口(wss)');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (17,3,'auth-calls','启用呼叫鉴权');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (18,3,'accept-blind-call','接受盲呼叫');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (19,3,'accept-blind-reg','启用盲注册');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (20,3,'dtmf-type','数字按键检测方式');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (21,4,'sample_rate','音频采样率');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (22,4,'ws_conn_timeout_ms','websocket连接超时时间(毫秒)');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (23,4,'ws_conn_retry_max','websocket连接尝试次数');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (24,4,'Parse-Json','解析asr响应文本');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (25,4,'server_url','服务器地址');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (26,4,'log_asr_response','日志记录asr响应原始文本');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (27,2,'max-sessions','最大会话数');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (28,1,'default_country','默认国家/地区');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (29,1,'conference_recording_path','电话会议录音/录像路径');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (30,5,'sample_rate','音频采样率');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (31,5,'ws_conn_timeout_ms','websocket连接超时时间(毫秒)');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (32,5,'ws_conn_retry_max','websocket连接尝试次数');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (33,5,'Parse-Json','解析asr响应文本');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (34,5,'server_url','服务器地址');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (35,5,'log_asr_response','日志记录asr响应原始文本');
insert  into `fs_variables`(`id`,`cat`,`var_field_name`,`var_field_alias`) values (36,3,'odbc-dsn','数据库连接字符串');

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
                             `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
                             `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
                             `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
                             `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
                             `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
                             `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
                             `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
                             `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
                             `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
                             `function_name` varchar(100) DEFAULT NULL COMMENT '生成功能名',
                             `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
                             `form_col_num` int DEFAULT '1' COMMENT '表单布局（单列 双列 三列）',
                             `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                             `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                             `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
                             `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
                                    `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                    `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
                                    `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
                                    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
                                    `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
                                    `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
                                    `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
                                    `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
                                    `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
                                    `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
                                    `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                    `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                    `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
                                    `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
                                    `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                    `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                    `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
                                    `sort` int DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */


/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
                              `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-12-11 02:43:55','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-12-11 02:43:55','',NULL,'初始化密码 123456');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-12-11 02:43:56','',NULL,'深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-12-11 02:43:56','',NULL,'是否开启注册用户功能（true开启，false关闭）');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (5,'用户管理-密码字符范围','sys.account.chrtype','0','Y','admin','2024-12-11 02:43:56','',NULL,'默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (6,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2024-12-11 02:43:56','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (7,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2024-12-11 02:43:56','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (8,'主框架页-菜单导航显示风格','sys.index.menuStyle','default','Y','admin','2024-12-11 02:43:56','',NULL,'菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (9,'主框架页-是否开启页脚','sys.index.footer','true','Y','admin','2024-12-11 02:43:57','',NULL,'是否开启底部页脚显示（true显示，false隐藏）');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (10,'主框架页-是否开启页签','sys.index.tagsView','true','Y','admin','2024-12-11 02:43:57','',NULL,'是否开启菜单多页签显示（true显示，false隐藏）');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (11,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-12-11 02:43:57','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (12,'系统版本号','sys.version','v20250805','Y','admin','2025-08-04 05:57:40','',NULL,'系统版本号（每次版本升级需要更新该值）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
                            `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
                            `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
                            `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
                            `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
                            `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
                            `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                            `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (100,0,'0','easycallcenter365',0,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:28','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (101,100,'0,100','深圳总公司',1,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:28','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (102,100,'0,100','长沙分公司',2,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:28','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (103,101,'0,100,101','研发部门',1,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:28','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (104,101,'0,100,101','市场部门',2,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:29','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (105,101,'0,100,101','测试部门',3,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:29','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (106,101,'0,100,101','财务部门',4,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:29','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (107,101,'0,100,101','运维部门',5,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:29','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (108,102,'0,100,102','市场部门',1,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:29','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (109,102,'0,100,102','财务部门',2,'张三','15888888888','easycallcenter365@qq.com','0','0','admin','2024-12-11 02:42:30','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-12-11 02:43:46','',NULL,'性别男');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,2,'女','1','sys_user_sex','','','N','0','admin','2024-12-11 02:43:46','',NULL,'性别女');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-12-11 02:43:46','',NULL,'性别未知');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-12-11 02:43:47','',NULL,'显示菜单');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-12-11 02:43:47','',NULL,'隐藏菜单');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-12-11 02:43:47','',NULL,'正常状态');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-12-11 02:43:47','',NULL,'停用状态');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-12-11 02:43:47','',NULL,'正常状态');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-12-11 02:43:48','',NULL,'停用状态');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-12-11 02:43:48','',NULL,'默认分组');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-12-11 02:43:48','',NULL,'系统分组');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-12-11 02:43:48','',NULL,'系统默认是');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-12-11 02:43:49','',NULL,'系统默认否');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-12-11 02:43:49','',NULL,'通知');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-12-11 02:43:49','',NULL,'公告');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-12-11 02:43:49','',NULL,'正常状态');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-12-11 02:43:49','',NULL,'关闭状态');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-12-11 02:43:50','',NULL,'其他操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-12-11 02:43:50','',NULL,'新增操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-12-11 02:43:50','',NULL,'修改操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-12-11 02:43:50','',NULL,'删除操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-12-11 02:43:50','',NULL,'授权操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-12-11 02:43:50','',NULL,'导出操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-12-11 02:43:51','',NULL,'导入操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-12-11 02:43:51','',NULL,'强退操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-12-11 02:43:51','',NULL,'生成操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-12-11 02:43:51','',NULL,'清空操作');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-12-11 02:43:51','',NULL,'正常状态');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-12-11 02:43:51','',NULL,'停用状态');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
                                 `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                 `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_id`),
                                 UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'用户性别','sys_user_sex','0','admin','2024-12-11 02:43:39','',NULL,'用户性别列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'菜单状态','sys_show_hide','0','admin','2024-12-11 02:43:39','',NULL,'菜单状态列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'系统开关','sys_normal_disable','0','admin','2024-12-11 02:43:40','',NULL,'系统开关列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,'任务状态','sys_job_status','0','admin','2024-12-11 02:43:40','',NULL,'任务状态列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (5,'任务分组','sys_job_group','0','admin','2024-12-11 02:43:41','',NULL,'任务分组列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (6,'系统是否','sys_yes_no','0','admin','2024-12-11 02:43:41','',NULL,'系统是否列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (7,'通知类型','sys_notice_type','0','admin','2024-12-11 02:43:41','',NULL,'通知类型列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (8,'通知状态','sys_notice_status','0','admin','2024-12-11 02:43:42','',NULL,'通知状态列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (9,'操作类型','sys_oper_type','0','admin','2024-12-11 02:43:42','',NULL,'操作类型列表');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (10,'系统状态','sys_common_status','0','admin','2024-12-11 02:43:42','',NULL,'登录状态列表');

/*Table structure for table `sys_division_data` */

DROP TABLE IF EXISTS `sys_division_data`;

CREATE TABLE `sys_division_data` (
                                     `id` varchar(255) DEFAULT NULL COMMENT '主键id',
                                     `pid` varchar(255) DEFAULT NULL COMMENT '父级id',
                                     `deep` double DEFAULT NULL COMMENT '级别（0:省级, 1:市级 ,2:县级）',
                                     `name` varchar(255) DEFAULT NULL COMMENT '名称',
                                     `pinyin_prefix` varchar(255) DEFAULT NULL COMMENT '拼音前缀',
                                     `pinyin` varchar(255) DEFAULT NULL COMMENT '拼音',
                                     `ext_id` varchar(255) DEFAULT NULL COMMENT '行政编号',
                                     `ext_name` varchar(255) DEFAULT NULL COMMENT '行政名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='行政区划3级';

/*Data for the table `sys_division_data` */

insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('11','0',0,'北京','b','bei jing','110000000000','北京市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1101','11',1,'北京','b','bei jing','110100000000','北京市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110101','1101',2,'东城','d','dong cheng','110101000000','东城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110102','1101',2,'西城','x','xi cheng','110102000000','西城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110105','1101',2,'朝阳','c','chao yang','110105000000','朝阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110106','1101',2,'丰台','f','feng tai','110106000000','丰台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110107','1101',2,'石景山','s','shi jing shan','110107000000','石景山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110108','1101',2,'海淀','h','hai dian','110108000000','海淀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110109','1101',2,'门头沟','m','men tou gou','110109000000','门头沟区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110111','1101',2,'房山','f','fang shan','110111000000','房山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110112','1101',2,'通州','t','tong zhou','110112000000','通州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110113','1101',2,'顺义','s','shun yi','110113000000','顺义区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110114','1101',2,'昌平','c','chang ping','110114000000','昌平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110115','1101',2,'大兴','d','da xing','110115000000','大兴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110116','1101',2,'怀柔','h','huai rou','110116000000','怀柔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110117','1101',2,'平谷','p','ping gu','110117000000','平谷区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110118','1101',2,'密云','m','mi yun','110118000000','密云区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('110119','1101',2,'延庆','y','yan qing','110119000000','延庆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('12','0',0,'天津','t','tian jin','120000000000','天津市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1201','12',1,'天津','t','tian jin','120100000000','天津市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120101','1201',2,'和平','h','he ping','120101000000','和平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120102','1201',2,'河东','h','he dong','120102000000','河东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120103','1201',2,'河西','h','he xi','120103000000','河西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120104','1201',2,'南开','n','nan kai','120104000000','南开区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120105','1201',2,'河北','h','he bei','120105000000','河北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120106','1201',2,'红桥','h','hong qiao','120106000000','红桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120110','1201',2,'东丽','d','dong li','120110000000','东丽区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120111','1201',2,'西青','x','xi qing','120111000000','西青区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120112','1201',2,'津南','j','jin nan','120112000000','津南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120113','1201',2,'北辰','b','bei chen','120113000000','北辰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120114','1201',2,'武清','w','wu qing','120114000000','武清区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120115','1201',2,'宝坻','b','bao di','120115000000','宝坻区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120116','1201',2,'滨海新区','b','bin hai xin qu','120116000000','滨海新区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120117','1201',2,'宁河','n','ning he','120117000000','宁河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120118','1201',2,'静海','j','jing hai','120118000000','静海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('120119','1201',2,'蓟州','j','ji zhou','120119000000','蓟州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('13','0',0,'河北','h','he bei','130000000000','河北省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1301','13',1,'石家庄','s','shi jia zhuang','130100000000','石家庄市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130102','1301',2,'长安','c','chang an','130102000000','长安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130104','1301',2,'桥西','q','qiao xi','130104000000','桥西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130105','1301',2,'新华','x','xin hua','130105000000','新华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130107','1301',2,'井陉矿区','j','jing xing kuang qu','130107000000','井陉矿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130108','1301',2,'裕华','y','yu hua','130108000000','裕华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130109','1301',2,'藁城','g','gao cheng','130109000000','藁城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130110','1301',2,'鹿泉','l','lu quan','130110000000','鹿泉区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130111','1301',2,'栾城','l','luan cheng','130111000000','栾城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130121','1301',2,'井陉','j','jing xing','130121000000','井陉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130123','1301',2,'正定','z','zheng ding','130123000000','正定县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130125','1301',2,'行唐','x','xing tang','130125000000','行唐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130126','1301',2,'灵寿','l','ling shou','130126000000','灵寿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130127','1301',2,'高邑','g','gao yi','130127000000','高邑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130128','1301',2,'深泽','s','shen ze','130128000000','深泽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130129','1301',2,'赞皇','z','zan huang','130129000000','赞皇县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130130','1301',2,'无极','w','wu ji','130130000000','无极县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130131','1301',2,'平山','p','ping shan','130131000000','平山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130132','1301',2,'元氏','y','yuan shi','130132000000','元氏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130133','1301',2,'赵县','z','zhao xian','130133000000','赵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130181','1301',2,'辛集','x','xin ji','130181000000','辛集市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130183','1301',2,'晋州','j','jin zhou','130183000000','晋州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130184','1301',2,'新乐','x','xin le','130184000000','新乐市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1302','13',1,'唐山','t','tang shan','130200000000','唐山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130202','1302',2,'路南','l','lu nan','130202000000','路南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130203','1302',2,'路北','l','lu bei','130203000000','路北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130204','1302',2,'古冶','g','gu ye','130204000000','古冶区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130205','1302',2,'开平','k','kai ping','130205000000','开平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130207','1302',2,'丰南','f','feng nan','130207000000','丰南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130208','1302',2,'丰润','f','feng run','130208000000','丰润区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130209','1302',2,'曹妃甸','c','cao fei dian','130209000000','曹妃甸区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130224','1302',2,'滦南','l','luan nan','130224000000','滦南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130225','1302',2,'乐亭','l','lao ting','130225000000','乐亭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130227','1302',2,'迁西','q','qian xi','130227000000','迁西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130229','1302',2,'玉田','y','yu tian','130229000000','玉田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130281','1302',2,'遵化','z','zun hua','130281000000','遵化市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130283','1302',2,'迁安','q','qian an','130283000000','迁安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130284','1302',2,'滦州','l','luan zhou','130284000000','滦州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1303','13',1,'秦皇岛','q','qin huang dao','130300000000','秦皇岛市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130302','1303',2,'海港','h','hai gang','130302000000','海港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130303','1303',2,'山海关','s','shan hai guan','130303000000','山海关区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130304','1303',2,'北戴河','b','bei dai he','130304000000','北戴河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130306','1303',2,'抚宁','f','fu ning','130306000000','抚宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130321','1303',2,'青龙','q','qing long','130321000000','青龙满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130322','1303',2,'昌黎','c','chang li','130322000000','昌黎县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130324','1303',2,'卢龙','l','lu long','130324000000','卢龙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1304','13',1,'邯郸','h','han dan','130400000000','邯郸市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130402','1304',2,'邯山','h','han shan','130402000000','邯山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130403','1304',2,'丛台','c','cong tai','130403000000','丛台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130404','1304',2,'复兴','f','fu xing','130404000000','复兴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130406','1304',2,'峰峰矿区','f','feng feng kuang qu','130406000000','峰峰矿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130407','1304',2,'肥乡','f','fei xiang','130407000000','肥乡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130408','1304',2,'永年','y','yong nian','130408000000','永年区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130423','1304',2,'临漳','l','lin zhang','130423000000','临漳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130424','1304',2,'成安','c','cheng an','130424000000','成安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130425','1304',2,'大名','d','da ming','130425000000','大名县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130426','1304',2,'涉县','s','she xian','130426000000','涉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130427','1304',2,'磁县','c','ci xian','130427000000','磁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130430','1304',2,'邱县','q','qiu xian','130430000000','邱县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130431','1304',2,'鸡泽','j','ji ze','130431000000','鸡泽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130432','1304',2,'广平','g','guang ping','130432000000','广平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130433','1304',2,'馆陶','g','guan tao','130433000000','馆陶县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130434','1304',2,'魏县','w','wei xian','130434000000','魏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130435','1304',2,'曲周','q','qu zhou','130435000000','曲周县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130481','1304',2,'武安','w','wu an','130481000000','武安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1305','13',1,'邢台','x','xing tai','130500000000','邢台市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130502','1305',2,'襄都','x','xiang du','130502000000','襄都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130503','1305',2,'信都','x','xin du','130503000000','信都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130505','1305',2,'任泽','r','ren ze','130505000000','任泽区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130506','1305',2,'南和','n','nan he','130506000000','南和区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130522','1305',2,'临城','l','lin cheng','130522000000','临城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130523','1305',2,'内丘','n','nei qiu','130523000000','内丘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130524','1305',2,'柏乡','b','bai xiang','130524000000','柏乡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130525','1305',2,'隆尧','l','long yao','130525000000','隆尧县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130528','1305',2,'宁晋','n','ning jin','130528000000','宁晋县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130529','1305',2,'巨鹿','j','ju lu','130529000000','巨鹿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130530','1305',2,'新河','x','xin he','130530000000','新河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130531','1305',2,'广宗','g','guang zong','130531000000','广宗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130532','1305',2,'平乡','p','ping xiang','130532000000','平乡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130533','1305',2,'威县','w','wei xian','130533000000','威县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130534','1305',2,'清河','q','qing he','130534000000','清河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130535','1305',2,'临西','l','lin xi','130535000000','临西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130581','1305',2,'南宫','n','nan gong','130581000000','南宫市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130582','1305',2,'沙河','s','sha he','130582000000','沙河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1306','13',1,'保定','b','bao ding','130600000000','保定市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130602','1306',2,'竞秀','j','jing xiu','130602000000','竞秀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130606','1306',2,'莲池','l','lian chi','130606000000','莲池区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130607','1306',2,'满城','m','man cheng','130607000000','满城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130608','1306',2,'清苑','q','qing yuan','130608000000','清苑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130609','1306',2,'徐水','x','xu shui','130609000000','徐水区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130623','1306',2,'涞水','l','lai shui','130623000000','涞水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130624','1306',2,'阜平','f','fu ping','130624000000','阜平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130626','1306',2,'定兴','d','ding xing','130626000000','定兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130627','1306',2,'唐县','t','tang xian','130627000000','唐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130628','1306',2,'高阳','g','gao yang','130628000000','高阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130629','1306',2,'容城','r','rong cheng','130629000000','容城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130630','1306',2,'涞源','l','lai yuan','130630000000','涞源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130631','1306',2,'望都','w','wang du','130631000000','望都县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130632','1306',2,'安新','a','an xin','130632000000','安新县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130633','1306',2,'易县','y','yi xian','130633000000','易县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130634','1306',2,'曲阳','q','qu yang','130634000000','曲阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130635','1306',2,'蠡县','l','li xian','130635000000','蠡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130636','1306',2,'顺平','s','shun ping','130636000000','顺平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130637','1306',2,'博野','b','bo ye','130637000000','博野县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130638','1306',2,'雄县','x','xiong xian','130638000000','雄县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130681','1306',2,'涿州','z','zhuo zhou','130681000000','涿州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130682','1306',2,'定州','d','ding zhou','130682000000','定州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130683','1306',2,'安国','a','an guo','130683000000','安国市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130684','1306',2,'高碑店','g','gao bei dian','130684000000','高碑店市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1307','13',1,'张家口','z','zhang jia kou','130700000000','张家口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130702','1307',2,'桥东','q','qiao dong','130702000000','桥东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130703','1307',2,'桥西','q','qiao xi','130703000000','桥西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130705','1307',2,'宣化','x','xuan hua','130705000000','宣化区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130706','1307',2,'下花园','x','xia hua yuan','130706000000','下花园区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130708','1307',2,'万全','w','wan quan','130708000000','万全区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130709','1307',2,'崇礼','c','chong li','130709000000','崇礼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130722','1307',2,'张北','z','zhang bei','130722000000','张北县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130723','1307',2,'康保','k','kang bao','130723000000','康保县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130724','1307',2,'沽源','g','gu yuan','130724000000','沽源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130725','1307',2,'尚义','s','shang yi','130725000000','尚义县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130726','1307',2,'蔚县','y','yu xian','130726000000','蔚县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130727','1307',2,'阳原','y','yang yuan','130727000000','阳原县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130728','1307',2,'怀安','h','huai an','130728000000','怀安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130730','1307',2,'怀来','h','huai lai','130730000000','怀来县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130731','1307',2,'涿鹿','z','zhuo lu','130731000000','涿鹿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130732','1307',2,'赤城','c','chi cheng','130732000000','赤城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1308','13',1,'承德','c','cheng de','130800000000','承德市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130802','1308',2,'双桥','s','shuang qiao','130802000000','双桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130803','1308',2,'双滦','s','shuang luan','130803000000','双滦区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130804','1308',2,'鹰手营子矿区','y','ying shou ying zi kuang qu','130804000000','鹰手营子矿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130821','1308',2,'承德县','c','cheng de xian','130821000000','承德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130822','1308',2,'兴隆','x','xing long','130822000000','兴隆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130824','1308',2,'滦平','l','luan ping','130824000000','滦平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130825','1308',2,'隆化','l','long hua','130825000000','隆化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130826','1308',2,'丰宁','f','feng ning','130826000000','丰宁满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130827','1308',2,'宽城','k','kuan cheng','130827000000','宽城满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130828','1308',2,'围场','w','wei chang','130828000000','围场满族蒙古族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130881','1308',2,'平泉','p','ping quan','130881000000','平泉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1309','13',1,'沧州','c','cang zhou','130900000000','沧州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130902','1309',2,'新华','x','xin hua','130902000000','新华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130903','1309',2,'运河','y','yun he','130903000000','运河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130921','1309',2,'沧县','c','cang xian','130921000000','沧县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130922','1309',2,'青县','q','qing xian','130922000000','青县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130923','1309',2,'东光','d','dong guang','130923000000','东光县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130924','1309',2,'海兴','h','hai xing','130924000000','海兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130925','1309',2,'盐山','y','yan shan','130925000000','盐山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130926','1309',2,'肃宁','s','su ning','130926000000','肃宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130927','1309',2,'南皮','n','nan pi','130927000000','南皮县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130928','1309',2,'吴桥','w','wu qiao','130928000000','吴桥县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130929','1309',2,'献县','x','xian xian','130929000000','献县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130930','1309',2,'孟村','m','meng cun','130930000000','孟村回族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130981','1309',2,'泊头','b','bo tou','130981000000','泊头市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130982','1309',2,'任丘','r','ren qiu','130982000000','任丘市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130983','1309',2,'黄骅','h','huang hua','130983000000','黄骅市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('130984','1309',2,'河间','h','he jian','130984000000','河间市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1310','13',1,'廊坊','l','lang fang','131000000000','廊坊市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131002','1310',2,'安次','a','an ci','131002000000','安次区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131003','1310',2,'广阳','g','guang yang','131003000000','广阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131022','1310',2,'固安','g','gu an','131022000000','固安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131023','1310',2,'永清','y','yong qing','131023000000','永清县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131024','1310',2,'香河','x','xiang he','131024000000','香河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131025','1310',2,'大城','d','da cheng','131025000000','大城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131026','1310',2,'文安','w','wen an','131026000000','文安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131028','1310',2,'大厂','d','da chang','131028000000','大厂回族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131081','1310',2,'霸州','b','ba zhou','131081000000','霸州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131082','1310',2,'三河','s','san he','131082000000','三河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1311','13',1,'衡水','h','heng shui','131100000000','衡水市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131102','1311',2,'桃城','t','tao cheng','131102000000','桃城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131103','1311',2,'冀州','j','ji zhou','131103000000','冀州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131121','1311',2,'枣强','z','zao qiang','131121000000','枣强县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131122','1311',2,'武邑','w','wu yi','131122000000','武邑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131123','1311',2,'武强','w','wu qiang','131123000000','武强县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131124','1311',2,'饶阳','r','rao yang','131124000000','饶阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131125','1311',2,'安平','a','an ping','131125000000','安平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131126','1311',2,'故城','g','gu cheng','131126000000','故城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131127','1311',2,'景县','j','jing xian','131127000000','景县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131128','1311',2,'阜城','f','fu cheng','131128000000','阜城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('131182','1311',2,'深州','s','shen zhou','131182000000','深州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('14','0',0,'山西','s','shan xi','140000000000','山西省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1401','14',1,'太原','t','tai yuan','140100000000','太原市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140105','1401',2,'小店','x','xiao dian','140105000000','小店区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140106','1401',2,'迎泽','y','ying ze','140106000000','迎泽区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140107','1401',2,'杏花岭','x','xing hua ling','140107000000','杏花岭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140108','1401',2,'尖草坪','j','jian cao ping','140108000000','尖草坪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140109','1401',2,'万柏林','w','wan bai lin','140109000000','万柏林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140110','1401',2,'晋源','j','jin yuan','140110000000','晋源区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140121','1401',2,'清徐','q','qing xu','140121000000','清徐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140122','1401',2,'阳曲','y','yang qu','140122000000','阳曲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140123','1401',2,'娄烦','l','lou fan','140123000000','娄烦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140181','1401',2,'古交','g','gu jiao','140181000000','古交市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1402','14',1,'大同','d','da tong','140200000000','大同市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140212','1402',2,'新荣','x','xin rong','140212000000','新荣区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140213','1402',2,'平城','p','ping cheng','140213000000','平城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140214','1402',2,'云冈','y','yun gang','140214000000','云冈区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140215','1402',2,'云州','y','yun zhou','140215000000','云州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140221','1402',2,'阳高','y','yang gao','140221000000','阳高县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140222','1402',2,'天镇','t','tian zhen','140222000000','天镇县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140223','1402',2,'广灵','g','guang ling','140223000000','广灵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140224','1402',2,'灵丘','l','ling qiu','140224000000','灵丘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140225','1402',2,'浑源','h','hun yuan','140225000000','浑源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140226','1402',2,'左云','z','zuo yun','140226000000','左云县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1403','14',1,'阳泉','y','yang quan','140300000000','阳泉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140302','1403',2,'城区','c','cheng qu','140302000000','城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140303','1403',2,'矿区','k','kuang qu','140303000000','矿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140311','1403',2,'郊区','j','jiao qu','140311000000','郊区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140321','1403',2,'平定','p','ping ding','140321000000','平定县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140322','1403',2,'盂县','y','yu xian','140322000000','盂县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1404','14',1,'长治','c','chang zhi','140400000000','长治市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140403','1404',2,'潞州','l','lu zhou','140403000000','潞州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140404','1404',2,'上党','s','shang dang','140404000000','上党区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140405','1404',2,'屯留','t','tun liu','140405000000','屯留区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140406','1404',2,'潞城','l','lu cheng','140406000000','潞城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140423','1404',2,'襄垣','x','xiang yuan','140423000000','襄垣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140425','1404',2,'平顺','p','ping shun','140425000000','平顺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140426','1404',2,'黎城','l','li cheng','140426000000','黎城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140427','1404',2,'壶关','h','hu guan','140427000000','壶关县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140428','1404',2,'长子','z','zhang zi','140428000000','长子县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140429','1404',2,'武乡','w','wu xiang','140429000000','武乡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140430','1404',2,'沁县','q','qin xian','140430000000','沁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140431','1404',2,'沁源','q','qin yuan','140431000000','沁源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1405','14',1,'晋城','j','jin cheng','140500000000','晋城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140502','1405',2,'城区','c','cheng qu','140502000000','城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140521','1405',2,'沁水','q','qin shui','140521000000','沁水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140522','1405',2,'阳城','y','yang cheng','140522000000','阳城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140524','1405',2,'陵川','l','ling chuan','140524000000','陵川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140525','1405',2,'泽州','z','ze zhou','140525000000','泽州县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140581','1405',2,'高平','g','gao ping','140581000000','高平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1406','14',1,'朔州','s','shuo zhou','140600000000','朔州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140602','1406',2,'朔城','s','shuo cheng','140602000000','朔城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140603','1406',2,'平鲁','p','ping lu','140603000000','平鲁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140621','1406',2,'山阴','s','shan yin','140621000000','山阴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140622','1406',2,'应县','y','ying xian','140622000000','应县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140623','1406',2,'右玉','y','you yu','140623000000','右玉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140681','1406',2,'怀仁','h','huai ren','140681000000','怀仁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1407','14',1,'晋中','j','jin zhong','140700000000','晋中市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140702','1407',2,'榆次','y','yu ci','140702000000','榆次区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140703','1407',2,'太谷','t','tai gu','140703000000','太谷区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140721','1407',2,'榆社','y','yu she','140721000000','榆社县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140722','1407',2,'左权','z','zuo quan','140722000000','左权县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140723','1407',2,'和顺','h','he shun','140723000000','和顺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140724','1407',2,'昔阳','x','xi yang','140724000000','昔阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140725','1407',2,'寿阳','s','shou yang','140725000000','寿阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140727','1407',2,'祁县','q','qi xian','140727000000','祁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140728','1407',2,'平遥','p','ping yao','140728000000','平遥县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140729','1407',2,'灵石','l','ling shi','140729000000','灵石县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140781','1407',2,'介休','j','jie xiu','140781000000','介休市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1408','14',1,'运城','y','yun cheng','140800000000','运城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140802','1408',2,'盐湖','y','yan hu','140802000000','盐湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140821','1408',2,'临猗','l','lin yi','140821000000','临猗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140822','1408',2,'万荣','w','wan rong','140822000000','万荣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140823','1408',2,'闻喜','w','wen xi','140823000000','闻喜县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140824','1408',2,'稷山','j','ji shan','140824000000','稷山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140825','1408',2,'新绛','x','xin jiang','140825000000','新绛县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140826','1408',2,'绛县','j','jiang xian','140826000000','绛县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140827','1408',2,'垣曲','y','yuan qu','140827000000','垣曲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140828','1408',2,'夏县','x','xia xian','140828000000','夏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140829','1408',2,'平陆','p','ping lu','140829000000','平陆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140830','1408',2,'芮城','r','rui cheng','140830000000','芮城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140881','1408',2,'永济','y','yong ji','140881000000','永济市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140882','1408',2,'河津','h','he jin','140882000000','河津市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1409','14',1,'忻州','x','xin zhou','140900000000','忻州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140902','1409',2,'忻府','x','xin fu','140902000000','忻府区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140921','1409',2,'定襄','d','ding xiang','140921000000','定襄县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140922','1409',2,'五台','w','wu tai','140922000000','五台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140923','1409',2,'代县','d','dai xian','140923000000','代县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140924','1409',2,'繁峙','f','fan shi','140924000000','繁峙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140925','1409',2,'宁武','n','ning wu','140925000000','宁武县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140926','1409',2,'静乐','j','jing le','140926000000','静乐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140927','1409',2,'神池','s','shen chi','140927000000','神池县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140928','1409',2,'五寨','w','wu zhai','140928000000','五寨县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140929','1409',2,'岢岚','k','ke lan','140929000000','岢岚县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140930','1409',2,'河曲','h','he qu','140930000000','河曲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140931','1409',2,'保德','b','bao de','140931000000','保德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140932','1409',2,'偏关','p','pian guan','140932000000','偏关县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('140981','1409',2,'原平','y','yuan ping','140981000000','原平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1410','14',1,'临汾','l','lin fen','141000000000','临汾市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141002','1410',2,'尧都','y','yao du','141002000000','尧都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141021','1410',2,'曲沃','q','qu wo','141021000000','曲沃县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141022','1410',2,'翼城','y','yi cheng','141022000000','翼城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141023','1410',2,'襄汾','x','xiang fen','141023000000','襄汾县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141024','1410',2,'洪洞','h','hong tong','141024000000','洪洞县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141025','1410',2,'古县','g','gu xian','141025000000','古县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141026','1410',2,'安泽','a','an ze','141026000000','安泽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141027','1410',2,'浮山','f','fu shan','141027000000','浮山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141028','1410',2,'吉县','j','ji xian','141028000000','吉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141029','1410',2,'乡宁','x','xiang ning','141029000000','乡宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141030','1410',2,'大宁','d','da ning','141030000000','大宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141031','1410',2,'隰县','x','xi xian','141031000000','隰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141032','1410',2,'永和','y','yong he','141032000000','永和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141033','1410',2,'蒲县','p','pu xian','141033000000','蒲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141034','1410',2,'汾西','f','fen xi','141034000000','汾西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141081','1410',2,'侯马','h','hou ma','141081000000','侯马市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141082','1410',2,'霍州','h','huo zhou','141082000000','霍州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1411','14',1,'吕梁','l','lv liang','141100000000','吕梁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141102','1411',2,'离石','l','li shi','141102000000','离石区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141121','1411',2,'文水','w','wen shui','141121000000','文水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141122','1411',2,'交城','j','jiao cheng','141122000000','交城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141123','1411',2,'兴县','x','xing xian','141123000000','兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141124','1411',2,'临县','l','lin xian','141124000000','临县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141125','1411',2,'柳林','l','liu lin','141125000000','柳林县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141126','1411',2,'石楼','s','shi lou','141126000000','石楼县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141127','1411',2,'岚县','l','lan xian','141127000000','岚县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141128','1411',2,'方山','f','fang shan','141128000000','方山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141129','1411',2,'中阳','z','zhong yang','141129000000','中阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141130','1411',2,'交口','j','jiao kou','141130000000','交口县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141181','1411',2,'孝义','x','xiao yi','141181000000','孝义市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('141182','1411',2,'汾阳','f','fen yang','141182000000','汾阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('15','0',0,'内蒙古','n','nei meng gu','150000000000','内蒙古自治区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1501','15',1,'呼和浩特','h','hu he hao te','150100000000','呼和浩特市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150102','1501',2,'新城','x','xin cheng','150102000000','新城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150103','1501',2,'回民','h','hui min','150103000000','回民区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150104','1501',2,'玉泉','y','yu quan','150104000000','玉泉区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150105','1501',2,'赛罕','s','sai han','150105000000','赛罕区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150121','1501',2,'土默特左旗','t','tu mo te zuo qi','150121000000','土默特左旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150122','1501',2,'托克托','t','tuo ke tuo','150122000000','托克托县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150123','1501',2,'和林格尔','h','he lin ge er','150123000000','和林格尔县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150124','1501',2,'清水河','q','qing shui he','150124000000','清水河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150125','1501',2,'武川','w','wu chuan','150125000000','武川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1502','15',1,'包头','b','bao tou','150200000000','包头市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150202','1502',2,'东河','d','dong he','150202000000','东河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150203','1502',2,'昆都仑','k','kun du lun','150203000000','昆都仑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150204','1502',2,'青山','q','qing shan','150204000000','青山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150205','1502',2,'石拐','s','shi guai','150205000000','石拐区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150206','1502',2,'白云鄂博矿区','b','bai yun e bo kuang qu','150206000000','白云鄂博矿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150207','1502',2,'九原','j','jiu yuan','150207000000','九原区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150221','1502',2,'土默特右旗','t','tu mo te you qi','150221000000','土默特右旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150222','1502',2,'固阳','g','gu yang','150222000000','固阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150223','1502',2,'达尔罕茂明安联合旗','d','da er han mao ming an lian he qi','150223000000','达尔罕茂明安联合旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1503','15',1,'乌海','w','wu hai','150300000000','乌海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150302','1503',2,'海勃湾','h','hai bo wan','150302000000','海勃湾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150303','1503',2,'海南','h','hai nan','150303000000','海南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150304','1503',2,'乌达','w','wu da','150304000000','乌达区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1504','15',1,'赤峰','c','chi feng','150400000000','赤峰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150402','1504',2,'红山','h','hong shan','150402000000','红山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150403','1504',2,'元宝山','y','yuan bao shan','150403000000','元宝山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150404','1504',2,'松山','s','song shan','150404000000','松山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150421','1504',2,'阿鲁科尔沁旗','a','a lu ke er qin qi','150421000000','阿鲁科尔沁旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150422','1504',2,'巴林左旗','b','ba lin zuo qi','150422000000','巴林左旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150423','1504',2,'巴林右旗','b','ba lin you qi','150423000000','巴林右旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150424','1504',2,'林西','l','lin xi','150424000000','林西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150425','1504',2,'克什克腾旗','k','ke shi ke teng qi','150425000000','克什克腾旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150426','1504',2,'翁牛特旗','w','weng niu te qi','150426000000','翁牛特旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150428','1504',2,'喀喇沁旗','k','ka la qin qi','150428000000','喀喇沁旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150429','1504',2,'宁城','n','ning cheng','150429000000','宁城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150430','1504',2,'敖汉旗','a','ao han qi','150430000000','敖汉旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1505','15',1,'通辽','t','tong liao','150500000000','通辽市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150502','1505',2,'科尔沁','k','ke er qin','150502000000','科尔沁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150521','1505',2,'科尔沁左翼中旗','k','ke er qin zuo yi zhong qi','150521000000','科尔沁左翼中旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150522','1505',2,'科尔沁左翼后旗','k','ke er qin zuo yi hou qi','150522000000','科尔沁左翼后旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150523','1505',2,'开鲁','k','kai lu','150523000000','开鲁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150524','1505',2,'库伦旗','k','ku lun qi','150524000000','库伦旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150525','1505',2,'奈曼旗','n','nai man qi','150525000000','奈曼旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150526','1505',2,'扎鲁特旗','z','zha lu te qi','150526000000','扎鲁特旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150581','1505',2,'霍林郭勒','h','huo lin guo le','150581000000','霍林郭勒市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1506','15',1,'鄂尔多斯','e','e er duo si','150600000000','鄂尔多斯市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150602','1506',2,'东胜','d','dong sheng','150602000000','东胜区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150603','1506',2,'康巴什','k','kang ba shi','150603000000','康巴什区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150621','1506',2,'达拉特旗','d','da la te qi','150621000000','达拉特旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150622','1506',2,'准格尔旗','z','zhun ge er qi','150622000000','准格尔旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150623','1506',2,'鄂托克前旗','e','e tuo ke qian qi','150623000000','鄂托克前旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150624','1506',2,'鄂托克旗','e','e tuo ke qi','150624000000','鄂托克旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150625','1506',2,'杭锦旗','h','hang jin qi','150625000000','杭锦旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150626','1506',2,'乌审旗','w','wu shen qi','150626000000','乌审旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150627','1506',2,'伊金霍洛旗','y','yi jin huo luo qi','150627000000','伊金霍洛旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1507','15',1,'呼伦贝尔','h','hu lun bei er','150700000000','呼伦贝尔市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150702','1507',2,'海拉尔','h','hai la er','150702000000','海拉尔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150703','1507',2,'扎赉诺尔区','z','zha lai nuo er qu','150703000000','扎赉诺尔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150721','1507',2,'阿荣旗','a','a rong qi','150721000000','阿荣旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150722','1507',2,'莫力达瓦','m','mo li da wa','150722000000','莫力达瓦达斡尔族自治旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150723','1507',2,'鄂伦春自治旗','e','e lun chun zi zhi qi','150723000000','鄂伦春自治旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150724','1507',2,'鄂温克族自治旗','e','e wen ke zu zi zhi qi','150724000000','鄂温克族自治旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150725','1507',2,'陈巴尔虎旗','c','chen ba er hu qi','150725000000','陈巴尔虎旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150726','1507',2,'新巴尔虎左旗','x','xin ba er hu zuo qi','150726000000','新巴尔虎左旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150727','1507',2,'新巴尔虎右旗','x','xin ba er hu you qi','150727000000','新巴尔虎右旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150781','1507',2,'满洲里','m','man zhou li','150781000000','满洲里市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150782','1507',2,'牙克石','y','ya ke shi','150782000000','牙克石市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150783','1507',2,'扎兰屯','z','zha lan tun','150783000000','扎兰屯市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150784','1507',2,'额尔古纳','e','e er gu na','150784000000','额尔古纳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150785','1507',2,'根河','g','gen he','150785000000','根河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1508','15',1,'巴彦淖尔','b','ba yan nao er','150800000000','巴彦淖尔市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150802','1508',2,'临河','l','lin he','150802000000','临河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150821','1508',2,'五原','w','wu yuan','150821000000','五原县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150822','1508',2,'磴口','d','deng kou','150822000000','磴口县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150823','1508',2,'乌拉特前旗','w','wu la te qian qi','150823000000','乌拉特前旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150824','1508',2,'乌拉特中旗','w','wu la te zhong qi','150824000000','乌拉特中旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150825','1508',2,'乌拉特后旗','w','wu la te hou qi','150825000000','乌拉特后旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150826','1508',2,'杭锦后旗','h','hang jin hou qi','150826000000','杭锦后旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1509','15',1,'乌兰察布','w','wu lan cha bu','150900000000','乌兰察布市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150902','1509',2,'集宁','j','ji ning','150902000000','集宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150921','1509',2,'卓资','z','zhuo zi','150921000000','卓资县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150922','1509',2,'化德','h','hua de','150922000000','化德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150923','1509',2,'商都','s','shang du','150923000000','商都县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150924','1509',2,'兴和','x','xing he','150924000000','兴和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150925','1509',2,'凉城','l','liang cheng','150925000000','凉城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150926','1509',2,'察哈尔右翼前旗','c','cha ha er you yi qian qi','150926000000','察哈尔右翼前旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150927','1509',2,'察哈尔右翼中旗','c','cha ha er you yi zhong qi','150927000000','察哈尔右翼中旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150928','1509',2,'察哈尔右翼后旗','c','cha ha er you yi hou qi','150928000000','察哈尔右翼后旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150929','1509',2,'四子王旗','s','si zi wang qi','150929000000','四子王旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('150981','1509',2,'丰镇','f','feng zhen','150981000000','丰镇市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1522','15',1,'兴安','x','xing an','152200000000','兴安盟');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152201','1522',2,'乌兰浩特','w','wu lan hao te','152201000000','乌兰浩特市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152202','1522',2,'阿尔山','a','a er shan','152202000000','阿尔山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152221','1522',2,'科尔沁右翼前旗','k','ke er qin you yi qian qi','152221000000','科尔沁右翼前旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152222','1522',2,'科尔沁右翼中旗','k','ke er qin you yi zhong qi','152222000000','科尔沁右翼中旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152223','1522',2,'扎赉特旗','z','zha lai te qi','152223000000','扎赉特旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152224','1522',2,'突泉','t','tu quan','152224000000','突泉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1525','15',1,'锡林郭勒','x','xi lin guo le','152500000000','锡林郭勒盟');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152501','1525',2,'二连浩特','e','er lian hao te','152501000000','二连浩特市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152502','1525',2,'锡林浩特','x','xi lin hao te','152502000000','锡林浩特市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152522','1525',2,'阿巴嘎旗','a','a ba ga qi','152522000000','阿巴嘎旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152523','1525',2,'苏尼特左旗','s','su ni te zuo qi','152523000000','苏尼特左旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152524','1525',2,'苏尼特右旗','s','su ni te you qi','152524000000','苏尼特右旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152525','1525',2,'东乌珠穆沁旗','d','dong wu zhu mu qin qi','152525000000','东乌珠穆沁旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152526','1525',2,'西乌珠穆沁旗','x','xi wu zhu mu qin qi','152526000000','西乌珠穆沁旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152527','1525',2,'太仆寺旗','t','tai pu si qi','152527000000','太仆寺旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152528','1525',2,'镶黄旗','x','xiang huang qi','152528000000','镶黄旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152529','1525',2,'正镶白旗','z','zheng xiang bai qi','152529000000','正镶白旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152530','1525',2,'正蓝旗','z','zheng lan qi','152530000000','正蓝旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152531','1525',2,'多伦','d','duo lun','152531000000','多伦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('1529','15',1,'阿拉善','a','a la shan','152900000000','阿拉善盟');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152921','1529',2,'阿拉善左旗','a','a la shan zuo qi','152921000000','阿拉善左旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152922','1529',2,'阿拉善右旗','a','a la shan you qi','152922000000','阿拉善右旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('152923','1529',2,'额济纳旗','e','e ji na qi','152923000000','额济纳旗');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('21','0',0,'辽宁','l','liao ning','210000000000','辽宁省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2101','21',1,'沈阳','s','shen yang','210100000000','沈阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210102','2101',2,'和平','h','he ping','210102000000','和平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210103','2101',2,'沈河','s','shen he','210103000000','沈河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210104','2101',2,'大东','d','da dong','210104000000','大东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210105','2101',2,'皇姑','h','huang gu','210105000000','皇姑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210106','2101',2,'铁西','t','tie xi','210106000000','铁西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210111','2101',2,'苏家屯','s','su jia tun','210111000000','苏家屯区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210112','2101',2,'浑南','h','hun nan','210112000000','浑南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210113','2101',2,'沈北新区','s','shen bei xin qu','210113000000','沈北新区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210114','2101',2,'于洪','y','yu hong','210114000000','于洪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210115','2101',2,'辽中','l','liao zhong','210115000000','辽中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210123','2101',2,'康平','k','kang ping','210123000000','康平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210124','2101',2,'法库','f','fa ku','210124000000','法库县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210181','2101',2,'新民','x','xin min','210181000000','新民市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2102','21',1,'大连','d','da lian','210200000000','大连市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210202','2102',2,'中山','z','zhong shan','210202000000','中山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210203','2102',2,'西岗','x','xi gang','210203000000','西岗区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210204','2102',2,'沙河口','s','sha he kou','210204000000','沙河口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210211','2102',2,'甘井子','g','gan jing zi','210211000000','甘井子区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210212','2102',2,'旅顺口','l','lv shun kou','210212000000','旅顺口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210213','2102',2,'金州','j','jin zhou','210213000000','金州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210214','2102',2,'普兰店','p','pu lan dian','210214000000','普兰店区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210224','2102',2,'长海','c','chang hai','210224000000','长海县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210281','2102',2,'瓦房店','w','wa fang dian','210281000000','瓦房店市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210283','2102',2,'庄河','z','zhuang he','210283000000','庄河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2103','21',1,'鞍山','a','an shan','210300000000','鞍山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210302','2103',2,'铁东','t','tie dong','210302000000','铁东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210303','2103',2,'铁西','t','tie xi','210303000000','铁西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210304','2103',2,'立山','l','li shan','210304000000','立山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210311','2103',2,'千山','q','qian shan','210311000000','千山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210321','2103',2,'台安','t','tai an','210321000000','台安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210323','2103',2,'岫岩','x','xiu yan','210323000000','岫岩满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210381','2103',2,'海城','h','hai cheng','210381000000','海城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2104','21',1,'抚顺','f','fu shun','210400000000','抚顺市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210402','2104',2,'新抚','x','xin fu','210402000000','新抚区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210403','2104',2,'东洲','d','dong zhou','210403000000','东洲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210404','2104',2,'望花','w','wang hua','210404000000','望花区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210411','2104',2,'顺城','s','shun cheng','210411000000','顺城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210421','2104',2,'抚顺县','f','fu shun xian','210421000000','抚顺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210422','2104',2,'新宾','x','xin bin','210422000000','新宾满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210423','2104',2,'清原','q','qing yuan','210423000000','清原满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2105','21',1,'本溪','b','ben xi','210500000000','本溪市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210502','2105',2,'平山','p','ping shan','210502000000','平山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210503','2105',2,'溪湖','x','xi hu','210503000000','溪湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210504','2105',2,'明山','m','ming shan','210504000000','明山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210505','2105',2,'南芬','n','nan fen','210505000000','南芬区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210521','2105',2,'本溪满族自治县','b','ben xi man zu zi zhi xian','210521000000','本溪满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210522','2105',2,'桓仁','h','huan ren','210522000000','桓仁满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2106','21',1,'丹东','d','dan dong','210600000000','丹东市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210602','2106',2,'元宝','y','yuan bao','210602000000','元宝区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210603','2106',2,'振兴','z','zhen xing','210603000000','振兴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210604','2106',2,'振安','z','zhen an','210604000000','振安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210624','2106',2,'宽甸','k','kuan dian','210624000000','宽甸满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210681','2106',2,'东港','d','dong gang','210681000000','东港市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210682','2106',2,'凤城','f','feng cheng','210682000000','凤城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2107','21',1,'锦州','j','jin zhou','210700000000','锦州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210702','2107',2,'古塔','g','gu ta','210702000000','古塔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210703','2107',2,'凌河','l','ling he','210703000000','凌河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210711','2107',2,'太和','t','tai he','210711000000','太和区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210726','2107',2,'黑山','h','hei shan','210726000000','黑山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210727','2107',2,'义县','y','yi xian','210727000000','义县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210781','2107',2,'凌海','l','ling hai','210781000000','凌海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210782','2107',2,'北镇','b','bei zhen','210782000000','北镇市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2108','21',1,'营口','y','ying kou','210800000000','营口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210802','2108',2,'站前','z','zhan qian','210802000000','站前区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210803','2108',2,'西市','x','xi shi','210803000000','西市区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210804','2108',2,'鲅鱼圈','b','ba yu quan','210804000000','鲅鱼圈区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210811','2108',2,'老边','l','lao bian','210811000000','老边区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210881','2108',2,'盖州','g','gai zhou','210881000000','盖州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210882','2108',2,'大石桥','d','da shi qiao','210882000000','大石桥市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2109','21',1,'阜新','f','fu xin','210900000000','阜新市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210902','2109',2,'海州','h','hai zhou','210902000000','海州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210903','2109',2,'新邱','x','xin qiu','210903000000','新邱区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210904','2109',2,'太平','t','tai ping','210904000000','太平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210905','2109',2,'清河门','q','qing he men','210905000000','清河门区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210911','2109',2,'细河','x','xi he','210911000000','细河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210921','2109',2,'阜新蒙古族自治县','f','fu xin meng gu zu zi zhi xian','210921000000','阜新蒙古族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('210922','2109',2,'彰武','z','zhang wu','210922000000','彰武县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2110','21',1,'辽阳','l','liao yang','211000000000','辽阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211002','2110',2,'白塔','b','bai ta','211002000000','白塔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211003','2110',2,'文圣','w','wen sheng','211003000000','文圣区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211004','2110',2,'宏伟','h','hong wei','211004000000','宏伟区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211005','2110',2,'弓长岭','g','gong chang ling','211005000000','弓长岭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211011','2110',2,'太子河','t','tai zi he','211011000000','太子河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211021','2110',2,'辽阳县','l','liao yang xian','211021000000','辽阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211081','2110',2,'灯塔','d','deng ta','211081000000','灯塔市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2111','21',1,'盘锦','p','pan jin','211100000000','盘锦市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211102','2111',2,'双台子','s','shuang tai zi','211102000000','双台子区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211103','2111',2,'兴隆台','x','xing long tai','211103000000','兴隆台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211104','2111',2,'大洼','d','da wa','211104000000','大洼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211122','2111',2,'盘山','p','pan shan','211122000000','盘山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2112','21',1,'铁岭','t','tie ling','211200000000','铁岭市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211202','2112',2,'银州','y','yin zhou','211202000000','银州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211204','2112',2,'清河','q','qing he','211204000000','清河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211221','2112',2,'铁岭县','t','tie ling xian','211221000000','铁岭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211223','2112',2,'西丰','x','xi feng','211223000000','西丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211224','2112',2,'昌图','c','chang tu','211224000000','昌图县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211281','2112',2,'调兵山','d','diao bing shan','211281000000','调兵山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211282','2112',2,'开原','k','kai yuan','211282000000','开原市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2113','21',1,'朝阳','c','chao yang','211300000000','朝阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211302','2113',2,'双塔','s','shuang ta','211302000000','双塔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211303','2113',2,'龙城','l','long cheng','211303000000','龙城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211321','2113',2,'朝阳县','c','chao yang xian','211321000000','朝阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211322','2113',2,'建平','j','jian ping','211322000000','建平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211324','2113',2,'喀喇沁左翼','k','ka la qin zuo yi','211324000000','喀喇沁左翼蒙古族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211381','2113',2,'北票','b','bei piao','211381000000','北票市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211382','2113',2,'凌源','l','ling yuan','211382000000','凌源市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2114','21',1,'葫芦岛','h','hu lu dao','211400000000','葫芦岛市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211402','2114',2,'连山','l','lian shan','211402000000','连山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211403','2114',2,'龙港','l','long gang','211403000000','龙港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211404','2114',2,'南票','n','nan piao','211404000000','南票区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211421','2114',2,'绥中','s','sui zhong','211421000000','绥中县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211422','2114',2,'建昌','j','jian chang','211422000000','建昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('211481','2114',2,'兴城','x','xing cheng','211481000000','兴城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('22','0',0,'吉林','j','ji lin','220000000000','吉林省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2201','22',1,'长春','c','chang chun','220100000000','长春市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220102','2201',2,'南关','n','nan guan','220102000000','南关区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220103','2201',2,'宽城','k','kuan cheng','220103000000','宽城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220104','2201',2,'朝阳','c','chao yang','220104000000','朝阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220105','2201',2,'二道','e','er dao','220105000000','二道区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220106','2201',2,'绿园','l','lv yuan','220106000000','绿园区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220112','2201',2,'双阳','s','shuang yang','220112000000','双阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220113','2201',2,'九台','j','jiu tai','220113000000','九台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220122','2201',2,'农安','n','nong an','220122000000','农安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220182','2201',2,'榆树','y','yu shu','220182000000','榆树市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220183','2201',2,'德惠','d','de hui','220183000000','德惠市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220184','2201',2,'公主岭','g','gong zhu ling','220184000000','公主岭市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2202','22',1,'吉林市','j','ji lin shi','220200000000','吉林市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220202','2202',2,'昌邑','c','chang yi','220202000000','昌邑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220203','2202',2,'龙潭','l','long tan','220203000000','龙潭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220204','2202',2,'船营','c','chuan ying','220204000000','船营区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220211','2202',2,'丰满','f','feng man','220211000000','丰满区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220221','2202',2,'永吉','y','yong ji','220221000000','永吉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220281','2202',2,'蛟河','j','jiao he','220281000000','蛟河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220282','2202',2,'桦甸','h','hua dian','220282000000','桦甸市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220283','2202',2,'舒兰','s','shu lan','220283000000','舒兰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220284','2202',2,'磐石','p','pan shi','220284000000','磐石市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2203','22',1,'四平','s','si ping','220300000000','四平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220302','2203',2,'铁西','t','tie xi','220302000000','铁西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220303','2203',2,'铁东','t','tie dong','220303000000','铁东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220322','2203',2,'梨树','l','li shu','220322000000','梨树县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220323','2203',2,'伊通','y','yi tong','220323000000','伊通满族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220382','2203',2,'双辽','s','shuang liao','220382000000','双辽市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2204','22',1,'辽源','l','liao yuan','220400000000','辽源市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220402','2204',2,'龙山','l','long shan','220402000000','龙山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220403','2204',2,'西安','x','xi an','220403000000','西安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220421','2204',2,'东丰','d','dong feng','220421000000','东丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220422','2204',2,'东辽','d','dong liao','220422000000','东辽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2205','22',1,'通化','t','tong hua','220500000000','通化市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220502','2205',2,'东昌','d','dong chang','220502000000','东昌区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220503','2205',2,'二道江','e','er dao jiang','220503000000','二道江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220521','2205',2,'通化县','t','tong hua xian','220521000000','通化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220523','2205',2,'辉南','h','hui nan','220523000000','辉南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220524','2205',2,'柳河','l','liu he','220524000000','柳河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220581','2205',2,'梅河口','m','mei he kou','220581000000','梅河口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220582','2205',2,'集安','j','ji an','220582000000','集安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2206','22',1,'白山','b','bai shan','220600000000','白山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220602','2206',2,'浑江','h','hun jiang','220602000000','浑江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220605','2206',2,'江源','j','jiang yuan','220605000000','江源区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220621','2206',2,'抚松','f','fu song','220621000000','抚松县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220622','2206',2,'靖宇','j','jing yu','220622000000','靖宇县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220623','2206',2,'长白','c','chang bai','220623000000','长白朝鲜族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220681','2206',2,'临江','l','lin jiang','220681000000','临江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2207','22',1,'松原','s','song yuan','220700000000','松原市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220702','2207',2,'宁江','n','ning jiang','220702000000','宁江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220721','2207',2,'前郭尔罗斯','q','qian guo er luo si','220721000000','前郭尔罗斯蒙古族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220722','2207',2,'长岭','c','chang ling','220722000000','长岭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220723','2207',2,'乾安','q','qian an','220723000000','乾安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220781','2207',2,'扶余','f','fu yu','220781000000','扶余市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2208','22',1,'白城','b','bai cheng','220800000000','白城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220802','2208',2,'洮北','t','tao bei','220802000000','洮北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220821','2208',2,'镇赉','z','zhen lai','220821000000','镇赉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220822','2208',2,'通榆','t','tong yu','220822000000','通榆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220881','2208',2,'洮南','t','tao nan','220881000000','洮南市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('220882','2208',2,'大安','d','da an','220882000000','大安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2224','22',1,'延边','y','yan bian','222400000000','延边朝鲜族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('222401','2224',2,'延吉','y','yan ji','222401000000','延吉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('222402','2224',2,'图们','t','tu men','222402000000','图们市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('222403','2224',2,'敦化','d','dun hua','222403000000','敦化市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('222404','2224',2,'珲春','h','hun chun','222404000000','珲春市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('222405','2224',2,'龙井','l','long jing','222405000000','龙井市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('222406','2224',2,'和龙','h','he long','222406000000','和龙市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('222424','2224',2,'汪清','w','wang qing','222424000000','汪清县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('222426','2224',2,'安图','a','an tu','222426000000','安图县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('23','0',0,'黑龙江','h','hei long jiang','230000000000','黑龙江省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2301','23',1,'哈尔滨','h','ha er bin','230100000000','哈尔滨市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230102','2301',2,'道里','d','dao li','230102000000','道里区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230103','2301',2,'南岗','n','nan gang','230103000000','南岗区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230104','2301',2,'道外','d','dao wai','230104000000','道外区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230108','2301',2,'平房','p','ping fang','230108000000','平房区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230109','2301',2,'松北','s','song bei','230109000000','松北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230110','2301',2,'香坊','x','xiang fang','230110000000','香坊区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230111','2301',2,'呼兰','h','hu lan','230111000000','呼兰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230112','2301',2,'阿城','a','a cheng','230112000000','阿城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230113','2301',2,'双城','s','shuang cheng','230113000000','双城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230123','2301',2,'依兰','y','yi lan','230123000000','依兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230124','2301',2,'方正','f','fang zheng','230124000000','方正县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230125','2301',2,'宾县','b','bin xian','230125000000','宾县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230126','2301',2,'巴彦','b','ba yan','230126000000','巴彦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230127','2301',2,'木兰','m','mu lan','230127000000','木兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230128','2301',2,'通河','t','tong he','230128000000','通河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230129','2301',2,'延寿','y','yan shou','230129000000','延寿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230183','2301',2,'尚志','s','shang zhi','230183000000','尚志市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230184','2301',2,'五常','w','wu chang','230184000000','五常市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2302','23',1,'齐齐哈尔','q','qi qi ha er','230200000000','齐齐哈尔市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230202','2302',2,'龙沙','l','long sha','230202000000','龙沙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230203','2302',2,'建华','j','jian hua','230203000000','建华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230204','2302',2,'铁锋','t','tie feng','230204000000','铁锋区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230205','2302',2,'昂昂溪','a','ang ang xi','230205000000','昂昂溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230206','2302',2,'富拉尔基区','f','fu la er ji qu','230206000000','富拉尔基区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230207','2302',2,'碾子山','n','nian zi shan','230207000000','碾子山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230208','2302',2,'梅里斯','m','mei li si','230208000000','梅里斯达斡尔族区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230221','2302',2,'龙江','l','long jiang','230221000000','龙江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230223','2302',2,'依安','y','yi an','230223000000','依安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230224','2302',2,'泰来','t','tai lai','230224000000','泰来县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230225','2302',2,'甘南','g','gan nan','230225000000','甘南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230227','2302',2,'富裕','f','fu yu','230227000000','富裕县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230229','2302',2,'克山','k','ke shan','230229000000','克山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230230','2302',2,'克东','k','ke dong','230230000000','克东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230231','2302',2,'拜泉','b','bai quan','230231000000','拜泉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230281','2302',2,'讷河','n','ne he','230281000000','讷河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2303','23',1,'鸡西','j','ji xi','230300000000','鸡西市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230302','2303',2,'鸡冠','j','ji guan','230302000000','鸡冠区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230303','2303',2,'恒山','h','heng shan','230303000000','恒山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230304','2303',2,'滴道','d','di dao','230304000000','滴道区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230305','2303',2,'梨树','l','li shu','230305000000','梨树区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230306','2303',2,'城子河','c','cheng zi he','230306000000','城子河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230307','2303',2,'麻山','m','ma shan','230307000000','麻山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230321','2303',2,'鸡东','j','ji dong','230321000000','鸡东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230381','2303',2,'虎林','h','hu lin','230381000000','虎林市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230382','2303',2,'密山','m','mi shan','230382000000','密山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2304','23',1,'鹤岗','h','he gang','230400000000','鹤岗市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230402','2304',2,'向阳','x','xiang yang','230402000000','向阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230403','2304',2,'工农','g','gong nong','230403000000','工农区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230404','2304',2,'南山','n','nan shan','230404000000','南山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230405','2304',2,'兴安','x','xing an','230405000000','兴安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230406','2304',2,'东山','d','dong shan','230406000000','东山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230407','2304',2,'兴山','x','xing shan','230407000000','兴山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230421','2304',2,'萝北','l','luo bei','230421000000','萝北县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230422','2304',2,'绥滨','s','sui bin','230422000000','绥滨县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2305','23',1,'双鸭山','s','shuang ya shan','230500000000','双鸭山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230502','2305',2,'尖山','j','jian shan','230502000000','尖山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230503','2305',2,'岭东','l','ling dong','230503000000','岭东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230505','2305',2,'四方台','s','si fang tai','230505000000','四方台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230506','2305',2,'宝山','b','bao shan','230506000000','宝山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230521','2305',2,'集贤','j','ji xian','230521000000','集贤县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230522','2305',2,'友谊','y','you yi','230522000000','友谊县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230523','2305',2,'宝清','b','bao qing','230523000000','宝清县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230524','2305',2,'饶河','r','rao he','230524000000','饶河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2306','23',1,'大庆','d','da qing','230600000000','大庆市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230602','2306',2,'萨尔图','s','sa er tu','230602000000','萨尔图区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230603','2306',2,'龙凤','l','long feng','230603000000','龙凤区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230604','2306',2,'让胡路','r','rang hu lu','230604000000','让胡路区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230605','2306',2,'红岗','h','hong gang','230605000000','红岗区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230606','2306',2,'大同','d','da tong','230606000000','大同区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230621','2306',2,'肇州','z','zhao zhou','230621000000','肇州县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230622','2306',2,'肇源','z','zhao yuan','230622000000','肇源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230623','2306',2,'林甸','l','lin dian','230623000000','林甸县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230624','2306',2,'杜尔伯特','d','du er bo te','230624000000','杜尔伯特蒙古族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2307','23',1,'伊春','y','yi chun','230700000000','伊春市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230717','2307',2,'伊美','y','yi mei','230717000000','伊美区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230718','2307',2,'乌翠','w','wu cui','230718000000','乌翠区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230719','2307',2,'友好','y','you hao','230719000000','友好区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230722','2307',2,'嘉荫','j','jia yin','230722000000','嘉荫县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230723','2307',2,'汤旺','t','tang wang','230723000000','汤旺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230724','2307',2,'丰林','f','feng lin','230724000000','丰林县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230725','2307',2,'大箐山','d','da qing shan','230725000000','大箐山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230726','2307',2,'南岔','n','nan cha','230726000000','南岔县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230751','2307',2,'金林','j','jin lin','230751000000','金林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230781','2307',2,'铁力','t','tie li','230781000000','铁力市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2308','23',1,'佳木斯','j','jia mu si','230800000000','佳木斯市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230803','2308',2,'向阳','x','xiang yang','230803000000','向阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230804','2308',2,'前进','q','qian jin','230804000000','前进区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230805','2308',2,'东风','d','dong feng','230805000000','东风区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230811','2308',2,'郊区','j','jiao qu','230811000000','郊区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230822','2308',2,'桦南','h','hua nan','230822000000','桦南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230826','2308',2,'桦川','h','hua chuan','230826000000','桦川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230828','2308',2,'汤原','t','tang yuan','230828000000','汤原县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230881','2308',2,'同江','t','tong jiang','230881000000','同江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230882','2308',2,'富锦','f','fu jin','230882000000','富锦市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230883','2308',2,'抚远','f','fu yuan','230883000000','抚远市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2309','23',1,'七台河','q','qi tai he','230900000000','七台河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230902','2309',2,'新兴','x','xin xing','230902000000','新兴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230903','2309',2,'桃山','t','tao shan','230903000000','桃山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230904','2309',2,'茄子河','q','qie zi he','230904000000','茄子河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('230921','2309',2,'勃利','b','bo li','230921000000','勃利县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2310','23',1,'牡丹江','m','mu dan jiang','231000000000','牡丹江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231002','2310',2,'东安','d','dong an','231002000000','东安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231003','2310',2,'阳明','y','yang ming','231003000000','阳明区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231004','2310',2,'爱民','a','ai min','231004000000','爱民区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231005','2310',2,'西安','x','xi an','231005000000','西安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231025','2310',2,'林口','l','lin kou','231025000000','林口县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231081','2310',2,'绥芬河','s','sui fen he','231081000000','绥芬河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231083','2310',2,'海林','h','hai lin','231083000000','海林市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231084','2310',2,'宁安','n','ning an','231084000000','宁安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231085','2310',2,'穆棱','m','mu ling','231085000000','穆棱市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231086','2310',2,'东宁','d','dong ning','231086000000','东宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2311','23',1,'黑河','h','hei he','231100000000','黑河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231102','2311',2,'爱辉','a','ai hui','231102000000','爱辉区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231123','2311',2,'逊克','x','xun ke','231123000000','逊克县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231124','2311',2,'孙吴','s','sun wu','231124000000','孙吴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231181','2311',2,'北安','b','bei an','231181000000','北安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231182','2311',2,'五大连池','w','wu da lian chi','231182000000','五大连池市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231183','2311',2,'嫩江','n','nen jiang','231183000000','嫩江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2312','23',1,'绥化','s','sui hua','231200000000','绥化市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231202','2312',2,'北林','b','bei lin','231202000000','北林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231221','2312',2,'望奎','w','wang kui','231221000000','望奎县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231222','2312',2,'兰西','l','lan xi','231222000000','兰西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231223','2312',2,'青冈','q','qing gang','231223000000','青冈县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231224','2312',2,'庆安','q','qing an','231224000000','庆安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231225','2312',2,'明水','m','ming shui','231225000000','明水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231226','2312',2,'绥棱','s','sui ling','231226000000','绥棱县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231281','2312',2,'安达','a','an da','231281000000','安达市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231282','2312',2,'肇东','z','zhao dong','231282000000','肇东市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('231283','2312',2,'海伦','h','hai lun','231283000000','海伦市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('2327','23',1,'大兴安岭','d','da xing an ling','232700000000','大兴安岭地区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('232701','2327',2,'漠河','m','mo he','232701000000','漠河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('232721','2327',2,'呼玛','h','hu ma','232721000000','呼玛县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('232722','2327',2,'塔河','t','ta he','232722000000','塔河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('232761','2327',2,'加格达奇区','j','jia ge da qi qu','232761000000','加格达奇区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('31','0',0,'上海','s','shang hai','310000000000','上海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3101','31',1,'上海','s','shang hai','310100000000','上海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310101','3101',2,'黄浦','h','huang pu','310101000000','黄浦区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310104','3101',2,'徐汇','x','xu hui','310104000000','徐汇区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310105','3101',2,'长宁','c','chang ning','310105000000','长宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310106','3101',2,'静安','j','jing an','310106000000','静安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310107','3101',2,'普陀','p','pu tuo','310107000000','普陀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310109','3101',2,'虹口','h','hong kou','310109000000','虹口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310110','3101',2,'杨浦','y','yang pu','310110000000','杨浦区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310112','3101',2,'闵行','m','min hang','310112000000','闵行区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310113','3101',2,'宝山','b','bao shan','310113000000','宝山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310114','3101',2,'嘉定','j','jia ding','310114000000','嘉定区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310115','3101',2,'浦东新区','p','pu dong xin qu','310115000000','浦东新区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310116','3101',2,'金山','j','jin shan','310116000000','金山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310117','3101',2,'松江','s','song jiang','310117000000','松江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310118','3101',2,'青浦','q','qing pu','310118000000','青浦区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310120','3101',2,'奉贤','f','feng xian','310120000000','奉贤区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('310151','3101',2,'崇明','c','chong ming','310151000000','崇明区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('32','0',0,'江苏','j','jiang su','320000000000','江苏省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3201','32',1,'南京','n','nan jing','320100000000','南京市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320102','3201',2,'玄武','x','xuan wu','320102000000','玄武区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320104','3201',2,'秦淮','q','qin huai','320104000000','秦淮区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320105','3201',2,'建邺','j','jian ye','320105000000','建邺区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320106','3201',2,'鼓楼','g','gu lou','320106000000','鼓楼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320111','3201',2,'浦口','p','pu kou','320111000000','浦口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320113','3201',2,'栖霞','q','qi xia','320113000000','栖霞区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320114','3201',2,'雨花台','y','yu hua tai','320114000000','雨花台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320115','3201',2,'江宁','j','jiang ning','320115000000','江宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320116','3201',2,'六合','l','lu he','320116000000','六合区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320117','3201',2,'溧水','l','li shui','320117000000','溧水区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320118','3201',2,'高淳','g','gao chun','320118000000','高淳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3202','32',1,'无锡','w','wu xi','320200000000','无锡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320205','3202',2,'锡山','x','xi shan','320205000000','锡山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320206','3202',2,'惠山','h','hui shan','320206000000','惠山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320211','3202',2,'滨湖','b','bin hu','320211000000','滨湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320213','3202',2,'梁溪','l','liang xi','320213000000','梁溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320214','3202',2,'新吴','x','xin wu','320214000000','新吴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320281','3202',2,'江阴','j','jiang yin','320281000000','江阴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320282','3202',2,'宜兴','y','yi xing','320282000000','宜兴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3203','32',1,'徐州','x','xu zhou','320300000000','徐州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320302','3203',2,'鼓楼','g','gu lou','320302000000','鼓楼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320303','3203',2,'云龙','y','yun long','320303000000','云龙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320305','3203',2,'贾汪','j','jia wang','320305000000','贾汪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320311','3203',2,'泉山','q','quan shan','320311000000','泉山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320312','3203',2,'铜山','t','tong shan','320312000000','铜山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320321','3203',2,'丰县','f','feng xian','320321000000','丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320322','3203',2,'沛县','p','pei xian','320322000000','沛县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320324','3203',2,'睢宁','s','sui ning','320324000000','睢宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320381','3203',2,'新沂','x','xin yi','320381000000','新沂市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320382','3203',2,'邳州','p','pi zhou','320382000000','邳州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3204','32',1,'常州','c','chang zhou','320400000000','常州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320402','3204',2,'天宁','t','tian ning','320402000000','天宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320404','3204',2,'钟楼','z','zhong lou','320404000000','钟楼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320411','3204',2,'新北','x','xin bei','320411000000','新北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320412','3204',2,'武进','w','wu jin','320412000000','武进区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320413','3204',2,'金坛','j','jin tan','320413000000','金坛区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320481','3204',2,'溧阳','l','li yang','320481000000','溧阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3205','32',1,'苏州','s','su zhou','320500000000','苏州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320505','3205',2,'虎丘','h','hu qiu','320505000000','虎丘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320506','3205',2,'吴中','w','wu zhong','320506000000','吴中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320507','3205',2,'相城','x','xiang cheng','320507000000','相城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320508','3205',2,'姑苏','g','gu su','320508000000','姑苏区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320509','3205',2,'吴江','w','wu jiang','320509000000','吴江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320581','3205',2,'常熟','c','chang shu','320581000000','常熟市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320582','3205',2,'张家港','z','zhang jia gang','320582000000','张家港市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320583','3205',2,'昆山','k','kun shan','320583000000','昆山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320585','3205',2,'太仓','t','tai cang','320585000000','太仓市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3206','32',1,'南通','n','nan tong','320600000000','南通市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320612','3206',2,'通州','t','tong zhou','320612000000','通州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320613','3206',2,'崇川','c','chong chuan','320613000000','崇川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320614','3206',2,'海门','h','hai men','320614000000','海门区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320623','3206',2,'如东','r','ru dong','320623000000','如东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320681','3206',2,'启东','q','qi dong','320681000000','启东市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320682','3206',2,'如皋','r','ru gao','320682000000','如皋市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320685','3206',2,'海安','h','hai an','320685000000','海安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3207','32',1,'连云港','l','lian yun gang','320700000000','连云港市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320703','3207',2,'连云','l','lian yun','320703000000','连云区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320706','3207',2,'海州','h','hai zhou','320706000000','海州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320707','3207',2,'赣榆','g','gan yu','320707000000','赣榆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320722','3207',2,'东海','d','dong hai','320722000000','东海县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320723','3207',2,'灌云','g','guan yun','320723000000','灌云县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320724','3207',2,'灌南','g','guan nan','320724000000','灌南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3208','32',1,'淮安','h','huai an','320800000000','淮安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320803','3208',2,'淮安区','h','huai an qu','320803000000','淮安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320804','3208',2,'淮阴','h','huai yin','320804000000','淮阴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320812','3208',2,'清江浦','q','qing jiang pu','320812000000','清江浦区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320813','3208',2,'洪泽','h','hong ze','320813000000','洪泽区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320826','3208',2,'涟水','l','lian shui','320826000000','涟水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320830','3208',2,'盱眙','x','xu yi','320830000000','盱眙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320831','3208',2,'金湖','j','jin hu','320831000000','金湖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3209','32',1,'盐城','y','yan cheng','320900000000','盐城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320902','3209',2,'亭湖','t','ting hu','320902000000','亭湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320903','3209',2,'盐都','y','yan du','320903000000','盐都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320904','3209',2,'大丰','d','da feng','320904000000','大丰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320921','3209',2,'响水','x','xiang shui','320921000000','响水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320922','3209',2,'滨海','b','bin hai','320922000000','滨海县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320923','3209',2,'阜宁','f','fu ning','320923000000','阜宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320924','3209',2,'射阳','s','she yang','320924000000','射阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320925','3209',2,'建湖','j','jian hu','320925000000','建湖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('320981','3209',2,'东台','d','dong tai','320981000000','东台市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3210','32',1,'扬州','y','yang zhou','321000000000','扬州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321002','3210',2,'广陵','g','guang ling','321002000000','广陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321003','3210',2,'邗江','h','han jiang','321003000000','邗江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321012','3210',2,'江都','j','jiang du','321012000000','江都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321023','3210',2,'宝应','b','bao ying','321023000000','宝应县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321081','3210',2,'仪征','y','yi zheng','321081000000','仪征市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321084','3210',2,'高邮','g','gao you','321084000000','高邮市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3211','32',1,'镇江','z','zhen jiang','321100000000','镇江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321102','3211',2,'京口','j','jing kou','321102000000','京口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321111','3211',2,'润州','r','run zhou','321111000000','润州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321112','3211',2,'丹徒','d','dan tu','321112000000','丹徒区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321181','3211',2,'丹阳','d','dan yang','321181000000','丹阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321182','3211',2,'扬中','y','yang zhong','321182000000','扬中市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321183','3211',2,'句容','j','ju rong','321183000000','句容市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3212','32',1,'泰州','t','tai zhou','321200000000','泰州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321202','3212',2,'海陵','h','hai ling','321202000000','海陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321203','3212',2,'高港','g','gao gang','321203000000','高港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321204','3212',2,'姜堰','j','jiang yan','321204000000','姜堰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321281','3212',2,'兴化','x','xing hua','321281000000','兴化市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321282','3212',2,'靖江','j','jing jiang','321282000000','靖江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321283','3212',2,'泰兴','t','tai xing','321283000000','泰兴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3213','32',1,'宿迁','s','su qian','321300000000','宿迁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321302','3213',2,'宿城','s','su cheng','321302000000','宿城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321311','3213',2,'宿豫','s','su yu','321311000000','宿豫区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321322','3213',2,'沭阳','s','shu yang','321322000000','沭阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321323','3213',2,'泗阳','s','si yang','321323000000','泗阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('321324','3213',2,'泗洪','s','si hong','321324000000','泗洪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('33','0',0,'浙江','z','zhe jiang','330000000000','浙江省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3301','33',1,'杭州','h','hang zhou','330100000000','杭州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330102','3301',2,'上城','s','shang cheng','330102000000','上城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330105','3301',2,'拱墅','g','gong shu','330105000000','拱墅区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330106','3301',2,'西湖','x','xi hu','330106000000','西湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330108','3301',2,'滨江','b','bin jiang','330108000000','滨江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330109','3301',2,'萧山','x','xiao shan','330109000000','萧山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330110','3301',2,'余杭','y','yu hang','330110000000','余杭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330111','3301',2,'富阳','f','fu yang','330111000000','富阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330112','3301',2,'临安','l','lin an','330112000000','临安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330113','3301',2,'临平','l','lin ping','330113000000','临平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330114','3301',2,'钱塘','q','qian tang','330114000000','钱塘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330122','3301',2,'桐庐','t','tong lu','330122000000','桐庐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330127','3301',2,'淳安','c','chun an','330127000000','淳安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330182','3301',2,'建德','j','jian de','330182000000','建德市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3302','33',1,'宁波','n','ning bo','330200000000','宁波市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330203','3302',2,'海曙','h','hai shu','330203000000','海曙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330205','3302',2,'江北','j','jiang bei','330205000000','江北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330206','3302',2,'北仑','b','bei lun','330206000000','北仑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330211','3302',2,'镇海','z','zhen hai','330211000000','镇海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330212','3302',2,'鄞州','y','yin zhou','330212000000','鄞州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330213','3302',2,'奉化','f','feng hua','330213000000','奉化区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330225','3302',2,'象山','x','xiang shan','330225000000','象山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330226','3302',2,'宁海','n','ning hai','330226000000','宁海县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330281','3302',2,'余姚','y','yu yao','330281000000','余姚市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330282','3302',2,'慈溪','c','ci xi','330282000000','慈溪市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3303','33',1,'温州','w','wen zhou','330300000000','温州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330302','3303',2,'鹿城','l','lu cheng','330302000000','鹿城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330303','3303',2,'龙湾','l','long wan','330303000000','龙湾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330304','3303',2,'瓯海','o','ou hai','330304000000','瓯海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330305','3303',2,'洞头','d','dong tou','330305000000','洞头区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330324','3303',2,'永嘉','y','yong jia','330324000000','永嘉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330326','3303',2,'平阳','p','ping yang','330326000000','平阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330327','3303',2,'苍南','c','cang nan','330327000000','苍南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330328','3303',2,'文成','w','wen cheng','330328000000','文成县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330329','3303',2,'泰顺','t','tai shun','330329000000','泰顺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330381','3303',2,'瑞安','r','rui an','330381000000','瑞安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330382','3303',2,'乐清','y','yue qing','330382000000','乐清市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330383','3303',2,'龙港','l','long gang','330383000000','龙港市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3304','33',1,'嘉兴','j','jia xing','330400000000','嘉兴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330402','3304',2,'南湖','n','nan hu','330402000000','南湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330411','3304',2,'秀洲','x','xiu zhou','330411000000','秀洲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330421','3304',2,'嘉善','j','jia shan','330421000000','嘉善县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330424','3304',2,'海盐','h','hai yan','330424000000','海盐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330481','3304',2,'海宁','h','hai ning','330481000000','海宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330482','3304',2,'平湖','p','ping hu','330482000000','平湖市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330483','3304',2,'桐乡','t','tong xiang','330483000000','桐乡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3305','33',1,'湖州','h','hu zhou','330500000000','湖州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330502','3305',2,'吴兴','w','wu xing','330502000000','吴兴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330503','3305',2,'南浔','n','nan xun','330503000000','南浔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330521','3305',2,'德清','d','de qing','330521000000','德清县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330522','3305',2,'长兴','c','chang xing','330522000000','长兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330523','3305',2,'安吉','a','an ji','330523000000','安吉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3306','33',1,'绍兴','s','shao xing','330600000000','绍兴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330602','3306',2,'越城','y','yue cheng','330602000000','越城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330603','3306',2,'柯桥','k','ke qiao','330603000000','柯桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330604','3306',2,'上虞','s','shang yu','330604000000','上虞区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330624','3306',2,'新昌','x','xin chang','330624000000','新昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330681','3306',2,'诸暨','z','zhu ji','330681000000','诸暨市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330683','3306',2,'嵊州','s','sheng zhou','330683000000','嵊州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3307','33',1,'金华','j','jin hua','330700000000','金华市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330702','3307',2,'婺城','w','wu cheng','330702000000','婺城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330703','3307',2,'金东','j','jin dong','330703000000','金东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330723','3307',2,'武义','w','wu yi','330723000000','武义县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330726','3307',2,'浦江','p','pu jiang','330726000000','浦江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330727','3307',2,'磐安','p','pan an','330727000000','磐安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330781','3307',2,'兰溪','l','lan xi','330781000000','兰溪市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330782','3307',2,'义乌','y','yi wu','330782000000','义乌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330783','3307',2,'东阳','d','dong yang','330783000000','东阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330784','3307',2,'永康','y','yong kang','330784000000','永康市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3308','33',1,'衢州','q','qu zhou','330800000000','衢州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330802','3308',2,'柯城','k','ke cheng','330802000000','柯城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330803','3308',2,'衢江','q','qu jiang','330803000000','衢江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330822','3308',2,'常山','c','chang shan','330822000000','常山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330824','3308',2,'开化','k','kai hua','330824000000','开化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330825','3308',2,'龙游','l','long you','330825000000','龙游县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330881','3308',2,'江山','j','jiang shan','330881000000','江山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3309','33',1,'舟山','z','zhou shan','330900000000','舟山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330902','3309',2,'定海','d','ding hai','330902000000','定海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330903','3309',2,'普陀','p','pu tuo','330903000000','普陀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330921','3309',2,'岱山','d','dai shan','330921000000','岱山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('330922','3309',2,'嵊泗','s','sheng si','330922000000','嵊泗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3310','33',1,'台州','t','tai zhou','331000000000','台州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331002','3310',2,'椒江','j','jiao jiang','331002000000','椒江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331003','3310',2,'黄岩','h','huang yan','331003000000','黄岩区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331004','3310',2,'路桥','l','lu qiao','331004000000','路桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331022','3310',2,'三门','s','san men','331022000000','三门县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331023','3310',2,'天台','t','tian tai','331023000000','天台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331024','3310',2,'仙居','x','xian ju','331024000000','仙居县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331081','3310',2,'温岭','w','wen ling','331081000000','温岭市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331082','3310',2,'临海','l','lin hai','331082000000','临海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331083','3310',2,'玉环','y','yu huan','331083000000','玉环市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3311','33',1,'丽水','l','li shui','331100000000','丽水市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331102','3311',2,'莲都','l','lian du','331102000000','莲都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331121','3311',2,'青田','q','qing tian','331121000000','青田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331122','3311',2,'缙云','j','jin yun','331122000000','缙云县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331123','3311',2,'遂昌','s','sui chang','331123000000','遂昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331124','3311',2,'松阳','s','song yang','331124000000','松阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331125','3311',2,'云和','y','yun he','331125000000','云和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331126','3311',2,'庆元','q','qing yuan','331126000000','庆元县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331127','3311',2,'景宁','j','jing ning','331127000000','景宁畲族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('331181','3311',2,'龙泉','l','long quan','331181000000','龙泉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('34','0',0,'安徽','a','an hui','340000000000','安徽省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3401','34',1,'合肥','h','he fei','340100000000','合肥市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340102','3401',2,'瑶海','y','yao hai','340102000000','瑶海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340103','3401',2,'庐阳','l','lu yang','340103000000','庐阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340104','3401',2,'蜀山','s','shu shan','340104000000','蜀山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340111','3401',2,'包河','b','bao he','340111000000','包河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340121','3401',2,'长丰','c','chang feng','340121000000','长丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340122','3401',2,'肥东','f','fei dong','340122000000','肥东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340123','3401',2,'肥西','f','fei xi','340123000000','肥西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340124','3401',2,'庐江','l','lu jiang','340124000000','庐江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340181','3401',2,'巢湖','c','chao hu','340181000000','巢湖市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3402','34',1,'芜湖','w','wu hu','340200000000','芜湖市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340202','3402',2,'镜湖','j','jing hu','340202000000','镜湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340207','3402',2,'鸠江','j','jiu jiang','340207000000','鸠江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340209','3402',2,'弋江','y','yi jiang','340209000000','弋江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340210','3402',2,'湾沚','w','wan zhi','340210000000','湾沚区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340212','3402',2,'繁昌','f','fan chang','340212000000','繁昌区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340223','3402',2,'南陵','n','nan ling','340223000000','南陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340281','3402',2,'无为','w','wu wei','340281000000','无为市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3403','34',1,'蚌埠','b','beng bu','340300000000','蚌埠市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340302','3403',2,'龙子湖','l','long zi hu','340302000000','龙子湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340303','3403',2,'蚌山','b','beng shan','340303000000','蚌山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340304','3403',2,'禹会','y','yu hui','340304000000','禹会区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340311','3403',2,'淮上','h','huai shang','340311000000','淮上区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340321','3403',2,'怀远','h','huai yuan','340321000000','怀远县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340322','3403',2,'五河','w','wu he','340322000000','五河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340323','3403',2,'固镇','g','gu zhen','340323000000','固镇县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3404','34',1,'淮南','h','huai nan','340400000000','淮南市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340402','3404',2,'大通','d','da tong','340402000000','大通区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340403','3404',2,'田家庵','t','tian jia an','340403000000','田家庵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340404','3404',2,'谢家集','x','xie jia ji','340404000000','谢家集区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340405','3404',2,'八公山','b','ba gong shan','340405000000','八公山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340406','3404',2,'潘集','p','pan ji','340406000000','潘集区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340421','3404',2,'凤台','f','feng tai','340421000000','凤台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340422','3404',2,'寿县','s','shou xian','340422000000','寿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3405','34',1,'马鞍山','m','ma an shan','340500000000','马鞍山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340503','3405',2,'花山','h','hua shan','340503000000','花山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340504','3405',2,'雨山','y','yu shan','340504000000','雨山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340506','3405',2,'博望','b','bo wang','340506000000','博望区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340521','3405',2,'当涂','d','dang tu','340521000000','当涂县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340522','3405',2,'含山','h','han shan','340522000000','含山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340523','3405',2,'和县','h','he xian','340523000000','和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3406','34',1,'淮北','h','huai bei','340600000000','淮北市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340602','3406',2,'杜集','d','du ji','340602000000','杜集区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340603','3406',2,'相山','x','xiang shan','340603000000','相山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340604','3406',2,'烈山','l','lie shan','340604000000','烈山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340621','3406',2,'濉溪','s','sui xi','340621000000','濉溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3407','34',1,'铜陵','t','tong ling','340700000000','铜陵市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340705','3407',2,'铜官','t','tong guan','340705000000','铜官区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340706','3407',2,'义安','y','yi an','340706000000','义安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340711','3407',2,'郊区','j','jiao qu','340711000000','郊区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340722','3407',2,'枞阳','z','zong yang','340722000000','枞阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3408','34',1,'安庆','a','an qing','340800000000','安庆市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340802','3408',2,'迎江','y','ying jiang','340802000000','迎江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340803','3408',2,'大观','d','da guan','340803000000','大观区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340811','3408',2,'宜秀','y','yi xiu','340811000000','宜秀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340822','3408',2,'怀宁','h','huai ning','340822000000','怀宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340825','3408',2,'太湖','t','tai hu','340825000000','太湖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340826','3408',2,'宿松','s','su song','340826000000','宿松县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340827','3408',2,'望江','w','wang jiang','340827000000','望江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340828','3408',2,'岳西','y','yue xi','340828000000','岳西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340881','3408',2,'桐城','t','tong cheng','340881000000','桐城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('340882','3408',2,'潜山','q','qian shan','340882000000','潜山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3410','34',1,'黄山','h','huang shan','341000000000','黄山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341002','3410',2,'屯溪','t','tun xi','341002000000','屯溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341003','3410',2,'黄山区','h','huang shan qu','341003000000','黄山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341004','3410',2,'徽州','h','hui zhou','341004000000','徽州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341021','3410',2,'歙县','s','she xian','341021000000','歙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341022','3410',2,'休宁','x','xiu ning','341022000000','休宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341023','3410',2,'黟县','y','yi xian','341023000000','黟县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341024','3410',2,'祁门','q','qi men','341024000000','祁门县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3411','34',1,'滁州','c','chu zhou','341100000000','滁州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341102','3411',2,'琅琊','l','lang ya','341102000000','琅琊区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341103','3411',2,'南谯','n','nan qiao','341103000000','南谯区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341122','3411',2,'来安','l','lai an','341122000000','来安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341124','3411',2,'全椒','q','quan jiao','341124000000','全椒县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341125','3411',2,'定远','d','ding yuan','341125000000','定远县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341126','3411',2,'凤阳','f','feng yang','341126000000','凤阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341181','3411',2,'天长','t','tian chang','341181000000','天长市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341182','3411',2,'明光','m','ming guang','341182000000','明光市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3412','34',1,'阜阳','f','fu yang','341200000000','阜阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341202','3412',2,'颍州','y','ying zhou','341202000000','颍州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341203','3412',2,'颍东','y','ying dong','341203000000','颍东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341204','3412',2,'颍泉','y','ying quan','341204000000','颍泉区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341221','3412',2,'临泉','l','lin quan','341221000000','临泉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341222','3412',2,'太和','t','tai he','341222000000','太和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341225','3412',2,'阜南','f','fu nan','341225000000','阜南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341226','3412',2,'颍上','y','ying shang','341226000000','颍上县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341282','3412',2,'界首','j','jie shou','341282000000','界首市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3413','34',1,'宿州','s','su zhou','341300000000','宿州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341302','3413',2,'埇桥','y','yong qiao','341302000000','埇桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341321','3413',2,'砀山','d','dang shan','341321000000','砀山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341322','3413',2,'萧县','x','xiao xian','341322000000','萧县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341323','3413',2,'灵璧','l','ling bi','341323000000','灵璧县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341324','3413',2,'泗县','s','si xian','341324000000','泗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3415','34',1,'六安','l','lu an','341500000000','六安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341502','3415',2,'金安','j','jin an','341502000000','金安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341503','3415',2,'裕安','y','yu an','341503000000','裕安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341504','3415',2,'叶集','y','ye ji','341504000000','叶集区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341522','3415',2,'霍邱','h','huo qiu','341522000000','霍邱县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341523','3415',2,'舒城','s','shu cheng','341523000000','舒城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341524','3415',2,'金寨','j','jin zhai','341524000000','金寨县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341525','3415',2,'霍山','h','huo shan','341525000000','霍山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3416','34',1,'亳州','b','bo zhou','341600000000','亳州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341602','3416',2,'谯城','q','qiao cheng','341602000000','谯城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341621','3416',2,'涡阳','g','guo yang','341621000000','涡阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341622','3416',2,'蒙城','m','meng cheng','341622000000','蒙城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341623','3416',2,'利辛','l','li xin','341623000000','利辛县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3417','34',1,'池州','c','chi zhou','341700000000','池州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341702','3417',2,'贵池','g','gui chi','341702000000','贵池区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341721','3417',2,'东至','d','dong zhi','341721000000','东至县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341722','3417',2,'石台','s','shi tai','341722000000','石台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341723','3417',2,'青阳','q','qing yang','341723000000','青阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3418','34',1,'宣城','x','xuan cheng','341800000000','宣城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341802','3418',2,'宣州','x','xuan zhou','341802000000','宣州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341821','3418',2,'郎溪','l','lang xi','341821000000','郎溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341823','3418',2,'泾县','j','jing xian','341823000000','泾县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341824','3418',2,'绩溪','j','ji xi','341824000000','绩溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341825','3418',2,'旌德','j','jing de','341825000000','旌德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341881','3418',2,'宁国','n','ning guo','341881000000','宁国市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('341882','3418',2,'广德','g','guang de','341882000000','广德市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('35','0',0,'福建','f','fu jian','350000000000','福建省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3501','35',1,'福州','f','fu zhou','350100000000','福州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350102','3501',2,'鼓楼','g','gu lou','350102000000','鼓楼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350103','3501',2,'台江','t','tai jiang','350103000000','台江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350104','3501',2,'仓山','c','cang shan','350104000000','仓山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350105','3501',2,'马尾','m','ma wei','350105000000','马尾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350111','3501',2,'晋安','j','jin an','350111000000','晋安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350112','3501',2,'长乐','c','chang le','350112000000','长乐区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350121','3501',2,'闽侯','m','min hou','350121000000','闽侯县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350122','3501',2,'连江','l','lian jiang','350122000000','连江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350123','3501',2,'罗源','l','luo yuan','350123000000','罗源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350124','3501',2,'闽清','m','min qing','350124000000','闽清县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350125','3501',2,'永泰','y','yong tai','350125000000','永泰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350128','3501',2,'平潭','p','ping tan','350128000000','平潭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350181','3501',2,'福清','f','fu qing','350181000000','福清市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3502','35',1,'厦门','x','xia men','350200000000','厦门市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350203','3502',2,'思明','s','si ming','350203000000','思明区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350205','3502',2,'海沧','h','hai cang','350205000000','海沧区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350206','3502',2,'湖里','h','hu li','350206000000','湖里区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350211','3502',2,'集美','j','ji mei','350211000000','集美区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350212','3502',2,'同安','t','tong an','350212000000','同安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350213','3502',2,'翔安','x','xiang an','350213000000','翔安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3503','35',1,'莆田','p','pu tian','350300000000','莆田市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350302','3503',2,'城厢','c','cheng xiang','350302000000','城厢区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350303','3503',2,'涵江','h','han jiang','350303000000','涵江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350304','3503',2,'荔城','l','li cheng','350304000000','荔城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350305','3503',2,'秀屿','x','xiu yu','350305000000','秀屿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350322','3503',2,'仙游','x','xian you','350322000000','仙游县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3504','35',1,'三明','s','san ming','350400000000','三明市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350404','3504',2,'三元','s','san yuan','350404000000','三元区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350405','3504',2,'沙县','s','sha xian','350405000000','沙县区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350421','3504',2,'明溪','m','ming xi','350421000000','明溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350423','3504',2,'清流','q','qing liu','350423000000','清流县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350424','3504',2,'宁化','n','ning hua','350424000000','宁化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350425','3504',2,'大田','d','da tian','350425000000','大田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350426','3504',2,'尤溪','y','you xi','350426000000','尤溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350428','3504',2,'将乐','j','jiang le','350428000000','将乐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350429','3504',2,'泰宁','t','tai ning','350429000000','泰宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350430','3504',2,'建宁','j','jian ning','350430000000','建宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350481','3504',2,'永安','y','yong an','350481000000','永安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3505','35',1,'泉州','q','quan zhou','350500000000','泉州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350502','3505',2,'鲤城','l','li cheng','350502000000','鲤城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350503','3505',2,'丰泽','f','feng ze','350503000000','丰泽区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350504','3505',2,'洛江','l','luo jiang','350504000000','洛江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350505','3505',2,'泉港','q','quan gang','350505000000','泉港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350521','3505',2,'惠安','h','hui an','350521000000','惠安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350524','3505',2,'安溪','a','an xi','350524000000','安溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350525','3505',2,'永春','y','yong chun','350525000000','永春县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350526','3505',2,'德化','d','de hua','350526000000','德化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350527','3505',2,'金门','j','jin men','350527000000','金门县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350581','3505',2,'石狮','s','shi shi','350581000000','石狮市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350582','3505',2,'晋江','j','jin jiang','350582000000','晋江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350583','3505',2,'南安','n','nan an','350583000000','南安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3506','35',1,'漳州','z','zhang zhou','350600000000','漳州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350602','3506',2,'芗城','x','xiang cheng','350602000000','芗城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350603','3506',2,'龙文','l','long wen','350603000000','龙文区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350604','3506',2,'龙海','l','long hai','350604000000','龙海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350605','3506',2,'长泰','c','chang tai','350605000000','长泰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350622','3506',2,'云霄','y','yun xiao','350622000000','云霄县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350623','3506',2,'漳浦','z','zhang pu','350623000000','漳浦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350624','3506',2,'诏安','z','zhao an','350624000000','诏安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350626','3506',2,'东山','d','dong shan','350626000000','东山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350627','3506',2,'南靖','n','nan jing','350627000000','南靖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350628','3506',2,'平和','p','ping he','350628000000','平和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350629','3506',2,'华安','h','hua an','350629000000','华安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3507','35',1,'南平','n','nan ping','350700000000','南平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350702','3507',2,'延平','y','yan ping','350702000000','延平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350703','3507',2,'建阳','j','jian yang','350703000000','建阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350721','3507',2,'顺昌','s','shun chang','350721000000','顺昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350722','3507',2,'浦城','p','pu cheng','350722000000','浦城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350723','3507',2,'光泽','g','guang ze','350723000000','光泽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350724','3507',2,'松溪','s','song xi','350724000000','松溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350725','3507',2,'政和','z','zheng he','350725000000','政和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350781','3507',2,'邵武','s','shao wu','350781000000','邵武市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350782','3507',2,'武夷山','w','wu yi shan','350782000000','武夷山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350783','3507',2,'建瓯','j','jian ou','350783000000','建瓯市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3508','35',1,'龙岩','l','long yan','350800000000','龙岩市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350802','3508',2,'新罗','x','xin luo','350802000000','新罗区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350803','3508',2,'永定','y','yong ding','350803000000','永定区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350821','3508',2,'长汀','c','chang ting','350821000000','长汀县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350823','3508',2,'上杭','s','shang hang','350823000000','上杭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350824','3508',2,'武平','w','wu ping','350824000000','武平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350825','3508',2,'连城','l','lian cheng','350825000000','连城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350881','3508',2,'漳平','z','zhang ping','350881000000','漳平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3509','35',1,'宁德','n','ning de','350900000000','宁德市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350902','3509',2,'蕉城','j','jiao cheng','350902000000','蕉城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350921','3509',2,'霞浦','x','xia pu','350921000000','霞浦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350922','3509',2,'古田','g','gu tian','350922000000','古田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350923','3509',2,'屏南','p','ping nan','350923000000','屏南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350924','3509',2,'寿宁','s','shou ning','350924000000','寿宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350925','3509',2,'周宁','z','zhou ning','350925000000','周宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350926','3509',2,'柘荣','z','zhe rong','350926000000','柘荣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350981','3509',2,'福安','f','fu an','350981000000','福安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('350982','3509',2,'福鼎','f','fu ding','350982000000','福鼎市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('36','0',0,'江西','j','jiang xi','360000000000','江西省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3601','36',1,'南昌','n','nan chang','360100000000','南昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360102','3601',2,'东湖','d','dong hu','360102000000','东湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360103','3601',2,'西湖','x','xi hu','360103000000','西湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360104','3601',2,'青云谱','q','qing yun pu','360104000000','青云谱区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360111','3601',2,'青山湖','q','qing shan hu','360111000000','青山湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360112','3601',2,'新建','x','xin jian','360112000000','新建区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360113','3601',2,'红谷滩','h','hong gu tan','360113000000','红谷滩区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360121','3601',2,'南昌县','n','nan chang xian','360121000000','南昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360123','3601',2,'安义','a','an yi','360123000000','安义县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360124','3601',2,'进贤','j','jin xian','360124000000','进贤县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3602','36',1,'景德镇','j','jing de zhen','360200000000','景德镇市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360202','3602',2,'昌江','c','chang jiang','360202000000','昌江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360203','3602',2,'珠山','z','zhu shan','360203000000','珠山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360222','3602',2,'浮梁','f','fu liang','360222000000','浮梁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360281','3602',2,'乐平','l','le ping','360281000000','乐平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3603','36',1,'萍乡','p','ping xiang','360300000000','萍乡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360302','3603',2,'安源','a','an yuan','360302000000','安源区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360313','3603',2,'湘东','x','xiang dong','360313000000','湘东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360321','3603',2,'莲花','l','lian hua','360321000000','莲花县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360322','3603',2,'上栗','s','shang li','360322000000','上栗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360323','3603',2,'芦溪','l','lu xi','360323000000','芦溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3604','36',1,'九江','j','jiu jiang','360400000000','九江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360402','3604',2,'濂溪','l','lian xi','360402000000','濂溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360403','3604',2,'浔阳','x','xun yang','360403000000','浔阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360404','3604',2,'柴桑','c','chai sang','360404000000','柴桑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360423','3604',2,'武宁','w','wu ning','360423000000','武宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360424','3604',2,'修水','x','xiu shui','360424000000','修水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360425','3604',2,'永修','y','yong xiu','360425000000','永修县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360426','3604',2,'德安','d','de an','360426000000','德安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360428','3604',2,'都昌','d','du chang','360428000000','都昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360429','3604',2,'湖口','h','hu kou','360429000000','湖口县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360430','3604',2,'彭泽','p','peng ze','360430000000','彭泽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360481','3604',2,'瑞昌','r','rui chang','360481000000','瑞昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360482','3604',2,'共青城','g','gong qing cheng','360482000000','共青城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360483','3604',2,'庐山','l','lu shan','360483000000','庐山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3605','36',1,'新余','x','xin yu','360500000000','新余市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360502','3605',2,'渝水','y','yu shui','360502000000','渝水区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360521','3605',2,'分宜','f','fen yi','360521000000','分宜县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3606','36',1,'鹰潭','y','ying tan','360600000000','鹰潭市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360602','3606',2,'月湖','y','yue hu','360602000000','月湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360603','3606',2,'余江','y','yu jiang','360603000000','余江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360681','3606',2,'贵溪','g','gui xi','360681000000','贵溪市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3607','36',1,'赣州','g','gan zhou','360700000000','赣州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360702','3607',2,'章贡','z','zhang gong','360702000000','章贡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360703','3607',2,'南康','n','nan kang','360703000000','南康区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360704','3607',2,'赣县','g','gan xian','360704000000','赣县区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360722','3607',2,'信丰','x','xin feng','360722000000','信丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360723','3607',2,'大余','d','da yu','360723000000','大余县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360724','3607',2,'上犹','s','shang you','360724000000','上犹县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360725','3607',2,'崇义','c','chong yi','360725000000','崇义县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360726','3607',2,'安远','a','an yuan','360726000000','安远县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360728','3607',2,'定南','d','ding nan','360728000000','定南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360729','3607',2,'全南','q','quan nan','360729000000','全南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360730','3607',2,'宁都','n','ning du','360730000000','宁都县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360731','3607',2,'于都','y','yu du','360731000000','于都县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360732','3607',2,'兴国','x','xing guo','360732000000','兴国县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360733','3607',2,'会昌','h','hui chang','360733000000','会昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360734','3607',2,'寻乌','x','xun wu','360734000000','寻乌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360735','3607',2,'石城','s','shi cheng','360735000000','石城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360781','3607',2,'瑞金','r','rui jin','360781000000','瑞金市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360783','3607',2,'龙南','l','long nan','360783000000','龙南市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3608','36',1,'吉安','j','ji an','360800000000','吉安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360802','3608',2,'吉州','j','ji zhou','360802000000','吉州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360803','3608',2,'青原','q','qing yuan','360803000000','青原区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360821','3608',2,'吉安县','j','ji an xian','360821000000','吉安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360822','3608',2,'吉水','j','ji shui','360822000000','吉水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360823','3608',2,'峡江','x','xia jiang','360823000000','峡江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360824','3608',2,'新干','x','xin gan','360824000000','新干县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360825','3608',2,'永丰','y','yong feng','360825000000','永丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360826','3608',2,'泰和','t','tai he','360826000000','泰和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360827','3608',2,'遂川','s','sui chuan','360827000000','遂川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360828','3608',2,'万安','w','wan an','360828000000','万安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360829','3608',2,'安福','a','an fu','360829000000','安福县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360830','3608',2,'永新','y','yong xin','360830000000','永新县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360881','3608',2,'井冈山','j','jing gang shan','360881000000','井冈山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3609','36',1,'宜春','y','yi chun','360900000000','宜春市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360902','3609',2,'袁州','y','yuan zhou','360902000000','袁州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360921','3609',2,'奉新','f','feng xin','360921000000','奉新县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360922','3609',2,'万载','w','wan zai','360922000000','万载县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360923','3609',2,'上高','s','shang gao','360923000000','上高县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360924','3609',2,'宜丰','y','yi feng','360924000000','宜丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360925','3609',2,'靖安','j','jing an','360925000000','靖安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360926','3609',2,'铜鼓','t','tong gu','360926000000','铜鼓县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360981','3609',2,'丰城','f','feng cheng','360981000000','丰城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360982','3609',2,'樟树','z','zhang shu','360982000000','樟树市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('360983','3609',2,'高安','g','gao an','360983000000','高安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3610','36',1,'抚州','f','fu zhou','361000000000','抚州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361002','3610',2,'临川','l','lin chuan','361002000000','临川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361003','3610',2,'东乡','d','dong xiang','361003000000','东乡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361021','3610',2,'南城','n','nan cheng','361021000000','南城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361022','3610',2,'黎川','l','li chuan','361022000000','黎川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361023','3610',2,'南丰','n','nan feng','361023000000','南丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361024','3610',2,'崇仁','c','chong ren','361024000000','崇仁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361025','3610',2,'乐安','l','le an','361025000000','乐安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361026','3610',2,'宜黄','y','yi huang','361026000000','宜黄县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361027','3610',2,'金溪','j','jin xi','361027000000','金溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361028','3610',2,'资溪','z','zi xi','361028000000','资溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361030','3610',2,'广昌','g','guang chang','361030000000','广昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3611','36',1,'上饶','s','shang rao','361100000000','上饶市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361102','3611',2,'信州','x','xin zhou','361102000000','信州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361103','3611',2,'广丰','g','guang feng','361103000000','广丰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361104','3611',2,'广信','g','guang xin','361104000000','广信区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361123','3611',2,'玉山','y','yu shan','361123000000','玉山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361124','3611',2,'铅山','y','yan shan','361124000000','铅山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361125','3611',2,'横峰','h','heng feng','361125000000','横峰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361126','3611',2,'弋阳','y','yi yang','361126000000','弋阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361127','3611',2,'余干','y','yu gan','361127000000','余干县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361128','3611',2,'鄱阳','p','po yang','361128000000','鄱阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361129','3611',2,'万年','w','wan nian','361129000000','万年县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361130','3611',2,'婺源','w','wu yuan','361130000000','婺源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('361181','3611',2,'德兴','d','de xing','361181000000','德兴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('37','0',0,'山东','s','shan dong','370000000000','山东省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3701','37',1,'济南','j','ji nan','370100000000','济南市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370102','3701',2,'历下','l','li xia','370102000000','历下区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370103','3701',2,'市中','s','shi zhong','370103000000','市中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370104','3701',2,'槐荫','h','huai yin','370104000000','槐荫区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370105','3701',2,'天桥','t','tian qiao','370105000000','天桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370112','3701',2,'历城','l','li cheng','370112000000','历城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370113','3701',2,'长清','c','chang qing','370113000000','长清区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370114','3701',2,'章丘','z','zhang qiu','370114000000','章丘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370115','3701',2,'济阳','j','ji yang','370115000000','济阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370116','3701',2,'莱芜','l','lai wu','370116000000','莱芜区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370117','3701',2,'钢城','g','gang cheng','370117000000','钢城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370124','3701',2,'平阴','p','ping yin','370124000000','平阴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370126','3701',2,'商河','s','shang he','370126000000','商河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3702','37',1,'青岛','q','qing dao','370200000000','青岛市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370202','3702',2,'市南','s','shi nan','370202000000','市南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370203','3702',2,'市北','s','shi bei','370203000000','市北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370211','3702',2,'黄岛','h','huang dao','370211000000','黄岛区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370212','3702',2,'崂山','l','lao shan','370212000000','崂山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370213','3702',2,'李沧','l','li cang','370213000000','李沧区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370214','3702',2,'城阳','c','cheng yang','370214000000','城阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370215','3702',2,'即墨','j','ji mo','370215000000','即墨区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370281','3702',2,'胶州','j','jiao zhou','370281000000','胶州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370283','3702',2,'平度','p','ping du','370283000000','平度市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370285','3702',2,'莱西','l','lai xi','370285000000','莱西市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3703','37',1,'淄博','z','zi bo','370300000000','淄博市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370302','3703',2,'淄川','z','zi chuan','370302000000','淄川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370303','3703',2,'张店','z','zhang dian','370303000000','张店区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370304','3703',2,'博山','b','bo shan','370304000000','博山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370305','3703',2,'临淄','l','lin zi','370305000000','临淄区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370306','3703',2,'周村','z','zhou cun','370306000000','周村区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370321','3703',2,'桓台','h','huan tai','370321000000','桓台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370322','3703',2,'高青','g','gao qing','370322000000','高青县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370323','3703',2,'沂源','y','yi yuan','370323000000','沂源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3704','37',1,'枣庄','z','zao zhuang','370400000000','枣庄市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370402','3704',2,'市中','s','shi zhong','370402000000','市中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370403','3704',2,'薛城','x','xue cheng','370403000000','薛城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370404','3704',2,'峄城','y','yi cheng','370404000000','峄城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370405','3704',2,'台儿庄','t','tai er zhuang','370405000000','台儿庄区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370406','3704',2,'山亭','s','shan ting','370406000000','山亭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370481','3704',2,'滕州','t','teng zhou','370481000000','滕州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3705','37',1,'东营','d','dong ying','370500000000','东营市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370502','3705',2,'东营区','d','dong ying qu','370502000000','东营区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370503','3705',2,'河口','h','he kou','370503000000','河口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370505','3705',2,'垦利','k','ken li','370505000000','垦利区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370522','3705',2,'利津','l','li jin','370522000000','利津县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370523','3705',2,'广饶','g','guang rao','370523000000','广饶县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3706','37',1,'烟台','y','yan tai','370600000000','烟台市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370602','3706',2,'芝罘','z','zhi fu','370602000000','芝罘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370611','3706',2,'福山','f','fu shan','370611000000','福山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370612','3706',2,'牟平','m','mu ping','370612000000','牟平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370613','3706',2,'莱山','l','lai shan','370613000000','莱山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370614','3706',2,'蓬莱','p','peng lai','370614000000','蓬莱区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370681','3706',2,'龙口','l','long kou','370681000000','龙口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370682','3706',2,'莱阳','l','lai yang','370682000000','莱阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370683','3706',2,'莱州','l','lai zhou','370683000000','莱州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370685','3706',2,'招远','z','zhao yuan','370685000000','招远市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370686','3706',2,'栖霞','q','qi xia','370686000000','栖霞市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370687','3706',2,'海阳','h','hai yang','370687000000','海阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3707','37',1,'潍坊','w','wei fang','370700000000','潍坊市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370702','3707',2,'潍城','w','wei cheng','370702000000','潍城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370703','3707',2,'寒亭','h','han ting','370703000000','寒亭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370704','3707',2,'坊子','f','fang zi','370704000000','坊子区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370705','3707',2,'奎文','k','kui wen','370705000000','奎文区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370724','3707',2,'临朐','l','lin qu','370724000000','临朐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370725','3707',2,'昌乐','c','chang le','370725000000','昌乐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370781','3707',2,'青州','q','qing zhou','370781000000','青州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370782','3707',2,'诸城','z','zhu cheng','370782000000','诸城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370783','3707',2,'寿光','s','shou guang','370783000000','寿光市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370784','3707',2,'安丘','a','an qiu','370784000000','安丘市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370785','3707',2,'高密','g','gao mi','370785000000','高密市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370786','3707',2,'昌邑','c','chang yi','370786000000','昌邑市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3708','37',1,'济宁','j','ji ning','370800000000','济宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370811','3708',2,'任城','r','ren cheng','370811000000','任城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370812','3708',2,'兖州','y','yan zhou','370812000000','兖州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370826','3708',2,'微山','w','wei shan','370826000000','微山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370827','3708',2,'鱼台','y','yu tai','370827000000','鱼台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370828','3708',2,'金乡','j','jin xiang','370828000000','金乡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370829','3708',2,'嘉祥','j','jia xiang','370829000000','嘉祥县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370830','3708',2,'汶上','w','wen shang','370830000000','汶上县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370831','3708',2,'泗水','s','si shui','370831000000','泗水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370832','3708',2,'梁山','l','liang shan','370832000000','梁山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370881','3708',2,'曲阜','q','qu fu','370881000000','曲阜市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370883','3708',2,'邹城','z','zou cheng','370883000000','邹城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3709','37',1,'泰安','t','tai an','370900000000','泰安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370902','3709',2,'泰山','t','tai shan','370902000000','泰山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370911','3709',2,'岱岳','d','dai yue','370911000000','岱岳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370921','3709',2,'宁阳','n','ning yang','370921000000','宁阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370923','3709',2,'东平','d','dong ping','370923000000','东平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370982','3709',2,'新泰','x','xin tai','370982000000','新泰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('370983','3709',2,'肥城','f','fei cheng','370983000000','肥城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3710','37',1,'威海','w','wei hai','371000000000','威海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371002','3710',2,'环翠','h','huan cui','371002000000','环翠区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371003','3710',2,'文登','w','wen deng','371003000000','文登区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371082','3710',2,'荣成','r','rong cheng','371082000000','荣成市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371083','3710',2,'乳山','r','ru shan','371083000000','乳山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3711','37',1,'日照','r','ri zhao','371100000000','日照市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371102','3711',2,'东港','d','dong gang','371102000000','东港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371103','3711',2,'岚山','l','lan shan','371103000000','岚山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371121','3711',2,'五莲','w','wu lian','371121000000','五莲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371122','3711',2,'莒县','j','ju xian','371122000000','莒县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3713','37',1,'临沂','l','lin yi','371300000000','临沂市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371302','3713',2,'兰山','l','lan shan','371302000000','兰山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371311','3713',2,'罗庄','l','luo zhuang','371311000000','罗庄区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371312','3713',2,'河东','h','he dong','371312000000','河东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371321','3713',2,'沂南','y','yi nan','371321000000','沂南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371322','3713',2,'郯城','t','tan cheng','371322000000','郯城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371323','3713',2,'沂水','y','yi shui','371323000000','沂水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371324','3713',2,'兰陵','l','lan ling','371324000000','兰陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371325','3713',2,'费县','f','fei xian','371325000000','费县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371326','3713',2,'平邑','p','ping yi','371326000000','平邑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371327','3713',2,'莒南','j','ju nan','371327000000','莒南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371328','3713',2,'蒙阴','m','meng yin','371328000000','蒙阴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371329','3713',2,'临沭','l','lin shu','371329000000','临沭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3714','37',1,'德州','d','de zhou','371400000000','德州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371402','3714',2,'德城','d','de cheng','371402000000','德城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371403','3714',2,'陵城','l','ling cheng','371403000000','陵城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371422','3714',2,'宁津','n','ning jin','371422000000','宁津县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371423','3714',2,'庆云','q','qing yun','371423000000','庆云县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371424','3714',2,'临邑','l','lin yi','371424000000','临邑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371425','3714',2,'齐河','q','qi he','371425000000','齐河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371426','3714',2,'平原','p','ping yuan','371426000000','平原县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371427','3714',2,'夏津','x','xia jin','371427000000','夏津县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371428','3714',2,'武城','w','wu cheng','371428000000','武城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371481','3714',2,'乐陵','l','le ling','371481000000','乐陵市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371482','3714',2,'禹城','y','yu cheng','371482000000','禹城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3715','37',1,'聊城','l','liao cheng','371500000000','聊城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371502','3715',2,'东昌府','d','dong chang fu','371502000000','东昌府区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371503','3715',2,'茌平','c','chi ping','371503000000','茌平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371521','3715',2,'阳谷','y','yang gu','371521000000','阳谷县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371522','3715',2,'莘县','s','shen xian','371522000000','莘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371524','3715',2,'东阿','d','dong e','371524000000','东阿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371525','3715',2,'冠县','g','guan xian','371525000000','冠县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371526','3715',2,'高唐','g','gao tang','371526000000','高唐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371581','3715',2,'临清','l','lin qing','371581000000','临清市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3716','37',1,'滨州','b','bin zhou','371600000000','滨州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371602','3716',2,'滨城','b','bin cheng','371602000000','滨城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371603','3716',2,'沾化','z','zhan hua','371603000000','沾化区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371621','3716',2,'惠民','h','hui min','371621000000','惠民县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371622','3716',2,'阳信','y','yang xin','371622000000','阳信县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371623','3716',2,'无棣','w','wu di','371623000000','无棣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371625','3716',2,'博兴','b','bo xing','371625000000','博兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371681','3716',2,'邹平','z','zou ping','371681000000','邹平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('3717','37',1,'菏泽','h','he ze','371700000000','菏泽市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371702','3717',2,'牡丹','m','mu dan','371702000000','牡丹区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371703','3717',2,'定陶','d','ding tao','371703000000','定陶区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371721','3717',2,'曹县','c','cao xian','371721000000','曹县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371722','3717',2,'单县','s','shan xian','371722000000','单县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371723','3717',2,'成武','c','cheng wu','371723000000','成武县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371724','3717',2,'巨野','j','ju ye','371724000000','巨野县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371725','3717',2,'郓城','y','yun cheng','371725000000','郓城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371726','3717',2,'鄄城','j','juan cheng','371726000000','鄄城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('371728','3717',2,'东明','d','dong ming','371728000000','东明县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('41','0',0,'河南','h','he nan','410000000000','河南省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4101','41',1,'郑州','z','zheng zhou','410100000000','郑州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410102','4101',2,'中原','z','zhong yuan','410102000000','中原区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410103','4101',2,'二七','e','er qi','410103000000','二七区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410104','4101',2,'管城','g','guan cheng','410104000000','管城回族区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410105','4101',2,'金水','j','jin shui','410105000000','金水区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410106','4101',2,'上街','s','shang jie','410106000000','上街区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410108','4101',2,'惠济','h','hui ji','410108000000','惠济区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410122','4101',2,'中牟','z','zhong mu','410122000000','中牟县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410181','4101',2,'巩义','g','gong yi','410181000000','巩义市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410182','4101',2,'荥阳','x','xing yang','410182000000','荥阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410183','4101',2,'新密','x','xin mi','410183000000','新密市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410184','4101',2,'新郑','x','xin zheng','410184000000','新郑市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410185','4101',2,'登封','d','deng feng','410185000000','登封市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4102','41',1,'开封','k','kai feng','410200000000','开封市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410202','4102',2,'龙亭','l','long ting','410202000000','龙亭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410203','4102',2,'顺河','s','shun he','410203000000','顺河回族区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410204','4102',2,'鼓楼','g','gu lou','410204000000','鼓楼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410205','4102',2,'禹王台','y','yu wang tai','410205000000','禹王台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410212','4102',2,'祥符','x','xiang fu','410212000000','祥符区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410221','4102',2,'杞县','q','qi xian','410221000000','杞县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410222','4102',2,'通许','t','tong xu','410222000000','通许县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410223','4102',2,'尉氏','w','wei shi','410223000000','尉氏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410225','4102',2,'兰考','l','lan kao','410225000000','兰考县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4103','41',1,'洛阳','l','luo yang','410300000000','洛阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410302','4103',2,'老城','l','lao cheng','410302000000','老城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410303','4103',2,'西工','x','xi gong','410303000000','西工区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410304','4103',2,'瀍河','c','chan he','410304000000','瀍河回族区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410305','4103',2,'涧西','j','jian xi','410305000000','涧西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410307','4103',2,'偃师','y','yan shi','410307000000','偃师区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410308','4103',2,'孟津','m','meng jin','410308000000','孟津区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410311','4103',2,'洛龙','l','luo long','410311000000','洛龙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410323','4103',2,'新安','x','xin an','410323000000','新安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410324','4103',2,'栾川','l','luan chuan','410324000000','栾川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410325','4103',2,'嵩县','s','song xian','410325000000','嵩县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410326','4103',2,'汝阳','r','ru yang','410326000000','汝阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410327','4103',2,'宜阳','y','yi yang','410327000000','宜阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410328','4103',2,'洛宁','l','luo ning','410328000000','洛宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410329','4103',2,'伊川','y','yi chuan','410329000000','伊川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4104','41',1,'平顶山','p','ping ding shan','410400000000','平顶山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410402','4104',2,'新华','x','xin hua','410402000000','新华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410403','4104',2,'卫东','w','wei dong','410403000000','卫东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410404','4104',2,'石龙','s','shi long','410404000000','石龙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410411','4104',2,'湛河','z','zhan he','410411000000','湛河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410421','4104',2,'宝丰','b','bao feng','410421000000','宝丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410422','4104',2,'叶县','y','ye xian','410422000000','叶县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410423','4104',2,'鲁山','l','lu shan','410423000000','鲁山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410425','4104',2,'郏县','j','jia xian','410425000000','郏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410481','4104',2,'舞钢','w','wu gang','410481000000','舞钢市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410482','4104',2,'汝州','r','ru zhou','410482000000','汝州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4105','41',1,'安阳','a','an yang','410500000000','安阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410502','4105',2,'文峰','w','wen feng','410502000000','文峰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410503','4105',2,'北关','b','bei guan','410503000000','北关区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410505','4105',2,'殷都','y','yin du','410505000000','殷都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410506','4105',2,'龙安','l','long an','410506000000','龙安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410522','4105',2,'安阳县','a','an yang xian','410522000000','安阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410523','4105',2,'汤阴','t','tang yin','410523000000','汤阴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410526','4105',2,'滑县','h','hua xian','410526000000','滑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410527','4105',2,'内黄','n','nei huang','410527000000','内黄县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410581','4105',2,'林州','l','lin zhou','410581000000','林州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4106','41',1,'鹤壁','h','he bi','410600000000','鹤壁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410602','4106',2,'鹤山','h','he shan','410602000000','鹤山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410603','4106',2,'山城','s','shan cheng','410603000000','山城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410611','4106',2,'淇滨','q','qi bin','410611000000','淇滨区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410621','4106',2,'浚县','x','xun xian','410621000000','浚县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410622','4106',2,'淇县','q','qi xian','410622000000','淇县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4107','41',1,'新乡','x','xin xiang','410700000000','新乡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410702','4107',2,'红旗','h','hong qi','410702000000','红旗区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410703','4107',2,'卫滨','w','wei bin','410703000000','卫滨区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410704','4107',2,'凤泉','f','feng quan','410704000000','凤泉区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410711','4107',2,'牧野','m','mu ye','410711000000','牧野区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410721','4107',2,'新乡县','x','xin xiang xian','410721000000','新乡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410724','4107',2,'获嘉','h','huo jia','410724000000','获嘉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410725','4107',2,'原阳','y','yuan yang','410725000000','原阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410726','4107',2,'延津','y','yan jin','410726000000','延津县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410727','4107',2,'封丘','f','feng qiu','410727000000','封丘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410781','4107',2,'卫辉','w','wei hui','410781000000','卫辉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410782','4107',2,'辉县','h','hui xian','410782000000','辉县市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410783','4107',2,'长垣','c','chang yuan','410783000000','长垣市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4108','41',1,'焦作','j','jiao zuo','410800000000','焦作市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410802','4108',2,'解放','j','jie fang','410802000000','解放区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410803','4108',2,'中站','z','zhong zhan','410803000000','中站区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410804','4108',2,'马村','m','ma cun','410804000000','马村区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410811','4108',2,'山阳','s','shan yang','410811000000','山阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410821','4108',2,'修武','x','xiu wu','410821000000','修武县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410822','4108',2,'博爱','b','bo ai','410822000000','博爱县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410823','4108',2,'武陟','w','wu zhi','410823000000','武陟县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410825','4108',2,'温县','w','wen xian','410825000000','温县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410882','4108',2,'沁阳','q','qin yang','410882000000','沁阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410883','4108',2,'孟州','m','meng zhou','410883000000','孟州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4109','41',1,'濮阳','p','pu yang','410900000000','濮阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410902','4109',2,'华龙','h','hua long','410902000000','华龙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410922','4109',2,'清丰','q','qing feng','410922000000','清丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410923','4109',2,'南乐','n','nan le','410923000000','南乐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410926','4109',2,'范县','f','fan xian','410926000000','范县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410927','4109',2,'台前','t','tai qian','410927000000','台前县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('410928','4109',2,'濮阳县','p','pu yang xian','410928000000','濮阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4110','41',1,'许昌','x','xu chang','411000000000','许昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411002','4110',2,'魏都','w','wei du','411002000000','魏都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411003','4110',2,'建安','j','jian an','411003000000','建安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411024','4110',2,'鄢陵','y','yan ling','411024000000','鄢陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411025','4110',2,'襄城','x','xiang cheng','411025000000','襄城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411081','4110',2,'禹州','y','yu zhou','411081000000','禹州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411082','4110',2,'长葛','c','chang ge','411082000000','长葛市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4111','41',1,'漯河','l','luo he','411100000000','漯河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411102','4111',2,'源汇','y','yuan hui','411102000000','源汇区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411103','4111',2,'郾城','y','yan cheng','411103000000','郾城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411104','4111',2,'召陵','s','shao ling','411104000000','召陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411121','4111',2,'舞阳','w','wu yang','411121000000','舞阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411122','4111',2,'临颍','l','lin ying','411122000000','临颍县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4112','41',1,'三门峡','s','san men xia','411200000000','三门峡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411202','4112',2,'湖滨','h','hu bin','411202000000','湖滨区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411203','4112',2,'陕州','s','shan zhou','411203000000','陕州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411221','4112',2,'渑池','m','mian chi','411221000000','渑池县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411224','4112',2,'卢氏','l','lu shi','411224000000','卢氏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411281','4112',2,'义马','y','yi ma','411281000000','义马市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411282','4112',2,'灵宝','l','ling bao','411282000000','灵宝市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4113','41',1,'南阳','n','nan yang','411300000000','南阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411302','4113',2,'宛城','w','wan cheng','411302000000','宛城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411303','4113',2,'卧龙','w','wo long','411303000000','卧龙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411321','4113',2,'南召','n','nan zhao','411321000000','南召县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411322','4113',2,'方城','f','fang cheng','411322000000','方城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411323','4113',2,'西峡','x','xi xia','411323000000','西峡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411324','4113',2,'镇平','z','zhen ping','411324000000','镇平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411325','4113',2,'内乡','n','nei xiang','411325000000','内乡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411326','4113',2,'淅川','x','xi chuan','411326000000','淅川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411327','4113',2,'社旗','s','she qi','411327000000','社旗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411328','4113',2,'唐河','t','tang he','411328000000','唐河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411329','4113',2,'新野','x','xin ye','411329000000','新野县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411330','4113',2,'桐柏','t','tong bai','411330000000','桐柏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411381','4113',2,'邓州','d','deng zhou','411381000000','邓州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4114','41',1,'商丘','s','shang qiu','411400000000','商丘市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411402','4114',2,'梁园','l','liang yuan','411402000000','梁园区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411403','4114',2,'睢阳','s','sui yang','411403000000','睢阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411421','4114',2,'民权','m','min quan','411421000000','民权县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411422','4114',2,'睢县','s','sui xian','411422000000','睢县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411423','4114',2,'宁陵','n','ning ling','411423000000','宁陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411424','4114',2,'柘城','z','zhe cheng','411424000000','柘城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411425','4114',2,'虞城','y','yu cheng','411425000000','虞城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411426','4114',2,'夏邑','x','xia yi','411426000000','夏邑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411481','4114',2,'永城','y','yong cheng','411481000000','永城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4115','41',1,'信阳','x','xin yang','411500000000','信阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411502','4115',2,'浉河','s','shi he','411502000000','浉河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411503','4115',2,'平桥','p','ping qiao','411503000000','平桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411521','4115',2,'罗山','l','luo shan','411521000000','罗山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411522','4115',2,'光山','g','guang shan','411522000000','光山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411523','4115',2,'新县','x','xin xian','411523000000','新县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411524','4115',2,'商城','s','shang cheng','411524000000','商城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411525','4115',2,'固始','g','gu shi','411525000000','固始县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411526','4115',2,'潢川','h','huang chuan','411526000000','潢川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411527','4115',2,'淮滨','h','huai bin','411527000000','淮滨县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411528','4115',2,'息县','x','xi xian','411528000000','息县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4116','41',1,'周口','z','zhou kou','411600000000','周口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411602','4116',2,'川汇','c','chuan hui','411602000000','川汇区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411603','4116',2,'淮阳','h','huai yang','411603000000','淮阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411621','4116',2,'扶沟','f','fu gou','411621000000','扶沟县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411622','4116',2,'西华','x','xi hua','411622000000','西华县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411623','4116',2,'商水','s','shang shui','411623000000','商水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411624','4116',2,'沈丘','s','shen qiu','411624000000','沈丘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411625','4116',2,'郸城','d','dan cheng','411625000000','郸城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411627','4116',2,'太康','t','tai kang','411627000000','太康县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411628','4116',2,'鹿邑','l','lu yi','411628000000','鹿邑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411681','4116',2,'项城','x','xiang cheng','411681000000','项城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4117','41',1,'驻马店','z','zhu ma dian','411700000000','驻马店市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411702','4117',2,'驿城','y','yi cheng','411702000000','驿城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411721','4117',2,'西平','x','xi ping','411721000000','西平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411722','4117',2,'上蔡','s','shang cai','411722000000','上蔡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411723','4117',2,'平舆','p','ping yu','411723000000','平舆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411724','4117',2,'正阳','z','zheng yang','411724000000','正阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411725','4117',2,'确山','q','que shan','411725000000','确山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411726','4117',2,'泌阳','b','bi yang','411726000000','泌阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411727','4117',2,'汝南','r','ru nan','411727000000','汝南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411728','4117',2,'遂平','s','sui ping','411728000000','遂平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('411729','4117',2,'新蔡','x','xin cai','411729000000','新蔡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('419001','41',1,'济源','j','ji yuan','419001000000','济源市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('419001000','419001',2,'济源','j','ji yuan','419001000000','济源市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('42','0',0,'湖北','h','hu bei','420000000000','湖北省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4201','42',1,'武汉','w','wu han','420100000000','武汉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420102','4201',2,'江岸','j','jiang an','420102000000','江岸区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420103','4201',2,'江汉','j','jiang han','420103000000','江汉区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420104','4201',2,'硚口','q','qiao kou','420104000000','硚口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420105','4201',2,'汉阳','h','han yang','420105000000','汉阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420106','4201',2,'武昌','w','wu chang','420106000000','武昌区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420107','4201',2,'青山','q','qing shan','420107000000','青山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420111','4201',2,'洪山','h','hong shan','420111000000','洪山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420112','4201',2,'东西湖','d','dong xi hu','420112000000','东西湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420113','4201',2,'汉南','h','han nan','420113000000','汉南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420114','4201',2,'蔡甸','c','cai dian','420114000000','蔡甸区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420115','4201',2,'江夏','j','jiang xia','420115000000','江夏区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420116','4201',2,'黄陂','h','huang pi','420116000000','黄陂区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420117','4201',2,'新洲','x','xin zhou','420117000000','新洲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4202','42',1,'黄石','h','huang shi','420200000000','黄石市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420202','4202',2,'黄石港','h','huang shi gang','420202000000','黄石港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420203','4202',2,'西塞山','x','xi sai shan','420203000000','西塞山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420204','4202',2,'下陆','x','xia lu','420204000000','下陆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420205','4202',2,'铁山','t','tie shan','420205000000','铁山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420222','4202',2,'阳新','y','yang xin','420222000000','阳新县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420281','4202',2,'大冶','d','da ye','420281000000','大冶市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4203','42',1,'十堰','s','shi yan','420300000000','十堰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420302','4203',2,'茅箭','m','mao jian','420302000000','茅箭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420303','4203',2,'张湾','z','zhang wan','420303000000','张湾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420304','4203',2,'郧阳','y','yun yang','420304000000','郧阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420322','4203',2,'郧西','y','yun xi','420322000000','郧西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420323','4203',2,'竹山','z','zhu shan','420323000000','竹山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420324','4203',2,'竹溪','z','zhu xi','420324000000','竹溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420325','4203',2,'房县','f','fang xian','420325000000','房县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420381','4203',2,'丹江口','d','dan jiang kou','420381000000','丹江口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4205','42',1,'宜昌','y','yi chang','420500000000','宜昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420502','4205',2,'西陵','x','xi ling','420502000000','西陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420503','4205',2,'伍家岗','w','wu jia gang','420503000000','伍家岗区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420504','4205',2,'点军','d','dian jun','420504000000','点军区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420505','4205',2,'猇亭','x','xiao ting','420505000000','猇亭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420506','4205',2,'夷陵','y','yi ling','420506000000','夷陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420525','4205',2,'远安','y','yuan an','420525000000','远安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420526','4205',2,'兴山','x','xing shan','420526000000','兴山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420527','4205',2,'秭归','z','zi gui','420527000000','秭归县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420528','4205',2,'长阳','c','chang yang','420528000000','长阳土家族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420529','4205',2,'五峰','w','wu feng','420529000000','五峰土家族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420581','4205',2,'宜都','y','yi du','420581000000','宜都市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420582','4205',2,'当阳','d','dang yang','420582000000','当阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420583','4205',2,'枝江','z','zhi jiang','420583000000','枝江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4206','42',1,'襄阳','x','xiang yang','420600000000','襄阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420602','4206',2,'襄城','x','xiang cheng','420602000000','襄城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420606','4206',2,'樊城','f','fan cheng','420606000000','樊城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420607','4206',2,'襄州','x','xiang zhou','420607000000','襄州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420624','4206',2,'南漳','n','nan zhang','420624000000','南漳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420625','4206',2,'谷城','g','gu cheng','420625000000','谷城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420626','4206',2,'保康','b','bao kang','420626000000','保康县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420682','4206',2,'老河口','l','lao he kou','420682000000','老河口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420683','4206',2,'枣阳','z','zao yang','420683000000','枣阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420684','4206',2,'宜城','y','yi cheng','420684000000','宜城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4207','42',1,'鄂州','e','e zhou','420700000000','鄂州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420702','4207',2,'梁子湖','l','liang zi hu','420702000000','梁子湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420703','4207',2,'华容','h','hua rong','420703000000','华容区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420704','4207',2,'鄂城','e','e cheng','420704000000','鄂城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4208','42',1,'荆门','j','jing men','420800000000','荆门市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420802','4208',2,'东宝','d','dong bao','420802000000','东宝区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420804','4208',2,'掇刀','d','duo dao','420804000000','掇刀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420822','4208',2,'沙洋','s','sha yang','420822000000','沙洋县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420881','4208',2,'钟祥','z','zhong xiang','420881000000','钟祥市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420882','4208',2,'京山','j','jing shan','420882000000','京山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4209','42',1,'孝感','x','xiao gan','420900000000','孝感市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420902','4209',2,'孝南','x','xiao nan','420902000000','孝南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420921','4209',2,'孝昌','x','xiao chang','420921000000','孝昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420922','4209',2,'大悟','d','da wu','420922000000','大悟县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420923','4209',2,'云梦','y','yun meng','420923000000','云梦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420981','4209',2,'应城','y','ying cheng','420981000000','应城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420982','4209',2,'安陆','a','an lu','420982000000','安陆市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('420984','4209',2,'汉川','h','han chuan','420984000000','汉川市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4210','42',1,'荆州','j','jing zhou','421000000000','荆州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421002','4210',2,'沙市','s','sha shi','421002000000','沙市区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421003','4210',2,'荆州区','j','jing zhou qu','421003000000','荆州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421022','4210',2,'公安','g','gong an','421022000000','公安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421024','4210',2,'江陵','j','jiang ling','421024000000','江陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421081','4210',2,'石首','s','shi shou','421081000000','石首市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421083','4210',2,'洪湖','h','hong hu','421083000000','洪湖市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421087','4210',2,'松滋','s','song zi','421087000000','松滋市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421088','4210',2,'监利','j','jian li','421088000000','监利市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4211','42',1,'黄冈','h','huang gang','421100000000','黄冈市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421102','4211',2,'黄州','h','huang zhou','421102000000','黄州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421121','4211',2,'团风','t','tuan feng','421121000000','团风县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421122','4211',2,'红安','h','hong an','421122000000','红安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421123','4211',2,'罗田','l','luo tian','421123000000','罗田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421124','4211',2,'英山','y','ying shan','421124000000','英山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421125','4211',2,'浠水','x','xi shui','421125000000','浠水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421126','4211',2,'蕲春','q','qi chun','421126000000','蕲春县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421127','4211',2,'黄梅','h','huang mei','421127000000','黄梅县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421181','4211',2,'麻城','m','ma cheng','421181000000','麻城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421182','4211',2,'武穴','w','wu xue','421182000000','武穴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4212','42',1,'咸宁','x','xian ning','421200000000','咸宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421202','4212',2,'咸安','x','xian an','421202000000','咸安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421221','4212',2,'嘉鱼','j','jia yu','421221000000','嘉鱼县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421222','4212',2,'通城','t','tong cheng','421222000000','通城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421223','4212',2,'崇阳','c','chong yang','421223000000','崇阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421224','4212',2,'通山','t','tong shan','421224000000','通山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421281','4212',2,'赤壁','c','chi bi','421281000000','赤壁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4213','42',1,'随州','s','sui zhou','421300000000','随州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421303','4213',2,'曾都','z','zeng du','421303000000','曾都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421321','4213',2,'随县','s','sui xian','421321000000','随县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('421381','4213',2,'广水','g','guang shui','421381000000','广水市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4228','42',1,'恩施','e','en shi','422800000000','恩施土家族苗族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('422801','4228',2,'恩施市','e','en shi shi','422801000000','恩施市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('422802','4228',2,'利川','l','li chuan','422802000000','利川市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('422822','4228',2,'建始','j','jian shi','422822000000','建始县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('422823','4228',2,'巴东','b','ba dong','422823000000','巴东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('422825','4228',2,'宣恩','x','xuan en','422825000000','宣恩县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('422826','4228',2,'咸丰','x','xian feng','422826000000','咸丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('422827','4228',2,'来凤','l','lai feng','422827000000','来凤县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('422828','4228',2,'鹤峰','h','he feng','422828000000','鹤峰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('429004','42',1,'仙桃','x','xian tao','429004000000','仙桃市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('429004000','429004',2,'仙桃','x','xian tao','429004000000','仙桃市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('429005','42',1,'潜江','q','qian jiang','429005000000','潜江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('429005000','429005',2,'潜江','q','qian jiang','429005000000','潜江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('429006','42',1,'天门','t','tian men','429006000000','天门市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('429006000','429006',2,'天门','t','tian men','429006000000','天门市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('429021','42',1,'神农架','s','shen nong jia','429021000000','神农架林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('429021000','429021',2,'神农架林区','s','shen nong jia lin qu','429021000000','神农架林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('43','0',0,'湖南','h','hu nan','430000000000','湖南省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4301','43',1,'长沙','c','chang sha','430100000000','长沙市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430102','4301',2,'芙蓉','f','fu rong','430102000000','芙蓉区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430103','4301',2,'天心','t','tian xin','430103000000','天心区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430104','4301',2,'岳麓','y','yue lu','430104000000','岳麓区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430105','4301',2,'开福','k','kai fu','430105000000','开福区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430111','4301',2,'雨花','y','yu hua','430111000000','雨花区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430112','4301',2,'望城','w','wang cheng','430112000000','望城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430121','4301',2,'长沙县','c','chang sha xian','430121000000','长沙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430181','4301',2,'浏阳','l','liu yang','430181000000','浏阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430182','4301',2,'宁乡','n','ning xiang','430182000000','宁乡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4302','43',1,'株洲','z','zhu zhou','430200000000','株洲市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430202','4302',2,'荷塘','h','he tang','430202000000','荷塘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430203','4302',2,'芦淞','l','lu song','430203000000','芦淞区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430204','4302',2,'石峰','s','shi feng','430204000000','石峰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430211','4302',2,'天元','t','tian yuan','430211000000','天元区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430212','4302',2,'渌口','l','lu kou','430212000000','渌口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430223','4302',2,'攸县','y','you xian','430223000000','攸县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430224','4302',2,'茶陵','c','cha ling','430224000000','茶陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430225','4302',2,'炎陵','y','yan ling','430225000000','炎陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430281','4302',2,'醴陵','l','li ling','430281000000','醴陵市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4303','43',1,'湘潭','x','xiang tan','430300000000','湘潭市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430302','4303',2,'雨湖','y','yu hu','430302000000','雨湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430304','4303',2,'岳塘','y','yue tang','430304000000','岳塘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430321','4303',2,'湘潭县','x','xiang tan xian','430321000000','湘潭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430381','4303',2,'湘乡','x','xiang xiang','430381000000','湘乡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430382','4303',2,'韶山','s','shao shan','430382000000','韶山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4304','43',1,'衡阳','h','heng yang','430400000000','衡阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430405','4304',2,'珠晖','z','zhu hui','430405000000','珠晖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430406','4304',2,'雁峰','y','yan feng','430406000000','雁峰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430407','4304',2,'石鼓','s','shi gu','430407000000','石鼓区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430408','4304',2,'蒸湘','z','zheng xiang','430408000000','蒸湘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430412','4304',2,'南岳','n','nan yue','430412000000','南岳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430421','4304',2,'衡阳县','h','heng yang xian','430421000000','衡阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430422','4304',2,'衡南','h','heng nan','430422000000','衡南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430423','4304',2,'衡山','h','heng shan','430423000000','衡山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430424','4304',2,'衡东','h','heng dong','430424000000','衡东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430426','4304',2,'祁东','q','qi dong','430426000000','祁东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430481','4304',2,'耒阳','l','lei yang','430481000000','耒阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430482','4304',2,'常宁','c','chang ning','430482000000','常宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4305','43',1,'邵阳','s','shao yang','430500000000','邵阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430502','4305',2,'双清','s','shuang qing','430502000000','双清区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430503','4305',2,'大祥','d','da xiang','430503000000','大祥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430511','4305',2,'北塔','b','bei ta','430511000000','北塔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430522','4305',2,'新邵','x','xin shao','430522000000','新邵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430523','4305',2,'邵阳县','s','shao yang xian','430523000000','邵阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430524','4305',2,'隆回','l','long hui','430524000000','隆回县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430525','4305',2,'洞口','d','dong kou','430525000000','洞口县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430527','4305',2,'绥宁','s','sui ning','430527000000','绥宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430528','4305',2,'新宁','x','xin ning','430528000000','新宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430529','4305',2,'城步','c','cheng bu','430529000000','城步苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430581','4305',2,'武冈','w','wu gang','430581000000','武冈市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430582','4305',2,'邵东','s','shao dong','430582000000','邵东市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4306','43',1,'岳阳','y','yue yang','430600000000','岳阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430602','4306',2,'岳阳楼','y','yue yang lou','430602000000','岳阳楼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430603','4306',2,'云溪','y','yun xi','430603000000','云溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430611','4306',2,'君山','j','jun shan','430611000000','君山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430621','4306',2,'岳阳县','y','yue yang xian','430621000000','岳阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430623','4306',2,'华容','h','hua rong','430623000000','华容县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430624','4306',2,'湘阴','x','xiang yin','430624000000','湘阴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430626','4306',2,'平江','p','ping jiang','430626000000','平江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430681','4306',2,'汨罗','m','mi luo','430681000000','汨罗市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430682','4306',2,'临湘','l','lin xiang','430682000000','临湘市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4307','43',1,'常德','c','chang de','430700000000','常德市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430702','4307',2,'武陵','w','wu ling','430702000000','武陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430703','4307',2,'鼎城','d','ding cheng','430703000000','鼎城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430721','4307',2,'安乡','a','an xiang','430721000000','安乡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430722','4307',2,'汉寿','h','han shou','430722000000','汉寿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430723','4307',2,'澧县','l','li xian','430723000000','澧县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430724','4307',2,'临澧','l','lin li','430724000000','临澧县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430725','4307',2,'桃源','t','tao yuan','430725000000','桃源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430726','4307',2,'石门','s','shi men','430726000000','石门县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430781','4307',2,'津市','j','jin shi','430781000000','津市市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4308','43',1,'张家界','z','zhang jia jie','430800000000','张家界市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430802','4308',2,'永定','y','yong ding','430802000000','永定区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430811','4308',2,'武陵源','w','wu ling yuan','430811000000','武陵源区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430821','4308',2,'慈利','c','ci li','430821000000','慈利县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430822','4308',2,'桑植','s','sang zhi','430822000000','桑植县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4309','43',1,'益阳','y','yi yang','430900000000','益阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430902','4309',2,'资阳','z','zi yang','430902000000','资阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430903','4309',2,'赫山','h','he shan','430903000000','赫山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430921','4309',2,'南县','n','nan xian','430921000000','南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430922','4309',2,'桃江','t','tao jiang','430922000000','桃江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430923','4309',2,'安化','a','an hua','430923000000','安化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('430981','4309',2,'沅江','y','yuan jiang','430981000000','沅江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4310','43',1,'郴州','c','chen zhou','431000000000','郴州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431002','4310',2,'北湖','b','bei hu','431002000000','北湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431003','4310',2,'苏仙','s','su xian','431003000000','苏仙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431021','4310',2,'桂阳','g','gui yang','431021000000','桂阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431022','4310',2,'宜章','y','yi zhang','431022000000','宜章县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431023','4310',2,'永兴','y','yong xing','431023000000','永兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431024','4310',2,'嘉禾','j','jia he','431024000000','嘉禾县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431025','4310',2,'临武','l','lin wu','431025000000','临武县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431026','4310',2,'汝城','r','ru cheng','431026000000','汝城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431027','4310',2,'桂东','g','gui dong','431027000000','桂东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431028','4310',2,'安仁','a','an ren','431028000000','安仁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431081','4310',2,'资兴','z','zi xing','431081000000','资兴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4311','43',1,'永州','y','yong zhou','431100000000','永州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431102','4311',2,'零陵','l','ling ling','431102000000','零陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431103','4311',2,'冷水滩','l','leng shui tan','431103000000','冷水滩区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431122','4311',2,'东安','d','dong an','431122000000','东安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431123','4311',2,'双牌','s','shuang pai','431123000000','双牌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431124','4311',2,'道县','d','dao xian','431124000000','道县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431125','4311',2,'江永','j','jiang yong','431125000000','江永县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431126','4311',2,'宁远','n','ning yuan','431126000000','宁远县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431127','4311',2,'蓝山','l','lan shan','431127000000','蓝山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431128','4311',2,'新田','x','xin tian','431128000000','新田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431129','4311',2,'江华','j','jiang hua','431129000000','江华瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431181','4311',2,'祁阳','q','qi yang','431181000000','祁阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4312','43',1,'怀化','h','huai hua','431200000000','怀化市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431202','4312',2,'鹤城','h','he cheng','431202000000','鹤城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431221','4312',2,'中方','z','zhong fang','431221000000','中方县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431222','4312',2,'沅陵','y','yuan ling','431222000000','沅陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431223','4312',2,'辰溪','c','chen xi','431223000000','辰溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431224','4312',2,'溆浦','x','xu pu','431224000000','溆浦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431225','4312',2,'会同','h','hui tong','431225000000','会同县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431226','4312',2,'麻阳','m','ma yang','431226000000','麻阳苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431227','4312',2,'新晃','x','xin huang','431227000000','新晃侗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431228','4312',2,'芷江','z','zhi jiang','431228000000','芷江侗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431229','4312',2,'靖州','j','jing zhou','431229000000','靖州苗族侗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431230','4312',2,'通道','t','tong dao','431230000000','通道侗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431281','4312',2,'洪江','h','hong jiang','431281000000','洪江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4313','43',1,'娄底','l','lou di','431300000000','娄底市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431302','4313',2,'娄星','l','lou xing','431302000000','娄星区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431321','4313',2,'双峰','s','shuang feng','431321000000','双峰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431322','4313',2,'新化','x','xin hua','431322000000','新化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431381','4313',2,'冷水江','l','leng shui jiang','431381000000','冷水江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('431382','4313',2,'涟源','l','lian yuan','431382000000','涟源市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4331','43',1,'湘西','x','xiang xi','433100000000','湘西土家族苗族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('433101','4331',2,'吉首','j','ji shou','433101000000','吉首市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('433122','4331',2,'泸溪','l','lu xi','433122000000','泸溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('433123','4331',2,'凤凰','f','feng huang','433123000000','凤凰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('433124','4331',2,'花垣','h','hua yuan','433124000000','花垣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('433125','4331',2,'保靖','b','bao jing','433125000000','保靖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('433126','4331',2,'古丈','g','gu zhang','433126000000','古丈县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('433127','4331',2,'永顺','y','yong shun','433127000000','永顺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('433130','4331',2,'龙山','l','long shan','433130000000','龙山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('44','0',0,'广东','g','guang dong','440000000000','广东省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4401','44',1,'广州','g','guang zhou','440100000000','广州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440103','4401',2,'荔湾','l','li wan','440103000000','荔湾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440104','4401',2,'越秀','y','yue xiu','440104000000','越秀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440105','4401',2,'海珠','h','hai zhu','440105000000','海珠区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440106','4401',2,'天河','t','tian he','440106000000','天河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440111','4401',2,'白云','b','bai yun','440111000000','白云区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440112','4401',2,'黄埔','h','huang pu','440112000000','黄埔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440113','4401',2,'番禺','p','pan yu','440113000000','番禺区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440114','4401',2,'花都','h','hua du','440114000000','花都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440115','4401',2,'南沙','n','nan sha','440115000000','南沙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440117','4401',2,'从化','c','cong hua','440117000000','从化区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440118','4401',2,'增城','z','zeng cheng','440118000000','增城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4402','44',1,'韶关','s','shao guan','440200000000','韶关市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440203','4402',2,'武江','w','wu jiang','440203000000','武江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440204','4402',2,'浈江','z','zhen jiang','440204000000','浈江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440205','4402',2,'曲江','q','qu jiang','440205000000','曲江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440222','4402',2,'始兴','s','shi xing','440222000000','始兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440224','4402',2,'仁化','r','ren hua','440224000000','仁化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440229','4402',2,'翁源','w','weng yuan','440229000000','翁源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440232','4402',2,'乳源','r','ru yuan','440232000000','乳源瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440233','4402',2,'新丰','x','xin feng','440233000000','新丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440281','4402',2,'乐昌','l','le chang','440281000000','乐昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440282','4402',2,'南雄','n','nan xiong','440282000000','南雄市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4403','44',1,'深圳','s','shen zhen','440300000000','深圳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440303','4403',2,'罗湖','l','luo hu','440303000000','罗湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440304','4403',2,'福田','f','fu tian','440304000000','福田区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440305','4403',2,'南山','n','nan shan','440305000000','南山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440306','4403',2,'宝安','b','bao an','440306000000','宝安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440307','4403',2,'龙岗','l','long gang','440307000000','龙岗区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440308','4403',2,'盐田','y','yan tian','440308000000','盐田区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440309','4403',2,'龙华','l','long hua','440309000000','龙华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440310','4403',2,'坪山','p','ping shan','440310000000','坪山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440311','4403',2,'光明','g','guang ming','440311000000','光明区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4404','44',1,'珠海','z','zhu hai','440400000000','珠海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440402','4404',2,'香洲','x','xiang zhou','440402000000','香洲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440403','4404',2,'斗门','d','dou men','440403000000','斗门区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440404','4404',2,'金湾','j','jin wan','440404000000','金湾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4405','44',1,'汕头','s','shan tou','440500000000','汕头市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440507','4405',2,'龙湖','l','long hu','440507000000','龙湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440511','4405',2,'金平','j','jin ping','440511000000','金平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440512','4405',2,'濠江','h','hao jiang','440512000000','濠江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440513','4405',2,'潮阳','c','chao yang','440513000000','潮阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440514','4405',2,'潮南','c','chao nan','440514000000','潮南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440515','4405',2,'澄海','c','cheng hai','440515000000','澄海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440523','4405',2,'南澳','n','nan ao','440523000000','南澳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4406','44',1,'佛山','f','fo shan','440600000000','佛山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440604','4406',2,'禅城','c','chan cheng','440604000000','禅城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440605','4406',2,'南海','n','nan hai','440605000000','南海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440606','4406',2,'顺德','s','shun de','440606000000','顺德区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440607','4406',2,'三水','s','san shui','440607000000','三水区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440608','4406',2,'高明','g','gao ming','440608000000','高明区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4407','44',1,'江门','j','jiang men','440700000000','江门市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440703','4407',2,'蓬江','p','peng jiang','440703000000','蓬江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440704','4407',2,'江海','j','jiang hai','440704000000','江海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440705','4407',2,'新会','x','xin hui','440705000000','新会区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440781','4407',2,'台山','t','tai shan','440781000000','台山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440783','4407',2,'开平','k','kai ping','440783000000','开平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440784','4407',2,'鹤山','h','he shan','440784000000','鹤山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440785','4407',2,'恩平','e','en ping','440785000000','恩平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4408','44',1,'湛江','z','zhan jiang','440800000000','湛江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440802','4408',2,'赤坎','c','chi kan','440802000000','赤坎区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440803','4408',2,'霞山','x','xia shan','440803000000','霞山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440804','4408',2,'坡头','p','po tou','440804000000','坡头区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440811','4408',2,'麻章','m','ma zhang','440811000000','麻章区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440823','4408',2,'遂溪','s','sui xi','440823000000','遂溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440825','4408',2,'徐闻','x','xu wen','440825000000','徐闻县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440881','4408',2,'廉江','l','lian jiang','440881000000','廉江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440882','4408',2,'雷州','l','lei zhou','440882000000','雷州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440883','4408',2,'吴川','w','wu chuan','440883000000','吴川市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4409','44',1,'茂名','m','mao ming','440900000000','茂名市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440902','4409',2,'茂南','m','mao nan','440902000000','茂南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440904','4409',2,'电白','d','dian bai','440904000000','电白区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440981','4409',2,'高州','g','gao zhou','440981000000','高州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440982','4409',2,'化州','h','hua zhou','440982000000','化州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('440983','4409',2,'信宜','x','xin yi','440983000000','信宜市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4412','44',1,'肇庆','z','zhao qing','441200000000','肇庆市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441202','4412',2,'端州','d','duan zhou','441202000000','端州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441203','4412',2,'鼎湖','d','ding hu','441203000000','鼎湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441204','4412',2,'高要','g','gao yao','441204000000','高要区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441223','4412',2,'广宁','g','guang ning','441223000000','广宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441224','4412',2,'怀集','h','huai ji','441224000000','怀集县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441225','4412',2,'封开','f','feng kai','441225000000','封开县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441226','4412',2,'德庆','d','de qing','441226000000','德庆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441284','4412',2,'四会','s','si hui','441284000000','四会市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4413','44',1,'惠州','h','hui zhou','441300000000','惠州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441302','4413',2,'惠城','h','hui cheng','441302000000','惠城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441303','4413',2,'惠阳','h','hui yang','441303000000','惠阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441322','4413',2,'博罗','b','bo luo','441322000000','博罗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441323','4413',2,'惠东','h','hui dong','441323000000','惠东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441324','4413',2,'龙门','l','long men','441324000000','龙门县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4414','44',1,'梅州','m','mei zhou','441400000000','梅州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441402','4414',2,'梅江','m','mei jiang','441402000000','梅江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441403','4414',2,'梅县','m','mei xian','441403000000','梅县区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441422','4414',2,'大埔','d','da bu','441422000000','大埔县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441423','4414',2,'丰顺','f','feng shun','441423000000','丰顺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441424','4414',2,'五华','w','wu hua','441424000000','五华县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441426','4414',2,'平远','p','ping yuan','441426000000','平远县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441427','4414',2,'蕉岭','j','jiao ling','441427000000','蕉岭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441481','4414',2,'兴宁','x','xing ning','441481000000','兴宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4415','44',1,'汕尾','s','shan wei','441500000000','汕尾市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441502','4415',2,'城区','c','cheng qu','441502000000','城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441521','4415',2,'海丰','h','hai feng','441521000000','海丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441523','4415',2,'陆河','l','lu he','441523000000','陆河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441581','4415',2,'陆丰','l','lu feng','441581000000','陆丰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4416','44',1,'河源','h','he yuan','441600000000','河源市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441602','4416',2,'源城','y','yuan cheng','441602000000','源城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441621','4416',2,'紫金','z','zi jin','441621000000','紫金县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441622','4416',2,'龙川','l','long chuan','441622000000','龙川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441623','4416',2,'连平','l','lian ping','441623000000','连平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441624','4416',2,'和平','h','he ping','441624000000','和平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441625','4416',2,'东源','d','dong yuan','441625000000','东源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4417','44',1,'阳江','y','yang jiang','441700000000','阳江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441702','4417',2,'江城','j','jiang cheng','441702000000','江城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441704','4417',2,'阳东','y','yang dong','441704000000','阳东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441721','4417',2,'阳西','y','yang xi','441721000000','阳西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441781','4417',2,'阳春','y','yang chun','441781000000','阳春市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4418','44',1,'清远','q','qing yuan','441800000000','清远市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441802','4418',2,'清城','q','qing cheng','441802000000','清城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441803','4418',2,'清新区','q','qing xin qu','441803000000','清新区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441821','4418',2,'佛冈','f','fo gang','441821000000','佛冈县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441823','4418',2,'阳山','y','yang shan','441823000000','阳山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441825','4418',2,'连山','l','lian shan','441825000000','连山壮族瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441826','4418',2,'连南','l','lian nan','441826000000','连南瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441881','4418',2,'英德','y','ying de','441881000000','英德市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441882','4418',2,'连州','l','lian zhou','441882000000','连州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4419','44',1,'东莞','d','dong guan','441900000000','东莞市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('441900','4419',2,'东莞','d','dong guan','441900000000','东莞市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4420','44',1,'中山','z','zhong shan','442000000000','中山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('442000','4420',2,'中山','z','zhong shan','442000000000','中山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4451','44',1,'潮州','c','chao zhou','445100000000','潮州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445102','4451',2,'湘桥','x','xiang qiao','445102000000','湘桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445103','4451',2,'潮安','c','chao an','445103000000','潮安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445122','4451',2,'饶平','r','rao ping','445122000000','饶平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4452','44',1,'揭阳','j','jie yang','445200000000','揭阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445202','4452',2,'榕城','r','rong cheng','445202000000','榕城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445203','4452',2,'揭东','j','jie dong','445203000000','揭东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445222','4452',2,'揭西','j','jie xi','445222000000','揭西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445224','4452',2,'惠来','h','hui lai','445224000000','惠来县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445281','4452',2,'普宁','p','pu ning','445281000000','普宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4453','44',1,'云浮','y','yun fu','445300000000','云浮市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445302','4453',2,'云城','y','yun cheng','445302000000','云城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445303','4453',2,'云安','y','yun an','445303000000','云安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445321','4453',2,'新兴','x','xin xing','445321000000','新兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445322','4453',2,'郁南','y','yu nan','445322000000','郁南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('445381','4453',2,'罗定','l','luo ding','445381000000','罗定市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('45','0',0,'广西','g','guang xi','450000000000','广西壮族自治区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4501','45',1,'南宁','n','nan ning','450100000000','南宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450102','4501',2,'兴宁','x','xing ning','450102000000','兴宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450103','4501',2,'青秀','q','qing xiu','450103000000','青秀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450105','4501',2,'江南','j','jiang nan','450105000000','江南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450107','4501',2,'西乡塘','x','xi xiang tang','450107000000','西乡塘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450108','4501',2,'良庆','l','liang qing','450108000000','良庆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450109','4501',2,'邕宁','y','yong ning','450109000000','邕宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450110','4501',2,'武鸣','w','wu ming','450110000000','武鸣区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450123','4501',2,'隆安','l','long an','450123000000','隆安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450124','4501',2,'马山','m','ma shan','450124000000','马山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450125','4501',2,'上林','s','shang lin','450125000000','上林县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450126','4501',2,'宾阳','b','bin yang','450126000000','宾阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450181','4501',2,'横州','h','heng zhou','450181000000','横州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4502','45',1,'柳州','l','liu zhou','450200000000','柳州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450202','4502',2,'城中','c','cheng zhong','450202000000','城中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450203','4502',2,'鱼峰','y','yu feng','450203000000','鱼峰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450204','4502',2,'柳南','l','liu nan','450204000000','柳南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450205','4502',2,'柳北','l','liu bei','450205000000','柳北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450206','4502',2,'柳江','l','liu jiang','450206000000','柳江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450222','4502',2,'柳城','l','liu cheng','450222000000','柳城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450223','4502',2,'鹿寨','l','lu zhai','450223000000','鹿寨县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450224','4502',2,'融安','r','rong an','450224000000','融安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450225','4502',2,'融水','r','rong shui','450225000000','融水苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450226','4502',2,'三江','s','san jiang','450226000000','三江侗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4503','45',1,'桂林','g','gui lin','450300000000','桂林市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450302','4503',2,'秀峰','x','xiu feng','450302000000','秀峰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450303','4503',2,'叠彩','d','die cai','450303000000','叠彩区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450304','4503',2,'象山','x','xiang shan','450304000000','象山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450305','4503',2,'七星','q','qi xing','450305000000','七星区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450311','4503',2,'雁山','y','yan shan','450311000000','雁山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450312','4503',2,'临桂','l','lin gui','450312000000','临桂区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450321','4503',2,'阳朔','y','yang shuo','450321000000','阳朔县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450323','4503',2,'灵川','l','ling chuan','450323000000','灵川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450324','4503',2,'全州','q','quan zhou','450324000000','全州县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450325','4503',2,'兴安','x','xing an','450325000000','兴安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450326','4503',2,'永福','y','yong fu','450326000000','永福县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450327','4503',2,'灌阳','g','guan yang','450327000000','灌阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450328','4503',2,'龙胜','l','long sheng','450328000000','龙胜各族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450329','4503',2,'资源','z','zi yuan','450329000000','资源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450330','4503',2,'平乐','p','ping le','450330000000','平乐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450332','4503',2,'恭城','g','gong cheng','450332000000','恭城瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450381','4503',2,'荔浦','l','li pu','450381000000','荔浦市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4504','45',1,'梧州','w','wu zhou','450400000000','梧州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450403','4504',2,'万秀','w','wan xiu','450403000000','万秀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450405','4504',2,'长洲','c','chang zhou','450405000000','长洲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450406','4504',2,'龙圩','l','long xu','450406000000','龙圩区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450421','4504',2,'苍梧','c','cang wu','450421000000','苍梧县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450422','4504',2,'藤县','t','teng xian','450422000000','藤县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450423','4504',2,'蒙山','m','meng shan','450423000000','蒙山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450481','4504',2,'岑溪','c','cen xi','450481000000','岑溪市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4505','45',1,'北海','b','bei hai','450500000000','北海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450502','4505',2,'海城','h','hai cheng','450502000000','海城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450503','4505',2,'银海','y','yin hai','450503000000','银海区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450512','4505',2,'铁山港','t','tie shan gang','450512000000','铁山港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450521','4505',2,'合浦','h','he pu','450521000000','合浦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4506','45',1,'防城港','f','fang cheng gang','450600000000','防城港市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450602','4506',2,'港口','g','gang kou','450602000000','港口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450603','4506',2,'防城','f','fang cheng','450603000000','防城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450621','4506',2,'上思','s','shang si','450621000000','上思县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450681','4506',2,'东兴','d','dong xing','450681000000','东兴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4507','45',1,'钦州','q','qin zhou','450700000000','钦州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450702','4507',2,'钦南','q','qin nan','450702000000','钦南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450703','4507',2,'钦北','q','qin bei','450703000000','钦北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450721','4507',2,'灵山','l','ling shan','450721000000','灵山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450722','4507',2,'浦北','p','pu bei','450722000000','浦北县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4508','45',1,'贵港','g','gui gang','450800000000','贵港市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450802','4508',2,'港北','g','gang bei','450802000000','港北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450803','4508',2,'港南','g','gang nan','450803000000','港南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450804','4508',2,'覃塘','q','qin tang','450804000000','覃塘区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450821','4508',2,'平南','p','ping nan','450821000000','平南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450881','4508',2,'桂平','g','gui ping','450881000000','桂平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4509','45',1,'玉林','y','yu lin','450900000000','玉林市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450902','4509',2,'玉州','y','yu zhou','450902000000','玉州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450903','4509',2,'福绵','f','fu mian','450903000000','福绵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450921','4509',2,'容县','r','rong xian','450921000000','容县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450922','4509',2,'陆川','l','lu chuan','450922000000','陆川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450923','4509',2,'博白','b','bo bai','450923000000','博白县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450924','4509',2,'兴业','x','xing ye','450924000000','兴业县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('450981','4509',2,'北流','b','bei liu','450981000000','北流市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4510','45',1,'百色','b','bai se','451000000000','百色市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451002','4510',2,'右江','y','you jiang','451002000000','右江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451003','4510',2,'田阳','t','tian yang','451003000000','田阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451022','4510',2,'田东','t','tian dong','451022000000','田东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451024','4510',2,'德保','d','de bao','451024000000','德保县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451026','4510',2,'那坡','n','na po','451026000000','那坡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451027','4510',2,'凌云','l','ling yun','451027000000','凌云县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451028','4510',2,'乐业','l','le ye','451028000000','乐业县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451029','4510',2,'田林','t','tian lin','451029000000','田林县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451030','4510',2,'西林','x','xi lin','451030000000','西林县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451031','4510',2,'隆林','l','long lin','451031000000','隆林各族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451081','4510',2,'靖西','j','jing xi','451081000000','靖西市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451082','4510',2,'平果','p','ping guo','451082000000','平果市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4511','45',1,'贺州','h','he zhou','451100000000','贺州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451102','4511',2,'八步','b','ba bu','451102000000','八步区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451103','4511',2,'平桂','p','ping gui','451103000000','平桂区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451121','4511',2,'昭平','z','zhao ping','451121000000','昭平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451122','4511',2,'钟山','z','zhong shan','451122000000','钟山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451123','4511',2,'富川','f','fu chuan','451123000000','富川瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4512','45',1,'河池','h','he chi','451200000000','河池市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451202','4512',2,'金城江','j','jin cheng jiang','451202000000','金城江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451203','4512',2,'宜州','y','yi zhou','451203000000','宜州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451221','4512',2,'南丹','n','nan dan','451221000000','南丹县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451222','4512',2,'天峨','t','tian e','451222000000','天峨县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451223','4512',2,'凤山','f','feng shan','451223000000','凤山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451224','4512',2,'东兰','d','dong lan','451224000000','东兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451225','4512',2,'罗城','l','luo cheng','451225000000','罗城仫佬族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451226','4512',2,'环江','h','huan jiang','451226000000','环江毛南族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451227','4512',2,'巴马','b','ba ma','451227000000','巴马瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451228','4512',2,'都安','d','du an','451228000000','都安瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451229','4512',2,'大化','d','da hua','451229000000','大化瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4513','45',1,'来宾','l','lai bin','451300000000','来宾市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451302','4513',2,'兴宾','x','xing bin','451302000000','兴宾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451321','4513',2,'忻城','x','xin cheng','451321000000','忻城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451322','4513',2,'象州','x','xiang zhou','451322000000','象州县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451323','4513',2,'武宣','w','wu xuan','451323000000','武宣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451324','4513',2,'金秀','j','jin xiu','451324000000','金秀瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451381','4513',2,'合山','h','he shan','451381000000','合山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4514','45',1,'崇左','c','chong zuo','451400000000','崇左市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451402','4514',2,'江州','j','jiang zhou','451402000000','江州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451421','4514',2,'扶绥','f','fu sui','451421000000','扶绥县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451422','4514',2,'宁明','n','ning ming','451422000000','宁明县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451423','4514',2,'龙州','l','long zhou','451423000000','龙州县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451424','4514',2,'大新','d','da xin','451424000000','大新县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451425','4514',2,'天等','t','tian deng','451425000000','天等县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('451481','4514',2,'凭祥','p','ping xiang','451481000000','凭祥市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('46','0',0,'海南','h','hai nan','460000000000','海南省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4601','46',1,'海口','h','hai kou','460100000000','海口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460105','4601',2,'秀英','x','xiu ying','460105000000','秀英区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460106','4601',2,'龙华','l','long hua','460106000000','龙华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460107','4601',2,'琼山','q','qiong shan','460107000000','琼山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460108','4601',2,'美兰','m','mei lan','460108000000','美兰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4602','46',1,'三亚','s','san ya','460200000000','三亚市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460202','4602',2,'海棠','h','hai tang','460202000000','海棠区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460203','4602',2,'吉阳','j','ji yang','460203000000','吉阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460204','4602',2,'天涯','t','tian ya','460204000000','天涯区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460205','4602',2,'崖州','y','ya zhou','460205000000','崖州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4603','46',1,'三沙','s','san sha','460300000000','三沙市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460301','4603',2,'西沙','x','xi sha','460301000000','西沙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460302','4603',2,'南沙','n','nan sha','460302000000','南沙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('4604','46',1,'儋州','d','dan zhou','460400000000','儋州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('460400','4604',2,'儋州','d','dan zhou','460400000000','儋州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469001','46',1,'五指山','w','wu zhi shan','469001000000','五指山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469001000','469001',2,'五指山','w','wu zhi shan','469001000000','五指山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469002','46',1,'琼海','q','qiong hai','469002000000','琼海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469002000','469002',2,'琼海','q','qiong hai','469002000000','琼海市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469005','46',1,'文昌','w','wen chang','469005000000','文昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469005000','469005',2,'文昌','w','wen chang','469005000000','文昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469006','46',1,'万宁','w','wan ning','469006000000','万宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469006000','469006',2,'万宁','w','wan ning','469006000000','万宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469007','46',1,'东方','d','dong fang','469007000000','东方市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469007000','469007',2,'东方','d','dong fang','469007000000','东方市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469021','46',1,'定安','d','ding an','469021000000','定安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469021000','469021',2,'定安','d','ding an','469021000000','定安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469022','46',1,'屯昌','t','tun chang','469022000000','屯昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469022000','469022',2,'屯昌','t','tun chang','469022000000','屯昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469023','46',1,'澄迈','c','cheng mai','469023000000','澄迈县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469023000','469023',2,'澄迈','c','cheng mai','469023000000','澄迈县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469024','46',1,'临高','l','lin gao','469024000000','临高县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469024000','469024',2,'临高','l','lin gao','469024000000','临高县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469025','46',1,'白沙','b','bai sha','469025000000','白沙黎族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469025000','469025',2,'白沙','b','bai sha','469025000000','白沙黎族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469026','46',1,'昌江','c','chang jiang','469026000000','昌江黎族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469026000','469026',2,'昌江','c','chang jiang','469026000000','昌江黎族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469027','46',1,'乐东','l','le dong','469027000000','乐东黎族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469027000','469027',2,'乐东','l','le dong','469027000000','乐东黎族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469028','46',1,'陵水','l','ling shui','469028000000','陵水黎族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469028000','469028',2,'陵水','l','ling shui','469028000000','陵水黎族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469029','46',1,'保亭','b','bao ting','469029000000','保亭黎族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469029000','469029',2,'保亭','b','bao ting','469029000000','保亭黎族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469030','46',1,'琼中','q','qiong zhong','469030000000','琼中黎族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('469030000','469030',2,'琼中','q','qiong zhong','469030000000','琼中黎族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('50','0',0,'重庆','c','chong qing','500000000000','重庆市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5001','50',1,'重庆城区','c','chong qing cheng qu','500100000000','重庆城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500101','5001',2,'万州','w','wan zhou','500101000000','万州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500102','5001',2,'涪陵','f','fu ling','500102000000','涪陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500103','5001',2,'渝中','y','yu zhong','500103000000','渝中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500104','5001',2,'大渡口','d','da du kou','500104000000','大渡口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500105','5001',2,'江北','j','jiang bei','500105000000','江北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500106','5001',2,'沙坪坝','s','sha ping ba','500106000000','沙坪坝区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500107','5001',2,'九龙坡','j','jiu long po','500107000000','九龙坡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500108','5001',2,'南岸','n','nan an','500108000000','南岸区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500109','5001',2,'北碚','b','bei bei','500109000000','北碚区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500110','5001',2,'綦江','q','qi jiang','500110000000','綦江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500111','5001',2,'大足','d','da zu','500111000000','大足区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500112','5001',2,'渝北','y','yu bei','500112000000','渝北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500113','5001',2,'巴南','b','ba nan','500113000000','巴南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500114','5001',2,'黔江','q','qian jiang','500114000000','黔江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500115','5001',2,'长寿','c','chang shou','500115000000','长寿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500116','5001',2,'江津','j','jiang jin','500116000000','江津区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500117','5001',2,'合川','h','he chuan','500117000000','合川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500118','5001',2,'永川','y','yong chuan','500118000000','永川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500119','5001',2,'南川','n','nan chuan','500119000000','南川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500120','5001',2,'璧山','b','bi shan','500120000000','璧山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500151','5001',2,'铜梁','t','tong liang','500151000000','铜梁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500152','5001',2,'潼南','t','tong nan','500152000000','潼南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500153','5001',2,'荣昌','r','rong chang','500153000000','荣昌区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500154','5001',2,'开州','k','kai zhou','500154000000','开州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500155','5001',2,'梁平','l','liang ping','500155000000','梁平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500156','5001',2,'武隆','w','wu long','500156000000','武隆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5002','50',1,'重庆郊县','c','chong qing jiao xian','500200000000','重庆郊县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500229','5002',2,'城口','c','cheng kou','500229000000','城口县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500230','5002',2,'丰都','f','feng du','500230000000','丰都县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500231','5002',2,'垫江','d','dian jiang','500231000000','垫江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500233','5002',2,'忠县','z','zhong xian','500233000000','忠县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500235','5002',2,'云阳','y','yun yang','500235000000','云阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500236','5002',2,'奉节','f','feng jie','500236000000','奉节县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500237','5002',2,'巫山','w','wu shan','500237000000','巫山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500238','5002',2,'巫溪','w','wu xi','500238000000','巫溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500240','5002',2,'石柱','s','shi zhu','500240000000','石柱土家族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500241','5002',2,'秀山','x','xiu shan','500241000000','秀山土家族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500242','5002',2,'酉阳','y','you yang','500242000000','酉阳土家族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('500243','5002',2,'彭水','p','peng shui','500243000000','彭水苗族土家族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('51','0',0,'四川','s','si chuan','510000000000','四川省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5101','51',1,'成都','c','cheng du','510100000000','成都市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510104','5101',2,'锦江','j','jin jiang','510104000000','锦江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510105','5101',2,'青羊','q','qing yang','510105000000','青羊区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510106','5101',2,'金牛','j','jin niu','510106000000','金牛区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510107','5101',2,'武侯','w','wu hou','510107000000','武侯区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510108','5101',2,'成华','c','cheng hua','510108000000','成华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510112','5101',2,'龙泉驿','l','long quan yi','510112000000','龙泉驿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510113','5101',2,'青白江','q','qing bai jiang','510113000000','青白江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510114','5101',2,'新都','x','xin du','510114000000','新都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510115','5101',2,'温江','w','wen jiang','510115000000','温江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510116','5101',2,'双流','s','shuang liu','510116000000','双流区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510117','5101',2,'郫都','p','pi du','510117000000','郫都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510118','5101',2,'新津','x','xin jin','510118000000','新津区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510121','5101',2,'金堂','j','jin tang','510121000000','金堂县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510129','5101',2,'大邑','d','da yi','510129000000','大邑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510131','5101',2,'蒲江','p','pu jiang','510131000000','蒲江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510181','5101',2,'都江堰','d','du jiang yan','510181000000','都江堰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510182','5101',2,'彭州','p','peng zhou','510182000000','彭州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510183','5101',2,'邛崃','q','qiong lai','510183000000','邛崃市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510184','5101',2,'崇州','c','chong zhou','510184000000','崇州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510185','5101',2,'简阳','j','jian yang','510185000000','简阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5103','51',1,'自贡','z','zi gong','510300000000','自贡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510302','5103',2,'自流井','z','zi liu jing','510302000000','自流井区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510303','5103',2,'贡井','g','gong jing','510303000000','贡井区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510304','5103',2,'大安','d','da an','510304000000','大安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510311','5103',2,'沿滩','y','yan tan','510311000000','沿滩区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510321','5103',2,'荣县','r','rong xian','510321000000','荣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510322','5103',2,'富顺','f','fu shun','510322000000','富顺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5104','51',1,'攀枝花','p','pan zhi hua','510400000000','攀枝花市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510402','5104',2,'东区','d','dong qu','510402000000','东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510403','5104',2,'西区','x','xi qu','510403000000','西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510411','5104',2,'仁和','r','ren he','510411000000','仁和区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510421','5104',2,'米易','m','mi yi','510421000000','米易县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510422','5104',2,'盐边','y','yan bian','510422000000','盐边县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5105','51',1,'泸州','l','lu zhou','510500000000','泸州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510502','5105',2,'江阳','j','jiang yang','510502000000','江阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510503','5105',2,'纳溪','n','na xi','510503000000','纳溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510504','5105',2,'龙马潭','l','long ma tan','510504000000','龙马潭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510521','5105',2,'泸县','l','lu xian','510521000000','泸县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510522','5105',2,'合江','h','he jiang','510522000000','合江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510524','5105',2,'叙永','x','xu yong','510524000000','叙永县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510525','5105',2,'古蔺','g','gu lin','510525000000','古蔺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5106','51',1,'德阳','d','de yang','510600000000','德阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510603','5106',2,'旌阳','j','jing yang','510603000000','旌阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510604','5106',2,'罗江','l','luo jiang','510604000000','罗江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510623','5106',2,'中江','z','zhong jiang','510623000000','中江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510681','5106',2,'广汉','g','guang han','510681000000','广汉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510682','5106',2,'什邡','s','shi fang','510682000000','什邡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510683','5106',2,'绵竹','m','mian zhu','510683000000','绵竹市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5107','51',1,'绵阳','m','mian yang','510700000000','绵阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510703','5107',2,'涪城','f','fu cheng','510703000000','涪城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510704','5107',2,'游仙','y','you xian','510704000000','游仙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510705','5107',2,'安州','a','an zhou','510705000000','安州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510722','5107',2,'三台','s','san tai','510722000000','三台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510723','5107',2,'盐亭','y','yan ting','510723000000','盐亭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510725','5107',2,'梓潼','z','zi tong','510725000000','梓潼县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510726','5107',2,'北川','b','bei chuan','510726000000','北川羌族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510727','5107',2,'平武','p','ping wu','510727000000','平武县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510781','5107',2,'江油','j','jiang you','510781000000','江油市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5108','51',1,'广元','g','guang yuan','510800000000','广元市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510802','5108',2,'利州','l','li zhou','510802000000','利州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510811','5108',2,'昭化','z','zhao hua','510811000000','昭化区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510812','5108',2,'朝天','c','chao tian','510812000000','朝天区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510821','5108',2,'旺苍','w','wang cang','510821000000','旺苍县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510822','5108',2,'青川','q','qing chuan','510822000000','青川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510823','5108',2,'剑阁','j','jian ge','510823000000','剑阁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510824','5108',2,'苍溪','c','cang xi','510824000000','苍溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5109','51',1,'遂宁','s','sui ning','510900000000','遂宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510903','5109',2,'船山','c','chuan shan','510903000000','船山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510904','5109',2,'安居','a','an ju','510904000000','安居区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510921','5109',2,'蓬溪','p','peng xi','510921000000','蓬溪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510923','5109',2,'大英','d','da ying','510923000000','大英县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('510981','5109',2,'射洪','s','she hong','510981000000','射洪市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5110','51',1,'内江','n','nei jiang','511000000000','内江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511002','5110',2,'市中','s','shi zhong','511002000000','市中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511011','5110',2,'东兴','d','dong xing','511011000000','东兴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511024','5110',2,'威远','w','wei yuan','511024000000','威远县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511025','5110',2,'资中','z','zi zhong','511025000000','资中县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511083','5110',2,'隆昌','l','long chang','511083000000','隆昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5111','51',1,'乐山','l','le shan','511100000000','乐山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511102','5111',2,'市中','s','shi zhong','511102000000','市中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511111','5111',2,'沙湾','s','sha wan','511111000000','沙湾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511112','5111',2,'五通桥','w','wu tong qiao','511112000000','五通桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511113','5111',2,'金口河','j','jin kou he','511113000000','金口河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511123','5111',2,'犍为','q','qian wei','511123000000','犍为县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511124','5111',2,'井研','j','jing yan','511124000000','井研县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511126','5111',2,'夹江','j','jia jiang','511126000000','夹江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511129','5111',2,'沐川','m','mu chuan','511129000000','沐川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511132','5111',2,'峨边','e','e bian','511132000000','峨边彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511133','5111',2,'马边','m','ma bian','511133000000','马边彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511181','5111',2,'峨眉山','e','e mei shan','511181000000','峨眉山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5113','51',1,'南充','n','nan chong','511300000000','南充市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511302','5113',2,'顺庆','s','shun qing','511302000000','顺庆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511303','5113',2,'高坪','g','gao ping','511303000000','高坪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511304','5113',2,'嘉陵','j','jia ling','511304000000','嘉陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511321','5113',2,'南部','n','nan bu','511321000000','南部县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511322','5113',2,'营山','y','ying shan','511322000000','营山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511323','5113',2,'蓬安','p','peng an','511323000000','蓬安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511324','5113',2,'仪陇','y','yi long','511324000000','仪陇县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511325','5113',2,'西充','x','xi chong','511325000000','西充县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511381','5113',2,'阆中','l','lang zhong','511381000000','阆中市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5114','51',1,'眉山','m','mei shan','511400000000','眉山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511402','5114',2,'东坡','d','dong po','511402000000','东坡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511403','5114',2,'彭山','p','peng shan','511403000000','彭山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511421','5114',2,'仁寿','r','ren shou','511421000000','仁寿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511423','5114',2,'洪雅','h','hong ya','511423000000','洪雅县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511424','5114',2,'丹棱','d','dan ling','511424000000','丹棱县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511425','5114',2,'青神','q','qing shen','511425000000','青神县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5115','51',1,'宜宾','y','yi bin','511500000000','宜宾市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511502','5115',2,'翠屏','c','cui ping','511502000000','翠屏区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511503','5115',2,'南溪','n','nan xi','511503000000','南溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511504','5115',2,'叙州','x','xu zhou','511504000000','叙州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511523','5115',2,'江安','j','jiang an','511523000000','江安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511524','5115',2,'长宁','c','chang ning','511524000000','长宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511525','5115',2,'高县','g','gao xian','511525000000','高县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511526','5115',2,'珙县','g','gong xian','511526000000','珙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511527','5115',2,'筠连','j','jun lian','511527000000','筠连县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511528','5115',2,'兴文','x','xing wen','511528000000','兴文县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511529','5115',2,'屏山','p','ping shan','511529000000','屏山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5116','51',1,'广安','g','guang an','511600000000','广安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511602','5116',2,'广安区','g','guang an qu','511602000000','广安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511603','5116',2,'前锋','q','qian feng','511603000000','前锋区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511621','5116',2,'岳池','y','yue chi','511621000000','岳池县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511622','5116',2,'武胜','w','wu sheng','511622000000','武胜县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511623','5116',2,'邻水','l','lin shui','511623000000','邻水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511681','5116',2,'华蓥','h','hua ying','511681000000','华蓥市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5117','51',1,'达州','d','da zhou','511700000000','达州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511702','5117',2,'通川','t','tong chuan','511702000000','通川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511703','5117',2,'达川','d','da chuan','511703000000','达川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511722','5117',2,'宣汉','x','xuan han','511722000000','宣汉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511723','5117',2,'开江','k','kai jiang','511723000000','开江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511724','5117',2,'大竹','d','da zhu','511724000000','大竹县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511725','5117',2,'渠县','q','qu xian','511725000000','渠县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511781','5117',2,'万源','w','wan yuan','511781000000','万源市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5118','51',1,'雅安','y','ya an','511800000000','雅安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511802','5118',2,'雨城','y','yu cheng','511802000000','雨城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511803','5118',2,'名山','m','ming shan','511803000000','名山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511822','5118',2,'荥经','y','ying jing','511822000000','荥经县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511823','5118',2,'汉源','h','han yuan','511823000000','汉源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511824','5118',2,'石棉','s','shi mian','511824000000','石棉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511825','5118',2,'天全','t','tian quan','511825000000','天全县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511826','5118',2,'芦山','l','lu shan','511826000000','芦山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511827','5118',2,'宝兴','b','bao xing','511827000000','宝兴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5119','51',1,'巴中','b','ba zhong','511900000000','巴中市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511902','5119',2,'巴州','b','ba zhou','511902000000','巴州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511903','5119',2,'恩阳','e','en yang','511903000000','恩阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511921','5119',2,'通江','t','tong jiang','511921000000','通江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511922','5119',2,'南江','n','nan jiang','511922000000','南江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('511923','5119',2,'平昌','p','ping chang','511923000000','平昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5120','51',1,'资阳','z','zi yang','512000000000','资阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('512002','5120',2,'雁江','y','yan jiang','512002000000','雁江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('512021','5120',2,'安岳','a','an yue','512021000000','安岳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('512022','5120',2,'乐至','l','le zhi','512022000000','乐至县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5132','51',1,'阿坝','a','a ba','513200000000','阿坝藏族羌族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513201','5132',2,'马尔康','m','ma er kang','513201000000','马尔康市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513221','5132',2,'汶川','w','wen chuan','513221000000','汶川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513222','5132',2,'理县','l','li xian','513222000000','理县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513223','5132',2,'茂县','m','mao xian','513223000000','茂县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513224','5132',2,'松潘','s','song pan','513224000000','松潘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513225','5132',2,'九寨沟','j','jiu zhai gou','513225000000','九寨沟县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513226','5132',2,'金川','j','jin chuan','513226000000','金川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513227','5132',2,'小金','x','xiao jin','513227000000','小金县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513228','5132',2,'黑水','h','hei shui','513228000000','黑水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513230','5132',2,'壤塘','r','rang tang','513230000000','壤塘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513231','5132',2,'阿坝县','a','a ba xian','513231000000','阿坝县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513232','5132',2,'若尔盖','r','ruo er gai','513232000000','若尔盖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513233','5132',2,'红原','h','hong yuan','513233000000','红原县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5133','51',1,'甘孜','g','gan zi','513300000000','甘孜藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513301','5133',2,'康定','k','kang ding','513301000000','康定市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513322','5133',2,'泸定','l','lu ding','513322000000','泸定县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513323','5133',2,'丹巴','d','dan ba','513323000000','丹巴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513324','5133',2,'九龙','j','jiu long','513324000000','九龙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513325','5133',2,'雅江','y','ya jiang','513325000000','雅江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513326','5133',2,'道孚','d','dao fu','513326000000','道孚县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513327','5133',2,'炉霍','l','lu huo','513327000000','炉霍县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513328','5133',2,'甘孜县','g','gan zi xian','513328000000','甘孜县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513329','5133',2,'新龙','x','xin long','513329000000','新龙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513330','5133',2,'德格','d','de ge','513330000000','德格县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513331','5133',2,'白玉','b','bai yu','513331000000','白玉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513332','5133',2,'石渠','s','shi qu','513332000000','石渠县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513333','5133',2,'色达','s','se da','513333000000','色达县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513334','5133',2,'理塘','l','li tang','513334000000','理塘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513335','5133',2,'巴塘','b','ba tang','513335000000','巴塘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513336','5133',2,'乡城','x','xiang cheng','513336000000','乡城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513337','5133',2,'稻城','d','dao cheng','513337000000','稻城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513338','5133',2,'得荣','d','de rong','513338000000','得荣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5134','51',1,'凉山','l','liang shan','513400000000','凉山彝族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513401','5134',2,'西昌','x','xi chang','513401000000','西昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513402','5134',2,'会理','h','hui li','513402000000','会理市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513422','5134',2,'木里','m','mu li','513422000000','木里藏族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513423','5134',2,'盐源','y','yan yuan','513423000000','盐源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513424','5134',2,'德昌','d','de chang','513424000000','德昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513426','5134',2,'会东','h','hui dong','513426000000','会东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513427','5134',2,'宁南','n','ning nan','513427000000','宁南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513428','5134',2,'普格','p','pu ge','513428000000','普格县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513429','5134',2,'布拖','b','bu tuo','513429000000','布拖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513430','5134',2,'金阳','j','jin yang','513430000000','金阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513431','5134',2,'昭觉','z','zhao jue','513431000000','昭觉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513432','5134',2,'喜德','x','xi de','513432000000','喜德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513433','5134',2,'冕宁','m','mian ning','513433000000','冕宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513434','5134',2,'越西','y','yue xi','513434000000','越西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513435','5134',2,'甘洛','g','gan luo','513435000000','甘洛县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513436','5134',2,'美姑','m','mei gu','513436000000','美姑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('513437','5134',2,'雷波','l','lei bo','513437000000','雷波县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('52','0',0,'贵州','g','gui zhou','520000000000','贵州省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5201','52',1,'贵阳','g','gui yang','520100000000','贵阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520102','5201',2,'南明','n','nan ming','520102000000','南明区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520103','5201',2,'云岩','y','yun yan','520103000000','云岩区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520111','5201',2,'花溪','h','hua xi','520111000000','花溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520112','5201',2,'乌当','w','wu dang','520112000000','乌当区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520113','5201',2,'白云','b','bai yun','520113000000','白云区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520115','5201',2,'观山湖','g','guan shan hu','520115000000','观山湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520121','5201',2,'开阳','k','kai yang','520121000000','开阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520122','5201',2,'息烽','x','xi feng','520122000000','息烽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520123','5201',2,'修文','x','xiu wen','520123000000','修文县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520181','5201',2,'清镇','q','qing zhen','520181000000','清镇市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5202','52',1,'六盘水','l','liu pan shui','520200000000','六盘水市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520201','5202',2,'钟山','z','zhong shan','520201000000','钟山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520203','5202',2,'六枝特','l','liu zhi te','520203000000','六枝特区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520204','5202',2,'水城','s','shui cheng','520204000000','水城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520281','5202',2,'盘州','p','pan zhou','520281000000','盘州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5203','52',1,'遵义','z','zun yi','520300000000','遵义市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520302','5203',2,'红花岗','h','hong hua gang','520302000000','红花岗区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520303','5203',2,'汇川','h','hui chuan','520303000000','汇川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520304','5203',2,'播州','b','bo zhou','520304000000','播州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520322','5203',2,'桐梓','t','tong zi','520322000000','桐梓县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520323','5203',2,'绥阳','s','sui yang','520323000000','绥阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520324','5203',2,'正安','z','zheng an','520324000000','正安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520325','5203',2,'道真','d','dao zhen','520325000000','道真仡佬族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520326','5203',2,'务川','w','wu chuan','520326000000','务川仡佬族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520327','5203',2,'凤冈','f','feng gang','520327000000','凤冈县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520328','5203',2,'湄潭','m','mei tan','520328000000','湄潭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520329','5203',2,'余庆','y','yu qing','520329000000','余庆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520330','5203',2,'习水','x','xi shui','520330000000','习水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520381','5203',2,'赤水','c','chi shui','520381000000','赤水市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520382','5203',2,'仁怀','r','ren huai','520382000000','仁怀市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5204','52',1,'安顺','a','an shun','520400000000','安顺市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520402','5204',2,'西秀','x','xi xiu','520402000000','西秀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520403','5204',2,'平坝','p','ping ba','520403000000','平坝区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520422','5204',2,'普定','p','pu ding','520422000000','普定县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520423','5204',2,'镇宁','z','zhen ning','520423000000','镇宁布依族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520424','5204',2,'关岭','g','guan ling','520424000000','关岭布依族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520425','5204',2,'紫云','z','zi yun','520425000000','紫云苗族布依族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5205','52',1,'毕节','b','bi jie','520500000000','毕节市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520502','5205',2,'七星关','q','qi xing guan','520502000000','七星关区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520521','5205',2,'大方','d','da fang','520521000000','大方县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520523','5205',2,'金沙','j','jin sha','520523000000','金沙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520524','5205',2,'织金','z','zhi jin','520524000000','织金县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520525','5205',2,'纳雍','n','na yong','520525000000','纳雍县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520526','5205',2,'威宁','w','wei ning','520526000000','威宁彝族回族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520527','5205',2,'赫章','h','he zhang','520527000000','赫章县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520581','5205',2,'黔西','q','qian xi','520581000000','黔西市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5206','52',1,'铜仁','t','tong ren','520600000000','铜仁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520602','5206',2,'碧江','b','bi jiang','520602000000','碧江区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520603','5206',2,'万山','w','wan shan','520603000000','万山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520621','5206',2,'江口','j','jiang kou','520621000000','江口县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520622','5206',2,'玉屏','y','yu ping','520622000000','玉屏侗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520623','5206',2,'石阡','s','shi qian','520623000000','石阡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520624','5206',2,'思南','s','si nan','520624000000','思南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520625','5206',2,'印江','y','yin jiang','520625000000','印江土家族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520626','5206',2,'德江','d','de jiang','520626000000','德江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520627','5206',2,'沿河','y','yan he','520627000000','沿河土家族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('520628','5206',2,'松桃','s','song tao','520628000000','松桃苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5223','52',1,'黔西南','q','qian xi nan','522300000000','黔西南布依族苗族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522301','5223',2,'兴义','x','xing yi','522301000000','兴义市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522302','5223',2,'兴仁','x','xing ren','522302000000','兴仁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522323','5223',2,'普安','p','pu an','522323000000','普安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522324','5223',2,'晴隆','q','qing long','522324000000','晴隆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522325','5223',2,'贞丰','z','zhen feng','522325000000','贞丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522326','5223',2,'望谟','w','wang mo','522326000000','望谟县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522327','5223',2,'册亨','c','ce heng','522327000000','册亨县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522328','5223',2,'安龙','a','an long','522328000000','安龙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5226','52',1,'黔东南','q','qian dong nan','522600000000','黔东南苗族侗族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522601','5226',2,'凯里','k','kai li','522601000000','凯里市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522622','5226',2,'黄平','h','huang ping','522622000000','黄平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522623','5226',2,'施秉','s','shi bing','522623000000','施秉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522624','5226',2,'三穗','s','san sui','522624000000','三穗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522625','5226',2,'镇远','z','zhen yuan','522625000000','镇远县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522626','5226',2,'岑巩','c','cen gong','522626000000','岑巩县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522627','5226',2,'天柱','t','tian zhu','522627000000','天柱县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522628','5226',2,'锦屏','j','jin ping','522628000000','锦屏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522629','5226',2,'剑河','j','jian he','522629000000','剑河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522630','5226',2,'台江','t','tai jiang','522630000000','台江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522631','5226',2,'黎平','l','li ping','522631000000','黎平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522632','5226',2,'榕江','r','rong jiang','522632000000','榕江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522633','5226',2,'从江','c','cong jiang','522633000000','从江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522634','5226',2,'雷山','l','lei shan','522634000000','雷山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522635','5226',2,'麻江','m','ma jiang','522635000000','麻江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522636','5226',2,'丹寨','d','dan zhai','522636000000','丹寨县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5227','52',1,'黔南','q','qian nan','522700000000','黔南布依族苗族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522701','5227',2,'都匀','d','du yun','522701000000','都匀市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522702','5227',2,'福泉','f','fu quan','522702000000','福泉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522722','5227',2,'荔波','l','li bo','522722000000','荔波县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522723','5227',2,'贵定','g','gui ding','522723000000','贵定县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522725','5227',2,'瓮安','w','weng an','522725000000','瓮安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522726','5227',2,'独山','d','du shan','522726000000','独山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522727','5227',2,'平塘','p','ping tang','522727000000','平塘县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522728','5227',2,'罗甸','l','luo dian','522728000000','罗甸县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522729','5227',2,'长顺','c','chang shun','522729000000','长顺县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522730','5227',2,'龙里','l','long li','522730000000','龙里县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522731','5227',2,'惠水','h','hui shui','522731000000','惠水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('522732','5227',2,'三都','s','san du','522732000000','三都水族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('53','0',0,'云南','y','yun nan','530000000000','云南省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5301','53',1,'昆明','k','kun ming','530100000000','昆明市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530102','5301',2,'五华','w','wu hua','530102000000','五华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530103','5301',2,'盘龙','p','pan long','530103000000','盘龙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530111','5301',2,'官渡','g','guan du','530111000000','官渡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530112','5301',2,'西山','x','xi shan','530112000000','西山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530113','5301',2,'东川','d','dong chuan','530113000000','东川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530114','5301',2,'呈贡','c','cheng gong','530114000000','呈贡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530115','5301',2,'晋宁','j','jin ning','530115000000','晋宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530124','5301',2,'富民','f','fu min','530124000000','富民县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530125','5301',2,'宜良','y','yi liang','530125000000','宜良县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530126','5301',2,'石林','s','shi lin','530126000000','石林彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530127','5301',2,'嵩明','s','song ming','530127000000','嵩明县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530128','5301',2,'禄劝','l','lu quan','530128000000','禄劝彝族苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530129','5301',2,'寻甸','x','xun dian','530129000000','寻甸回族彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530181','5301',2,'安宁','a','an ning','530181000000','安宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5303','53',1,'曲靖','q','qu jing','530300000000','曲靖市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530302','5303',2,'麒麟','q','qi lin','530302000000','麒麟区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530303','5303',2,'沾益','z','zhan yi','530303000000','沾益区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530304','5303',2,'马龙','m','ma long','530304000000','马龙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530322','5303',2,'陆良','l','lu liang','530322000000','陆良县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530323','5303',2,'师宗','s','shi zong','530323000000','师宗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530324','5303',2,'罗平','l','luo ping','530324000000','罗平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530325','5303',2,'富源','f','fu yuan','530325000000','富源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530326','5303',2,'会泽','h','hui ze','530326000000','会泽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530381','5303',2,'宣威','x','xuan wei','530381000000','宣威市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5304','53',1,'玉溪','y','yu xi','530400000000','玉溪市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530402','5304',2,'红塔','h','hong ta','530402000000','红塔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530403','5304',2,'江川','j','jiang chuan','530403000000','江川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530423','5304',2,'通海','t','tong hai','530423000000','通海县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530424','5304',2,'华宁','h','hua ning','530424000000','华宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530425','5304',2,'易门','y','yi men','530425000000','易门县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530426','5304',2,'峨山','e','e shan','530426000000','峨山彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530427','5304',2,'新平','x','xin ping','530427000000','新平彝族傣族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530428','5304',2,'元江','y','yuan jiang','530428000000','元江哈尼族彝族傣族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530481','5304',2,'澄江','c','cheng jiang','530481000000','澄江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5305','53',1,'保山','b','bao shan','530500000000','保山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530502','5305',2,'隆阳','l','long yang','530502000000','隆阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530521','5305',2,'施甸','s','shi dian','530521000000','施甸县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530523','5305',2,'龙陵','l','long ling','530523000000','龙陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530524','5305',2,'昌宁','c','chang ning','530524000000','昌宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530581','5305',2,'腾冲','t','teng chong','530581000000','腾冲市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5306','53',1,'昭通','z','zhao tong','530600000000','昭通市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530602','5306',2,'昭阳','z','zhao yang','530602000000','昭阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530621','5306',2,'鲁甸','l','lu dian','530621000000','鲁甸县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530622','5306',2,'巧家','q','qiao jia','530622000000','巧家县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530623','5306',2,'盐津','y','yan jin','530623000000','盐津县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530624','5306',2,'大关','d','da guan','530624000000','大关县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530625','5306',2,'永善','y','yong shan','530625000000','永善县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530626','5306',2,'绥江','s','sui jiang','530626000000','绥江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530627','5306',2,'镇雄','z','zhen xiong','530627000000','镇雄县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530628','5306',2,'彝良','y','yi liang','530628000000','彝良县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530629','5306',2,'威信','w','wei xin','530629000000','威信县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530681','5306',2,'水富','s','shui fu','530681000000','水富市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5307','53',1,'丽江','l','li jiang','530700000000','丽江市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530702','5307',2,'古城','g','gu cheng','530702000000','古城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530721','5307',2,'玉龙','y','yu long','530721000000','玉龙纳西族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530722','5307',2,'永胜','y','yong sheng','530722000000','永胜县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530723','5307',2,'华坪','h','hua ping','530723000000','华坪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530724','5307',2,'宁蒗','n','ning lang','530724000000','宁蒗彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5308','53',1,'普洱','p','pu er','530800000000','普洱市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530802','5308',2,'思茅','s','si mao','530802000000','思茅区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530821','5308',2,'宁洱','n','ning er','530821000000','宁洱哈尼族彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530822','5308',2,'墨江','m','mo jiang','530822000000','墨江哈尼族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530823','5308',2,'景东','j','jing dong','530823000000','景东彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530824','5308',2,'景谷','j','jing gu','530824000000','景谷傣族彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530825','5308',2,'镇沅','z','zhen yuan','530825000000','镇沅彝族哈尼族拉祜族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530826','5308',2,'江城','j','jiang cheng','530826000000','江城哈尼族彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530827','5308',2,'孟连','m','meng lian','530827000000','孟连傣族拉祜族佤族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530828','5308',2,'澜沧','l','lan cang','530828000000','澜沧拉祜族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530829','5308',2,'西盟','x','xi meng','530829000000','西盟佤族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5309','53',1,'临沧','l','lin cang','530900000000','临沧市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530902','5309',2,'临翔','l','lin xiang','530902000000','临翔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530921','5309',2,'凤庆','f','feng qing','530921000000','凤庆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530922','5309',2,'云县','y','yun xian','530922000000','云县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530923','5309',2,'永德','y','yong de','530923000000','永德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530924','5309',2,'镇康','z','zhen kang','530924000000','镇康县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530925','5309',2,'双江','s','shuang jiang','530925000000','双江拉祜族佤族布朗族傣族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530926','5309',2,'耿马','g','geng ma','530926000000','耿马傣族佤族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('530927','5309',2,'沧源','c','cang yuan','530927000000','沧源佤族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5323','53',1,'楚雄','c','chu xiong','532300000000','楚雄彝族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532301','5323',2,'楚雄市','c','chu xiong shi','532301000000','楚雄市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532302','5323',2,'禄丰','l','lu feng','532302000000','禄丰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532322','5323',2,'双柏','s','shuang bai','532322000000','双柏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532323','5323',2,'牟定','m','mou ding','532323000000','牟定县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532324','5323',2,'南华','n','nan hua','532324000000','南华县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532325','5323',2,'姚安','y','yao an','532325000000','姚安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532326','5323',2,'大姚','d','da yao','532326000000','大姚县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532327','5323',2,'永仁','y','yong ren','532327000000','永仁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532328','5323',2,'元谋','y','yuan mou','532328000000','元谋县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532329','5323',2,'武定','w','wu ding','532329000000','武定县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5325','53',1,'红河','h','hong he','532500000000','红河哈尼族彝族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532501','5325',2,'个旧','g','ge jiu','532501000000','个旧市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532502','5325',2,'开远','k','kai yuan','532502000000','开远市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532503','5325',2,'蒙自','m','meng zi','532503000000','蒙自市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532504','5325',2,'弥勒','m','mi le','532504000000','弥勒市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532523','5325',2,'屏边','p','ping bian','532523000000','屏边苗族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532524','5325',2,'建水','j','jian shui','532524000000','建水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532525','5325',2,'石屏','s','shi ping','532525000000','石屏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532527','5325',2,'泸西','l','lu xi','532527000000','泸西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532528','5325',2,'元阳','y','yuan yang','532528000000','元阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532529','5325',2,'红河县','h','hong he xian','532529000000','红河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532530','5325',2,'金平','j','jin ping','532530000000','金平苗族瑶族傣族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532531','5325',2,'绿春','l','lv chun','532531000000','绿春县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532532','5325',2,'河口','h','he kou','532532000000','河口瑶族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5326','53',1,'文山','w','wen shan','532600000000','文山壮族苗族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532601','5326',2,'文山市','w','wen shan shi','532601000000','文山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532622','5326',2,'砚山','y','yan shan','532622000000','砚山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532623','5326',2,'西畴','x','xi chou','532623000000','西畴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532624','5326',2,'麻栗坡','m','ma li po','532624000000','麻栗坡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532625','5326',2,'马关','m','ma guan','532625000000','马关县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532626','5326',2,'丘北','q','qiu bei','532626000000','丘北县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532627','5326',2,'广南','g','guang nan','532627000000','广南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532628','5326',2,'富宁','f','fu ning','532628000000','富宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5328','53',1,'西双版纳','x','xi shuang ban na','532800000000','西双版纳傣族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532801','5328',2,'景洪','j','jing hong','532801000000','景洪市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532822','5328',2,'勐海','m','meng hai','532822000000','勐海县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532823','5328',2,'勐腊','m','meng la','532823000000','勐腊县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5329','53',1,'大理','d','da li','532900000000','大理白族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532901','5329',2,'大理市','d','da li shi','532901000000','大理市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532922','5329',2,'漾濞','y','yang bi','532922000000','漾濞彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532923','5329',2,'祥云','x','xiang yun','532923000000','祥云县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532924','5329',2,'宾川','b','bin chuan','532924000000','宾川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532925','5329',2,'弥渡','m','mi du','532925000000','弥渡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532926','5329',2,'南涧','n','nan jian','532926000000','南涧彝族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532927','5329',2,'巍山','w','wei shan','532927000000','巍山彝族回族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532928','5329',2,'永平','y','yong ping','532928000000','永平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532929','5329',2,'云龙','y','yun long','532929000000','云龙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532930','5329',2,'洱源','e','er yuan','532930000000','洱源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532931','5329',2,'剑川','j','jian chuan','532931000000','剑川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('532932','5329',2,'鹤庆','h','he qing','532932000000','鹤庆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5331','53',1,'德宏','d','de hong','533100000000','德宏傣族景颇族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533102','5331',2,'瑞丽','r','rui li','533102000000','瑞丽市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533103','5331',2,'芒市','m','mang shi','533103000000','芒市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533122','5331',2,'梁河','l','liang he','533122000000','梁河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533123','5331',2,'盈江','y','ying jiang','533123000000','盈江县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533124','5331',2,'陇川','l','long chuan','533124000000','陇川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5333','53',1,'怒江','n','nu jiang','533300000000','怒江傈僳族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533301','5333',2,'泸水','l','lu shui','533301000000','泸水市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533323','5333',2,'福贡','f','fu gong','533323000000','福贡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533324','5333',2,'贡山','g','gong shan','533324000000','贡山独龙族怒族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533325','5333',2,'兰坪','l','lan ping','533325000000','兰坪白族普米族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5334','53',1,'迪庆','d','di qing','533400000000','迪庆藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533401','5334',2,'香格里拉','x','xiang ge li la','533401000000','香格里拉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533422','5334',2,'德钦','d','de qin','533422000000','德钦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('533423','5334',2,'维西','w','wei xi','533423000000','维西傈僳族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('54','0',0,'西藏','x','xi zang','540000000000','西藏自治区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5401','54',1,'拉萨','l','la sa','540100000000','拉萨市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540102','5401',2,'城关','c','cheng guan','540102000000','城关区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540103','5401',2,'堆龙德庆区','d','dui long de qing qu','540103000000','堆龙德庆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540104','5401',2,'达孜','d','da zi','540104000000','达孜区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540121','5401',2,'林周','l','lin zhou','540121000000','林周县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540122','5401',2,'当雄','d','dang xiong','540122000000','当雄县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540123','5401',2,'尼木','n','ni mu','540123000000','尼木县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540124','5401',2,'曲水','q','qu shui','540124000000','曲水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540127','5401',2,'墨竹工卡','m','mo zhu gong ka','540127000000','墨竹工卡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5402','54',1,'日喀则','r','ri ka ze','540200000000','日喀则市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540202','5402',2,'桑珠孜','s','sang zhu zi','540202000000','桑珠孜区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540221','5402',2,'南木林','n','nan mu lin','540221000000','南木林县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540222','5402',2,'江孜','j','jiang zi','540222000000','江孜县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540223','5402',2,'定日','d','ding ri','540223000000','定日县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540224','5402',2,'萨迦','s','sa jia','540224000000','萨迦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540225','5402',2,'拉孜','l','la zi','540225000000','拉孜县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540226','5402',2,'昂仁','a','ang ren','540226000000','昂仁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540227','5402',2,'谢通门','x','xie tong men','540227000000','谢通门县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540228','5402',2,'白朗','b','bai lang','540228000000','白朗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540229','5402',2,'仁布','r','ren bu','540229000000','仁布县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540230','5402',2,'康马','k','kang ma','540230000000','康马县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540231','5402',2,'定结','d','ding jie','540231000000','定结县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540232','5402',2,'仲巴','z','zhong ba','540232000000','仲巴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540233','5402',2,'亚东','y','ya dong','540233000000','亚东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540234','5402',2,'吉隆','j','ji long','540234000000','吉隆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540235','5402',2,'聂拉木','n','nie la mu','540235000000','聂拉木县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540236','5402',2,'萨嘎','s','sa ga','540236000000','萨嘎县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540237','5402',2,'岗巴','g','gang ba','540237000000','岗巴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5403','54',1,'昌都','c','chang du','540300000000','昌都市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540302','5403',2,'卡若','k','ka ruo','540302000000','卡若区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540321','5403',2,'江达','j','jiang da','540321000000','江达县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540322','5403',2,'贡觉','g','gong jue','540322000000','贡觉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540323','5403',2,'类乌齐','l','lei wu qi','540323000000','类乌齐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540324','5403',2,'丁青','d','ding qing','540324000000','丁青县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540325','5403',2,'察雅','c','cha ya','540325000000','察雅县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540326','5403',2,'八宿','b','ba su','540326000000','八宿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540327','5403',2,'左贡','z','zuo gong','540327000000','左贡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540328','5403',2,'芒康','m','mang kang','540328000000','芒康县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540329','5403',2,'洛隆','l','luo long','540329000000','洛隆县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540330','5403',2,'边坝','b','bian ba','540330000000','边坝县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5404','54',1,'林芝','l','lin zhi','540400000000','林芝市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540402','5404',2,'巴宜','b','ba yi','540402000000','巴宜区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540421','5404',2,'工布江达','g','gong bu jiang da','540421000000','工布江达县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540422','5404',2,'米林','m','mi lin','540422000000','米林市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540423','5404',2,'墨脱','m','mo tuo','540423000000','墨脱县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540424','5404',2,'波密','b','bo mi','540424000000','波密县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540425','5404',2,'察隅','c','cha yu','540425000000','察隅县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540426','5404',2,'朗县','l','lang xian','540426000000','朗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5405','54',1,'山南','s','shan nan','540500000000','山南市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540502','5405',2,'乃东','n','nai dong','540502000000','乃东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540521','5405',2,'扎囊','z','zha nang','540521000000','扎囊县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540522','5405',2,'贡嘎','g','gong ga','540522000000','贡嘎县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540523','5405',2,'桑日','s','sang ri','540523000000','桑日县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540524','5405',2,'琼结','q','qiong jie','540524000000','琼结县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540525','5405',2,'曲松','q','qu song','540525000000','曲松县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540526','5405',2,'措美','c','cuo mei','540526000000','措美县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540527','5405',2,'洛扎','l','luo zha','540527000000','洛扎县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540528','5405',2,'加查','j','jia cha','540528000000','加查县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540529','5405',2,'隆子','l','long zi','540529000000','隆子县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540530','5405',2,'错那','c','cuo na','540530000000','错那市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540531','5405',2,'浪卡子','l','lang ka zi','540531000000','浪卡子县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5406','54',1,'那曲','n','na qu','540600000000','那曲市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540602','5406',2,'色尼','s','se ni','540602000000','色尼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540621','5406',2,'嘉黎','j','jia li','540621000000','嘉黎县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540622','5406',2,'比如','b','bi ru','540622000000','比如县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540623','5406',2,'聂荣','n','nie rong','540623000000','聂荣县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540624','5406',2,'安多','a','an duo','540624000000','安多县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540625','5406',2,'申扎','s','shen zha','540625000000','申扎县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540626','5406',2,'索县','s','suo xian','540626000000','索县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540627','5406',2,'班戈','b','ban ge','540627000000','班戈县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540628','5406',2,'巴青','b','ba qing','540628000000','巴青县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540629','5406',2,'尼玛','n','ni ma','540629000000','尼玛县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('540630','5406',2,'双湖','s','shuang hu','540630000000','双湖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('5425','54',1,'阿里','a','a li','542500000000','阿里地区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('542521','5425',2,'普兰','p','pu lan','542521000000','普兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('542522','5425',2,'札达','z','zha da','542522000000','札达县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('542523','5425',2,'噶尔','g','ga er','542523000000','噶尔县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('542524','5425',2,'日土','r','ri tu','542524000000','日土县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('542525','5425',2,'革吉','g','ge ji','542525000000','革吉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('542526','5425',2,'改则','g','gai ze','542526000000','改则县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('542527','5425',2,'措勤','c','cuo qin','542527000000','措勤县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('61','0',0,'陕西','s','shan xi','610000000000','陕西省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6101','61',1,'西安','x','xi an','610100000000','西安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610102','6101',2,'新城','x','xin cheng','610102000000','新城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610103','6101',2,'碑林','b','bei lin','610103000000','碑林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610104','6101',2,'莲湖','l','lian hu','610104000000','莲湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610111','6101',2,'灞桥','b','ba qiao','610111000000','灞桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610112','6101',2,'未央','w','wei yang','610112000000','未央区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610113','6101',2,'雁塔','y','yan ta','610113000000','雁塔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610114','6101',2,'阎良','y','yan liang','610114000000','阎良区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610115','6101',2,'临潼','l','lin tong','610115000000','临潼区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610116','6101',2,'长安','c','chang an','610116000000','长安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610117','6101',2,'高陵','g','gao ling','610117000000','高陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610118','6101',2,'鄠邑','h','hu yi','610118000000','鄠邑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610122','6101',2,'蓝田','l','lan tian','610122000000','蓝田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610124','6101',2,'周至','z','zhou zhi','610124000000','周至县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6102','61',1,'铜川','t','tong chuan','610200000000','铜川市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610202','6102',2,'王益','w','wang yi','610202000000','王益区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610203','6102',2,'印台','y','yin tai','610203000000','印台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610204','6102',2,'耀州','y','yao zhou','610204000000','耀州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610222','6102',2,'宜君','y','yi jun','610222000000','宜君县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6103','61',1,'宝鸡','b','bao ji','610300000000','宝鸡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610302','6103',2,'渭滨','w','wei bin','610302000000','渭滨区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610303','6103',2,'金台','j','jin tai','610303000000','金台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610304','6103',2,'陈仓','c','chen cang','610304000000','陈仓区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610305','6103',2,'凤翔','f','feng xiang','610305000000','凤翔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610323','6103',2,'岐山','q','qi shan','610323000000','岐山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610324','6103',2,'扶风','f','fu feng','610324000000','扶风县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610326','6103',2,'眉县','m','mei xian','610326000000','眉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610327','6103',2,'陇县','l','long xian','610327000000','陇县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610328','6103',2,'千阳','q','qian yang','610328000000','千阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610329','6103',2,'麟游','l','lin you','610329000000','麟游县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610330','6103',2,'凤县','f','feng xian','610330000000','凤县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610331','6103',2,'太白','t','tai bai','610331000000','太白县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6104','61',1,'咸阳','x','xian yang','610400000000','咸阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610402','6104',2,'秦都','q','qin du','610402000000','秦都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610403','6104',2,'杨陵','y','yang ling','610403000000','杨陵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610404','6104',2,'渭城','w','wei cheng','610404000000','渭城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610422','6104',2,'三原','s','san yuan','610422000000','三原县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610423','6104',2,'泾阳','j','jing yang','610423000000','泾阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610424','6104',2,'乾县','q','qian xian','610424000000','乾县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610425','6104',2,'礼泉','l','li quan','610425000000','礼泉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610426','6104',2,'永寿','y','yong shou','610426000000','永寿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610428','6104',2,'长武','c','chang wu','610428000000','长武县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610429','6104',2,'旬邑','x','xun yi','610429000000','旬邑县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610430','6104',2,'淳化','c','chun hua','610430000000','淳化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610431','6104',2,'武功','w','wu gong','610431000000','武功县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610481','6104',2,'兴平','x','xing ping','610481000000','兴平市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610482','6104',2,'彬州','b','bin zhou','610482000000','彬州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6105','61',1,'渭南','w','wei nan','610500000000','渭南市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610502','6105',2,'临渭','l','lin wei','610502000000','临渭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610503','6105',2,'华州','h','hua zhou','610503000000','华州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610522','6105',2,'潼关','t','tong guan','610522000000','潼关县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610523','6105',2,'大荔','d','da li','610523000000','大荔县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610524','6105',2,'合阳','h','he yang','610524000000','合阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610525','6105',2,'澄城','c','cheng cheng','610525000000','澄城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610526','6105',2,'蒲城','p','pu cheng','610526000000','蒲城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610527','6105',2,'白水','b','bai shui','610527000000','白水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610528','6105',2,'富平','f','fu ping','610528000000','富平县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610581','6105',2,'韩城','h','han cheng','610581000000','韩城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610582','6105',2,'华阴','h','hua yin','610582000000','华阴市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6106','61',1,'延安','y','yan an','610600000000','延安市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610602','6106',2,'宝塔','b','bao ta','610602000000','宝塔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610603','6106',2,'安塞','a','an sai','610603000000','安塞区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610621','6106',2,'延长','y','yan chang','610621000000','延长县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610622','6106',2,'延川','y','yan chuan','610622000000','延川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610625','6106',2,'志丹','z','zhi dan','610625000000','志丹县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610626','6106',2,'吴起','w','wu qi','610626000000','吴起县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610627','6106',2,'甘泉','g','gan quan','610627000000','甘泉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610628','6106',2,'富县','f','fu xian','610628000000','富县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610629','6106',2,'洛川','l','luo chuan','610629000000','洛川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610630','6106',2,'宜川','y','yi chuan','610630000000','宜川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610631','6106',2,'黄龙','h','huang long','610631000000','黄龙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610632','6106',2,'黄陵','h','huang ling','610632000000','黄陵县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610681','6106',2,'子长','z','zi chang','610681000000','子长市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6107','61',1,'汉中','h','han zhong','610700000000','汉中市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610702','6107',2,'汉台','h','han tai','610702000000','汉台区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610703','6107',2,'南郑','n','nan zheng','610703000000','南郑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610722','6107',2,'城固','c','cheng gu','610722000000','城固县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610723','6107',2,'洋县','y','yang xian','610723000000','洋县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610724','6107',2,'西乡','x','xi xiang','610724000000','西乡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610725','6107',2,'勉县','m','mian xian','610725000000','勉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610726','6107',2,'宁强','n','ning qiang','610726000000','宁强县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610727','6107',2,'略阳','l','lue yang','610727000000','略阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610728','6107',2,'镇巴','z','zhen ba','610728000000','镇巴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610729','6107',2,'留坝','l','liu ba','610729000000','留坝县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610730','6107',2,'佛坪','f','fo ping','610730000000','佛坪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6108','61',1,'榆林','y','yu lin','610800000000','榆林市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610802','6108',2,'榆阳','y','yu yang','610802000000','榆阳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610803','6108',2,'横山','h','heng shan','610803000000','横山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610822','6108',2,'府谷','f','fu gu','610822000000','府谷县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610824','6108',2,'靖边','j','jing bian','610824000000','靖边县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610825','6108',2,'定边','d','ding bian','610825000000','定边县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610826','6108',2,'绥德','s','sui de','610826000000','绥德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610827','6108',2,'米脂','m','mi zhi','610827000000','米脂县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610828','6108',2,'佳县','j','jia xian','610828000000','佳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610829','6108',2,'吴堡','w','wu bu','610829000000','吴堡县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610830','6108',2,'清涧','q','qing jian','610830000000','清涧县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610831','6108',2,'子洲','z','zi zhou','610831000000','子洲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610881','6108',2,'神木','s','shen mu','610881000000','神木市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6109','61',1,'安康','a','an kang','610900000000','安康市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610902','6109',2,'汉滨','h','han bin','610902000000','汉滨区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610921','6109',2,'汉阴','h','han yin','610921000000','汉阴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610922','6109',2,'石泉','s','shi quan','610922000000','石泉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610923','6109',2,'宁陕','n','ning shan','610923000000','宁陕县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610924','6109',2,'紫阳','z','zi yang','610924000000','紫阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610925','6109',2,'岚皋','l','lan gao','610925000000','岚皋县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610926','6109',2,'平利','p','ping li','610926000000','平利县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610927','6109',2,'镇坪','z','zhen ping','610927000000','镇坪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610929','6109',2,'白河','b','bai he','610929000000','白河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('610981','6109',2,'旬阳','x','xun yang','610981000000','旬阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6110','61',1,'商洛','s','shang luo','611000000000','商洛市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('611002','6110',2,'商州','s','shang zhou','611002000000','商州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('611021','6110',2,'洛南','l','luo nan','611021000000','洛南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('611022','6110',2,'丹凤','d','dan feng','611022000000','丹凤县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('611023','6110',2,'商南','s','shang nan','611023000000','商南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('611024','6110',2,'山阳','s','shan yang','611024000000','山阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('611025','6110',2,'镇安','z','zhen an','611025000000','镇安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('611026','6110',2,'柞水','z','zha shui','611026000000','柞水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('62','0',0,'甘肃','g','gan su','620000000000','甘肃省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6201','62',1,'兰州','l','lan zhou','620100000000','兰州市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620102','6201',2,'城关','c','cheng guan','620102000000','城关区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620103','6201',2,'七里河','q','qi li he','620103000000','七里河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620104','6201',2,'西固','x','xi gu','620104000000','西固区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620105','6201',2,'安宁','a','an ning','620105000000','安宁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620111','6201',2,'红古','h','hong gu','620111000000','红古区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620121','6201',2,'永登','y','yong deng','620121000000','永登县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620122','6201',2,'皋兰','g','gao lan','620122000000','皋兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620123','6201',2,'榆中','y','yu zhong','620123000000','榆中县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6202','62',1,'嘉峪关','j','jia yu guan','620200000000','嘉峪关市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620200','6202',2,'嘉峪关','j','jia yu guan','620200000000','嘉峪关市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6203','62',1,'金昌','j','jin chang','620300000000','金昌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620302','6203',2,'金川','j','jin chuan','620302000000','金川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620321','6203',2,'永昌','y','yong chang','620321000000','永昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6204','62',1,'白银','b','bai yin','620400000000','白银市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620402','6204',2,'白银区','b','bai yin qu','620402000000','白银区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620403','6204',2,'平川','p','ping chuan','620403000000','平川区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620421','6204',2,'靖远','j','jing yuan','620421000000','靖远县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620422','6204',2,'会宁','h','hui ning','620422000000','会宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620423','6204',2,'景泰','j','jing tai','620423000000','景泰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6205','62',1,'天水','t','tian shui','620500000000','天水市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620502','6205',2,'秦州','q','qin zhou','620502000000','秦州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620503','6205',2,'麦积','m','mai ji','620503000000','麦积区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620521','6205',2,'清水','q','qing shui','620521000000','清水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620522','6205',2,'秦安','q','qin an','620522000000','秦安县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620523','6205',2,'甘谷','g','gan gu','620523000000','甘谷县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620524','6205',2,'武山','w','wu shan','620524000000','武山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620525','6205',2,'张家川','z','zhang jia chuan','620525000000','张家川回族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6206','62',1,'武威','w','wu wei','620600000000','武威市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620602','6206',2,'凉州','l','liang zhou','620602000000','凉州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620621','6206',2,'民勤','m','min qin','620621000000','民勤县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620622','6206',2,'古浪','g','gu lang','620622000000','古浪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620623','6206',2,'天祝','t','tian zhu','620623000000','天祝藏族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6207','62',1,'张掖','z','zhang ye','620700000000','张掖市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620702','6207',2,'甘州','g','gan zhou','620702000000','甘州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620721','6207',2,'肃南','s','su nan','620721000000','肃南裕固族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620722','6207',2,'民乐','m','min le','620722000000','民乐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620723','6207',2,'临泽','l','lin ze','620723000000','临泽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620724','6207',2,'高台','g','gao tai','620724000000','高台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620725','6207',2,'山丹','s','shan dan','620725000000','山丹县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6208','62',1,'平凉','p','ping liang','620800000000','平凉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620802','6208',2,'崆峒','k','kong tong','620802000000','崆峒区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620821','6208',2,'泾川','j','jing chuan','620821000000','泾川县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620822','6208',2,'灵台','l','ling tai','620822000000','灵台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620823','6208',2,'崇信','c','chong xin','620823000000','崇信县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620825','6208',2,'庄浪','z','zhuang lang','620825000000','庄浪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620826','6208',2,'静宁','j','jing ning','620826000000','静宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620881','6208',2,'华亭','h','hua ting','620881000000','华亭市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6209','62',1,'酒泉','j','jiu quan','620900000000','酒泉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620902','6209',2,'肃州','s','su zhou','620902000000','肃州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620921','6209',2,'金塔','j','jin ta','620921000000','金塔县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620922','6209',2,'瓜州','g','gua zhou','620922000000','瓜州县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620923','6209',2,'肃北','s','su bei','620923000000','肃北蒙古族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620924','6209',2,'阿克塞','a','a ke sai','620924000000','阿克塞哈萨克族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620981','6209',2,'玉门','y','yu men','620981000000','玉门市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('620982','6209',2,'敦煌','d','dun huang','620982000000','敦煌市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6210','62',1,'庆阳','q','qing yang','621000000000','庆阳市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621002','6210',2,'西峰','x','xi feng','621002000000','西峰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621021','6210',2,'庆城','q','qing cheng','621021000000','庆城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621022','6210',2,'环县','h','huan xian','621022000000','环县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621023','6210',2,'华池','h','hua chi','621023000000','华池县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621024','6210',2,'合水','h','he shui','621024000000','合水县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621025','6210',2,'正宁','z','zheng ning','621025000000','正宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621026','6210',2,'宁县','n','ning xian','621026000000','宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621027','6210',2,'镇原','z','zhen yuan','621027000000','镇原县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6211','62',1,'定西','d','ding xi','621100000000','定西市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621102','6211',2,'安定','a','an ding','621102000000','安定区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621121','6211',2,'通渭','t','tong wei','621121000000','通渭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621122','6211',2,'陇西','l','long xi','621122000000','陇西县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621123','6211',2,'渭源','w','wei yuan','621123000000','渭源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621124','6211',2,'临洮','l','lin tao','621124000000','临洮县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621125','6211',2,'漳县','z','zhang xian','621125000000','漳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621126','6211',2,'岷县','m','min xian','621126000000','岷县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6212','62',1,'陇南','l','long nan','621200000000','陇南市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621202','6212',2,'武都','w','wu du','621202000000','武都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621221','6212',2,'成县','c','cheng xian','621221000000','成县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621222','6212',2,'文县','w','wen xian','621222000000','文县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621223','6212',2,'宕昌','t','tan chang','621223000000','宕昌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621224','6212',2,'康县','k','kang xian','621224000000','康县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621225','6212',2,'西和','x','xi he','621225000000','西和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621226','6212',2,'礼县','l','li xian','621226000000','礼县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621227','6212',2,'徽县','h','hui xian','621227000000','徽县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('621228','6212',2,'两当','l','liang dang','621228000000','两当县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6229','62',1,'临夏','l','lin xia','622900000000','临夏回族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('622901','6229',2,'临夏市','l','lin xia shi','622901000000','临夏市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('622921','6229',2,'临夏县','l','lin xia xian','622921000000','临夏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('622922','6229',2,'康乐','k','kang le','622922000000','康乐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('622923','6229',2,'永靖','y','yong jing','622923000000','永靖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('622924','6229',2,'广河','g','guang he','622924000000','广河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('622925','6229',2,'和政','h','he zheng','622925000000','和政县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('622926','6229',2,'东乡族自治县','d','dong xiang zu zi zhi xian','622926000000','东乡族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('622927','6229',2,'积石山','j','ji shi shan','622927000000','积石山保安族东乡族撒拉族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6230','62',1,'甘南','g','gan nan','623000000000','甘南藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('623001','6230',2,'合作','h','he zuo','623001000000','合作市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('623021','6230',2,'临潭','l','lin tan','623021000000','临潭县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('623022','6230',2,'卓尼','z','zhuo ni','623022000000','卓尼县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('623023','6230',2,'舟曲','z','zhou qu','623023000000','舟曲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('623024','6230',2,'迭部','d','die bu','623024000000','迭部县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('623025','6230',2,'玛曲','m','ma qu','623025000000','玛曲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('623026','6230',2,'碌曲','l','lu qu','623026000000','碌曲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('623027','6230',2,'夏河','x','xia he','623027000000','夏河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('63','0',0,'青海','q','qing hai','630000000000','青海省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6301','63',1,'西宁','x','xi ning','630100000000','西宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630102','6301',2,'城东','c','cheng dong','630102000000','城东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630103','6301',2,'城中','c','cheng zhong','630103000000','城中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630104','6301',2,'城西','c','cheng xi','630104000000','城西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630105','6301',2,'城北','c','cheng bei','630105000000','城北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630106','6301',2,'湟中','h','huang zhong','630106000000','湟中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630121','6301',2,'大通','d','da tong','630121000000','大通回族土族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630123','6301',2,'湟源','h','huang yuan','630123000000','湟源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6302','63',1,'海东','h','hai dong','630200000000','海东市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630202','6302',2,'乐都','l','le du','630202000000','乐都区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630203','6302',2,'平安','p','ping an','630203000000','平安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630222','6302',2,'民和','m','min he','630222000000','民和回族土族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630223','6302',2,'互助','h','hu zhu','630223000000','互助土族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630224','6302',2,'化隆','h','hua long','630224000000','化隆回族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('630225','6302',2,'循化','x','xun hua','630225000000','循化撒拉族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6322','63',1,'海北','h','hai bei','632200000000','海北藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632221','6322',2,'门源','m','men yuan','632221000000','门源回族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632222','6322',2,'祁连','q','qi lian','632222000000','祁连县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632223','6322',2,'海晏','h','hai yan','632223000000','海晏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632224','6322',2,'刚察','g','gang cha','632224000000','刚察县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6323','63',1,'黄南','h','huang nan','632300000000','黄南藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632301','6323',2,'同仁','t','tong ren','632301000000','同仁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632322','6323',2,'尖扎','j','jian zha','632322000000','尖扎县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632323','6323',2,'泽库','z','ze ku','632323000000','泽库县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632324','6323',2,'河南','h','he nan','632324000000','河南蒙古族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6325','63',1,'海南','h','hai nan','632500000000','海南藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632521','6325',2,'共和','g','gong he','632521000000','共和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632522','6325',2,'同德','t','tong de','632522000000','同德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632523','6325',2,'贵德','g','gui de','632523000000','贵德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632524','6325',2,'兴海','x','xing hai','632524000000','兴海县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632525','6325',2,'贵南','g','gui nan','632525000000','贵南县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6326','63',1,'果洛','g','guo luo','632600000000','果洛藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632621','6326',2,'玛沁','m','ma qin','632621000000','玛沁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632622','6326',2,'班玛','b','ban ma','632622000000','班玛县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632623','6326',2,'甘德','g','gan de','632623000000','甘德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632624','6326',2,'达日','d','da ri','632624000000','达日县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632625','6326',2,'久治','j','jiu zhi','632625000000','久治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632626','6326',2,'玛多','m','ma duo','632626000000','玛多县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6327','63',1,'玉树','y','yu shu','632700000000','玉树藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632701','6327',2,'玉树市','y','yu shu shi','632701000000','玉树市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632722','6327',2,'杂多','z','za duo','632722000000','杂多县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632723','6327',2,'称多','c','cheng duo','632723000000','称多县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632724','6327',2,'治多','z','zhi duo','632724000000','治多县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632725','6327',2,'囊谦','n','nang qian','632725000000','囊谦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632726','6327',2,'曲麻莱','q','qu ma lai','632726000000','曲麻莱县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6328','63',1,'海西','h','hai xi','632800000000','海西蒙古族藏族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632801','6328',2,'格尔木','g','ge er mu','632801000000','格尔木市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632802','6328',2,'德令哈','d','de ling ha','632802000000','德令哈市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632803','6328',2,'茫崖','m','mang ya','632803000000','茫崖市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632821','6328',2,'乌兰','w','wu lan','632821000000','乌兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632822','6328',2,'都兰','d','du lan','632822000000','都兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632823','6328',2,'天峻','t','tian jun','632823000000','天峻县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('632825','6328',2,'大柴旦行政委员会','d','da chai dan xing zheng wei yuan hui','632825000000','大柴旦行政委员会');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('64','0',0,'宁夏','n','ning xia','640000000000','宁夏回族自治区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6401','64',1,'银川','y','yin chuan','640100000000','银川市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640104','6401',2,'兴庆','x','xing qing','640104000000','兴庆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640105','6401',2,'西夏','x','xi xia','640105000000','西夏区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640106','6401',2,'金凤','j','jin feng','640106000000','金凤区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640121','6401',2,'永宁','y','yong ning','640121000000','永宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640122','6401',2,'贺兰','h','he lan','640122000000','贺兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640181','6401',2,'灵武','l','ling wu','640181000000','灵武市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6402','64',1,'石嘴山','s','shi zui shan','640200000000','石嘴山市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640202','6402',2,'大武口','d','da wu kou','640202000000','大武口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640205','6402',2,'惠农','h','hui nong','640205000000','惠农区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640221','6402',2,'平罗','p','ping luo','640221000000','平罗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6403','64',1,'吴忠','w','wu zhong','640300000000','吴忠市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640302','6403',2,'利通','l','li tong','640302000000','利通区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640303','6403',2,'红寺堡','h','hong si bu','640303000000','红寺堡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640323','6403',2,'盐池','y','yan chi','640323000000','盐池县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640324','6403',2,'同心','t','tong xin','640324000000','同心县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640381','6403',2,'青铜峡','q','qing tong xia','640381000000','青铜峡市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6404','64',1,'固原','g','gu yuan','640400000000','固原市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640402','6404',2,'原州','y','yuan zhou','640402000000','原州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640422','6404',2,'西吉','x','xi ji','640422000000','西吉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640423','6404',2,'隆德','l','long de','640423000000','隆德县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640424','6404',2,'泾源','j','jing yuan','640424000000','泾源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640425','6404',2,'彭阳','p','peng yang','640425000000','彭阳县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6405','64',1,'中卫','z','zhong wei','640500000000','中卫市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640502','6405',2,'沙坡头','s','sha po tou','640502000000','沙坡头区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640521','6405',2,'中宁','z','zhong ning','640521000000','中宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('640522','6405',2,'海原','h','hai yuan','640522000000','海原县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('65','0',0,'新疆','x','xin jiang','650000000000','新疆维吾尔自治区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6501','65',1,'乌鲁木齐','w','wu lu mu qi','650100000000','乌鲁木齐市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650102','6501',2,'天山','t','tian shan','650102000000','天山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650103','6501',2,'沙依巴克区','s','sha yi ba ke qu','650103000000','沙依巴克区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650104','6501',2,'新市','x','xin shi','650104000000','新市区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650105','6501',2,'水磨沟','s','shui mo gou','650105000000','水磨沟区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650106','6501',2,'头屯河','t','tou tun he','650106000000','头屯河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650107','6501',2,'达坂城','d','da ban cheng','650107000000','达坂城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650109','6501',2,'米东','m','mi dong','650109000000','米东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650121','6501',2,'乌鲁木齐县','w','wu lu mu qi xian','650121000000','乌鲁木齐县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6502','65',1,'克拉玛依','k','ke la ma yi','650200000000','克拉玛依市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650202','6502',2,'独山子','d','du shan zi','650202000000','独山子区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650203','6502',2,'克拉玛依区','k','ke la ma yi qu','650203000000','克拉玛依区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650204','6502',2,'白碱滩','b','bai jian tan','650204000000','白碱滩区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650205','6502',2,'乌尔禾','w','wu er he','650205000000','乌尔禾区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6504','65',1,'吐鲁番','t','tu lu fan','650400000000','吐鲁番市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650402','6504',2,'高昌','g','gao chang','650402000000','高昌区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650421','6504',2,'鄯善','s','shan shan','650421000000','鄯善县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650422','6504',2,'托克逊','t','tuo ke xun','650422000000','托克逊县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6505','65',1,'哈密','h','ha mi','650500000000','哈密市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650502','6505',2,'伊州','y','yi zhou','650502000000','伊州区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650521','6505',2,'巴里坤','b','ba li kun','650521000000','巴里坤哈萨克自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('650522','6505',2,'伊吾','y','yi wu','650522000000','伊吾县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6523','65',1,'昌吉','c','chang ji','652300000000','昌吉回族自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652301','6523',2,'昌吉市','c','chang ji shi','652301000000','昌吉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652302','6523',2,'阜康','f','fu kang','652302000000','阜康市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652323','6523',2,'呼图壁','h','hu tu bi','652323000000','呼图壁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652324','6523',2,'玛纳斯','m','ma na si','652324000000','玛纳斯县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652325','6523',2,'奇台','q','qi tai','652325000000','奇台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652327','6523',2,'吉木萨尔','j','ji mu sa er','652327000000','吉木萨尔县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652328','6523',2,'木垒','m','mu lei','652328000000','木垒哈萨克自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6527','65',1,'博尔塔拉','b','bo er ta la','652700000000','博尔塔拉蒙古自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652701','6527',2,'博乐','b','bo le','652701000000','博乐市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652702','6527',2,'阿拉山口','a','a la shan kou','652702000000','阿拉山口市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652722','6527',2,'精河','j','jing he','652722000000','精河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652723','6527',2,'温泉','w','wen quan','652723000000','温泉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6528','65',1,'巴音郭楞','b','ba yin guo leng','652800000000','巴音郭楞蒙古自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652801','6528',2,'库尔勒','k','ku er le','652801000000','库尔勒市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652822','6528',2,'轮台','l','lun tai','652822000000','轮台县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652823','6528',2,'尉犁','y','yu li','652823000000','尉犁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652824','6528',2,'若羌','r','ruo qiang','652824000000','若羌县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652825','6528',2,'且末','q','qie mo','652825000000','且末县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652826','6528',2,'焉耆','y','yan qi','652826000000','焉耆回族自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652827','6528',2,'和静','h','he jing','652827000000','和静县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652828','6528',2,'和硕','h','he shuo','652828000000','和硕县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652829','6528',2,'博湖','b','bo hu','652829000000','博湖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6529','65',1,'阿克苏','a','a ke su','652900000000','阿克苏地区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652901','6529',2,'阿克苏市','a','a ke su shi','652901000000','阿克苏市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652902','6529',2,'库车','k','ku che','652902000000','库车市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652922','6529',2,'温宿','w','wen su','652922000000','温宿县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652924','6529',2,'沙雅','s','sha ya','652924000000','沙雅县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652925','6529',2,'新和','x','xin he','652925000000','新和县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652926','6529',2,'拜城','b','bai cheng','652926000000','拜城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652927','6529',2,'乌什','w','wu shi','652927000000','乌什县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652928','6529',2,'阿瓦提','a','a wa ti','652928000000','阿瓦提县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('652929','6529',2,'柯坪','k','ke ping','652929000000','柯坪县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6530','65',1,'克孜勒苏','k','ke zi le su','653000000000','克孜勒苏柯尔克孜自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653001','6530',2,'阿图什','a','a tu shi','653001000000','阿图什市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653022','6530',2,'阿克陶','a','a ke tao','653022000000','阿克陶县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653023','6530',2,'阿合奇','a','a he qi','653023000000','阿合奇县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653024','6530',2,'乌恰','w','wu qia','653024000000','乌恰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6531','65',1,'喀什','k','ka shi','653100000000','喀什地区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653101','6531',2,'喀什市','k','ka shi shi','653101000000','喀什市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653121','6531',2,'疏附','s','shu fu','653121000000','疏附县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653122','6531',2,'疏勒','s','shu le','653122000000','疏勒县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653123','6531',2,'英吉沙','y','ying ji sha','653123000000','英吉沙县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653124','6531',2,'泽普','z','ze pu','653124000000','泽普县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653125','6531',2,'莎车','s','sha che','653125000000','莎车县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653126','6531',2,'叶城','y','ye cheng','653126000000','叶城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653127','6531',2,'麦盖提','m','mai gai ti','653127000000','麦盖提县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653128','6531',2,'岳普湖','y','yue pu hu','653128000000','岳普湖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653129','6531',2,'伽师','j','jia shi','653129000000','伽师县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653130','6531',2,'巴楚','b','ba chu','653130000000','巴楚县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653131','6531',2,'塔什库尔干','t','ta shi ku er gan','653131000000','塔什库尔干塔吉克自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6532','65',1,'和田','h','he tian','653200000000','和田地区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653201','6532',2,'和田市','h','he tian shi','653201000000','和田市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653221','6532',2,'和田县','h','he tian xian','653221000000','和田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653222','6532',2,'墨玉','m','mo yu','653222000000','墨玉县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653223','6532',2,'皮山','p','pi shan','653223000000','皮山县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653224','6532',2,'洛浦','l','luo pu','653224000000','洛浦县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653225','6532',2,'策勒','c','ce le','653225000000','策勒县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653226','6532',2,'于田','y','yu tian','653226000000','于田县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('653227','6532',2,'民丰','m','min feng','653227000000','民丰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6540','65',1,'伊犁','y','yi li','654000000000','伊犁哈萨克自治州');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654002','6540',2,'伊宁市','y','yi ning shi','654002000000','伊宁市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654003','6540',2,'奎屯','k','kui tun','654003000000','奎屯市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654004','6540',2,'霍尔果斯','h','huo er guo si','654004000000','霍尔果斯市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654021','6540',2,'伊宁县','y','yi ning xian','654021000000','伊宁县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654022','6540',2,'察布查尔','c','cha bu cha er','654022000000','察布查尔锡伯自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654023','6540',2,'霍城','h','huo cheng','654023000000','霍城县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654024','6540',2,'巩留','g','gong liu','654024000000','巩留县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654025','6540',2,'新源','x','xin yuan','654025000000','新源县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654026','6540',2,'昭苏','z','zhao su','654026000000','昭苏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654027','6540',2,'特克斯','t','te ke si','654027000000','特克斯县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654028','6540',2,'尼勒克','n','ni le ke','654028000000','尼勒克县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6542','65',1,'塔城','t','ta cheng','654200000000','塔城地区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654201','6542',2,'塔城市','t','ta cheng shi','654201000000','塔城市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654202','6542',2,'乌苏','w','wu su','654202000000','乌苏市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654203','6542',2,'沙湾','s','sha wan','654203000000','沙湾市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654221','6542',2,'额敏','e','e min','654221000000','额敏县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654224','6542',2,'托里','t','tuo li','654224000000','托里县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654225','6542',2,'裕民','y','yu min','654225000000','裕民县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654226','6542',2,'和布克赛尔','h','he bu ke sai er','654226000000','和布克赛尔蒙古自治县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('6543','65',1,'阿勒泰','a','a le tai','654300000000','阿勒泰地区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654301','6543',2,'阿勒泰市','a','a le tai shi','654301000000','阿勒泰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654321','6543',2,'布尔津','b','bu er jin','654321000000','布尔津县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654322','6543',2,'富蕴','f','fu yun','654322000000','富蕴县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654323','6543',2,'福海','f','fu hai','654323000000','福海县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654324','6543',2,'哈巴河','h','ha ba he','654324000000','哈巴河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654325','6543',2,'青河','q','qing he','654325000000','青河县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('654326','6543',2,'吉木乃','j','ji mu nai','654326000000','吉木乃县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659001','65',1,'石河子','s','shi he zi','659001000000','石河子市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659001000','659001',2,'石河子','s','shi he zi','659001000000','石河子市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659002','65',1,'阿拉尔','a','a la er','659002000000','阿拉尔市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659002000','659002',2,'阿拉尔','a','a la er','659002000000','阿拉尔市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659003','65',1,'图木舒克','t','tu mu shu ke','659003000000','图木舒克市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659003000','659003',2,'图木舒克','t','tu mu shu ke','659003000000','图木舒克市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659004','65',1,'五家渠','w','wu jia qu','659004000000','五家渠市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659004000','659004',2,'五家渠','w','wu jia qu','659004000000','五家渠市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659005','65',1,'北屯','b','bei tun','659005000000','北屯市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659005000','659005',2,'北屯','b','bei tun','659005000000','北屯市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659006','65',1,'铁门关','t','tie men guan','659006000000','铁门关市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659006000','659006',2,'铁门关','t','tie men guan','659006000000','铁门关市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659007','65',1,'双河','s','shuang he','659007000000','双河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659007000','659007',2,'双河','s','shuang he','659007000000','双河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659008','65',1,'可克达拉','k','ke ke da la','659008000000','可克达拉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659008000','659008',2,'可克达拉','k','ke ke da la','659008000000','可克达拉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659009','65',1,'昆玉','k','kun yu','659009000000','昆玉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659009000','659009',2,'昆玉','k','kun yu','659009000000','昆玉市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659010','65',1,'胡杨河','h','hu yang he','659010000000','胡杨河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659010000','659010',2,'胡杨河','h','hu yang he','659010000000','胡杨河市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659011','65',1,'新星','x','xin xing','659011000000','新星市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('659011000','659011',2,'新星','x','xin xing','659011000000','新星市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('71','0',0,'台湾','~3','tai wan','710000000000','台湾省');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7101','71',1,'台北','t','tai bei','710100000000','台北市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710101','7101',2,'中正','z','zhong zheng','710101000000','中正区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710102','7101',2,'大同','d','da tong','710102000000','大同区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710103','7101',2,'中山','z','zhong shan','710103000000','中山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710104','7101',2,'松山','s','song shan','710104000000','松山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710105','7101',2,'大安','d','da an','710105000000','大安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710106','7101',2,'万华','w','wan hua','710106000000','万华区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710107','7101',2,'信义','x','xin yi','710107000000','信义区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710108','7101',2,'士林','s','shi lin','710108000000','士林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710109','7101',2,'北投','b','bei tou','710109000000','北投区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710110','7101',2,'内湖','n','nei hu','710110000000','内湖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710111','7101',2,'南港','n','nan gang','710111000000','南港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710112','7101',2,'文山','w','wen shan','710112000000','文山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7102','71',1,'高雄','g','gao xiong','710200000000','高雄市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710201','7102',2,'新兴','x','xin xing','710201000000','新兴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710202','7102',2,'前金','q','qian jin','710202000000','前金区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710203','7102',2,'苓雅','l','ling ya','710203000000','苓雅区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710204','7102',2,'盐埕','y','yan cheng','710204000000','盐埕区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710205','7102',2,'鼓山','g','gu shan','710205000000','鼓山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710206','7102',2,'旗津','q','qi jin','710206000000','旗津区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710207','7102',2,'前镇','q','qian zhen','710207000000','前镇区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710208','7102',2,'三民','s','san min','710208000000','三民区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710209','7102',2,'左营','z','zuo ying','710209000000','左营区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710210','7102',2,'楠梓','n','nan zi','710210000000','楠梓区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710211','7102',2,'小港','x','xiao gang','710211000000','小港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710242','7102',2,'仁武','r','ren wu','710242000000','仁武区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710243','7102',2,'大社','d','da she','710243000000','大社区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710244','7102',2,'冈山','g','gang shan','710244000000','冈山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710245','7102',2,'路竹','l','lu zhu','710245000000','路竹区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710246','7102',2,'阿莲','a','a lian','710246000000','阿莲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710247','7102',2,'田寮','t','tian liao','710247000000','田寮区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710248','7102',2,'燕巢','y','yan chao','710248000000','燕巢区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710249','7102',2,'桥头','q','qiao tou','710249000000','桥头区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710250','7102',2,'梓官','z','zi guan','710250000000','梓官区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710251','7102',2,'弥陀','m','mi tuo','710251000000','弥陀区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710252','7102',2,'永安','y','yong an','710252000000','永安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710253','7102',2,'湖内','h','hu nei','710253000000','湖内区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710254','7102',2,'凤山','f','feng shan','710254000000','凤山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710255','7102',2,'大寮','d','da liao','710255000000','大寮区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710256','7102',2,'林园','l','lin yuan','710256000000','林园区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710257','7102',2,'鸟松','n','niao song','710257000000','鸟松区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710258','7102',2,'大树','d','da shu','710258000000','大树区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710259','7102',2,'旗山','q','qi shan','710259000000','旗山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710260','7102',2,'美浓','m','mei nong','710260000000','美浓区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710261','7102',2,'六龟','l','liu gui','710261000000','六龟区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710262','7102',2,'内门','n','nei men','710262000000','内门区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710263','7102',2,'杉林','s','shan lin','710263000000','杉林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710264','7102',2,'甲仙','j','jia xian','710264000000','甲仙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710265','7102',2,'桃源','t','tao yuan','710265000000','桃源区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710266','7102',2,'那玛夏','n','na ma xia','710266000000','那玛夏区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710267','7102',2,'茂林','m','mao lin','710267000000','茂林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710268','7102',2,'茄萣','q','qie ding','710268000000','茄萣区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7103','71',1,'台南','t','tai nan','710300000000','台南市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710301','7103',2,'中西','z','zhong xi','710301000000','中西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710302','7103',2,'东区','d','dong qu','710302000000','东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710303','7103',2,'南区','n','nan qu','710303000000','南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710304','7103',2,'北区','b','bei qu','710304000000','北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710305','7103',2,'安平','a','an ping','710305000000','安平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710306','7103',2,'安南','a','an nan','710306000000','安南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710339','7103',2,'永康','y','yong kang','710339000000','永康区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710340','7103',2,'归仁','g','gui ren','710340000000','归仁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710341','7103',2,'新化','x','xin hua','710341000000','新化区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710342','7103',2,'左镇','z','zuo zhen','710342000000','左镇区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710343','7103',2,'玉井','y','yu jing','710343000000','玉井区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710344','7103',2,'楠西','n','nan xi','710344000000','楠西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710345','7103',2,'南化','n','nan hua','710345000000','南化区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710346','7103',2,'仁德','r','ren de','710346000000','仁德区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710347','7103',2,'关庙','g','guan miao','710347000000','关庙区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710348','7103',2,'龙崎','l','long qi','710348000000','龙崎区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710349','7103',2,'官田','g','guan tian','710349000000','官田区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710350','7103',2,'麻豆','m','ma dou','710350000000','麻豆区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710351','7103',2,'佳里','j','jia li','710351000000','佳里区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710352','7103',2,'西港','x','xi gang','710352000000','西港区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710353','7103',2,'七股','q','qi gu','710353000000','七股区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710354','7103',2,'将军','j','jiang jun','710354000000','将军区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710355','7103',2,'学甲','x','xue jia','710355000000','学甲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710356','7103',2,'北门','b','bei men','710356000000','北门区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710357','7103',2,'新营','x','xin ying','710357000000','新营区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710358','7103',2,'后壁','h','hou bi','710358000000','后壁区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710359','7103',2,'白河','b','bai he','710359000000','白河区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710360','7103',2,'东山','d','dong shan','710360000000','东山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710361','7103',2,'六甲','l','liu jia','710361000000','六甲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710362','7103',2,'下营','x','xia ying','710362000000','下营区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710363','7103',2,'柳营','l','liu ying','710363000000','柳营区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710364','7103',2,'盐水','y','yan shui','710364000000','盐水区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710365','7103',2,'善化','s','shan hua','710365000000','善化区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710366','7103',2,'大内','d','da nei','710366000000','大内区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710367','7103',2,'山上','s','shan shang','710367000000','山上区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710368','7103',2,'新市','x','xin shi','710368000000','新市区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710369','7103',2,'安定','a','an ding','710369000000','安定区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7104','71',1,'台中','t','tai zhong','710400000000','台中市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710401','7104',2,'中区','z','zhong qu','710401000000','中区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710402','7104',2,'东区','d','dong qu','710402000000','东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710403','7104',2,'南区','n','nan qu','710403000000','南区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710404','7104',2,'西区','x','xi qu','710404000000','西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710405','7104',2,'北区','b','bei qu','710405000000','北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710406','7104',2,'北屯','b','bei tun','710406000000','北屯区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710407','7104',2,'西屯','x','xi tun','710407000000','西屯区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710408','7104',2,'南屯','n','nan tun','710408000000','南屯区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710431','7104',2,'太平','t','tai ping','710431000000','太平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710432','7104',2,'大里','d','da li','710432000000','大里区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710433','7104',2,'雾峰','w','wu feng','710433000000','雾峰区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710434','7104',2,'乌日','w','wu ri','710434000000','乌日区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710435','7104',2,'丰原','f','feng yuan','710435000000','丰原区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710436','7104',2,'后里','h','hou li','710436000000','后里区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710437','7104',2,'石冈','s','shi gang','710437000000','石冈区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710438','7104',2,'东势','d','dong shi','710438000000','东势区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710439','7104',2,'和平','h','he ping','710439000000','和平区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710440','7104',2,'新社','x','xin she','710440000000','新社区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710441','7104',2,'潭子','t','tan zi','710441000000','潭子区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710442','7104',2,'大雅','d','da ya','710442000000','大雅区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710443','7104',2,'神冈','s','shen gang','710443000000','神冈区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710444','7104',2,'大肚','d','da du','710444000000','大肚区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710445','7104',2,'沙鹿','s','sha lu','710445000000','沙鹿区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710446','7104',2,'龙井','l','long jing','710446000000','龙井区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710447','7104',2,'梧栖','w','wu qi','710447000000','梧栖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710448','7104',2,'清水','q','qing shui','710448000000','清水区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710449','7104',2,'大甲','d','da jia','710449000000','大甲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710450','7104',2,'外埔','w','wai bu','710450000000','外埔区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710451','7104',2,'大安','d','da an','710451000000','大安区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7106','71',1,'南投','n','nan tou','710600000000','南投县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710614','7106',2,'南投市','n','nan tou shi','710614000000','南投市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710615','7106',2,'中寮','z','zhong liao','710615000000','中寮乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710616','7106',2,'草屯','c','cao tun','710616000000','草屯镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710617','7106',2,'国姓','g','guo xing','710617000000','国姓乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710618','7106',2,'埔里','b','bu li','710618000000','埔里镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710619','7106',2,'仁爱','r','ren ai','710619000000','仁爱乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710620','7106',2,'名间','m','ming jian','710620000000','名间乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710621','7106',2,'集集','j','ji ji','710621000000','集集镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710622','7106',2,'水里','s','shui li','710622000000','水里乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710623','7106',2,'鱼池','y','yu chi','710623000000','鱼池乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710624','7106',2,'信义','x','xin yi','710624000000','信义乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710625','7106',2,'竹山','z','zhu shan','710625000000','竹山镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710626','7106',2,'鹿谷','l','lu gu','710626000000','鹿谷乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7107','71',1,'基隆','j','ji long','710700000000','基隆市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710701','7107',2,'仁爱','r','ren ai','710701000000','仁爱区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710702','7107',2,'信义','x','xin yi','710702000000','信义区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710703','7107',2,'中正','z','zhong zheng','710703000000','中正区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710704','7107',2,'中山','z','zhong shan','710704000000','中山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710705','7107',2,'安乐','a','an le','710705000000','安乐区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710706','7107',2,'暖暖','n','nuan nuan','710706000000','暖暖区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710707','7107',2,'七堵','q','qi du','710707000000','七堵区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7108','71',1,'新竹市','x','xin zhu shi','710800000000','新竹市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710801','7108',2,'东区','d','dong qu','710801000000','东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710802','7108',2,'北区','b','bei qu','710802000000','北区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710803','7108',2,'香山','x','xiang shan','710803000000','香山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7109','71',1,'嘉义市','j','jia yi shi','710900000000','嘉义市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710901','7109',2,'东区','d','dong qu','710901000000','东区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('710902','7109',2,'西区','x','xi qu','710902000000','西区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7111','71',1,'新北','x','xin bei','711100000000','新北市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711130','7111',2,'万里','w','wan li','711130000000','万里区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711131','7111',2,'金山','j','jin shan','711131000000','金山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711132','7111',2,'板桥','b','ban qiao','711132000000','板桥区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711133','7111',2,'汐止','x','xi zhi','711133000000','汐止区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711134','7111',2,'深坑','s','shen keng','711134000000','深坑区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711135','7111',2,'石碇','s','shi ding','711135000000','石碇区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711136','7111',2,'瑞芳','r','rui fang','711136000000','瑞芳区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711137','7111',2,'平溪','p','ping xi','711137000000','平溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711138','7111',2,'双溪','s','shuang xi','711138000000','双溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711139','7111',2,'贡寮','g','gong liao','711139000000','贡寮区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711140','7111',2,'新店','x','xin dian','711140000000','新店区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711141','7111',2,'坪林','p','ping lin','711141000000','坪林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711142','7111',2,'乌来','w','wu lai','711142000000','乌来区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711143','7111',2,'永和','y','yong he','711143000000','永和区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711144','7111',2,'中和','z','zhong he','711144000000','中和区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711145','7111',2,'土城','t','tu cheng','711145000000','土城区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711146','7111',2,'三峡','s','san xia','711146000000','三峡区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711147','7111',2,'树林','s','shu lin','711147000000','树林区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711148','7111',2,'莺歌','y','ying ge','711148000000','莺歌区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711149','7111',2,'三重','s','san chong','711149000000','三重区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711150','7111',2,'新庄','x','xin zhuang','711150000000','新庄区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711151','7111',2,'泰山','t','tai shan','711151000000','泰山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711152','7111',2,'林口','l','lin kou','711152000000','林口区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711153','7111',2,'芦洲','l','lu zhou','711153000000','芦洲区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711154','7111',2,'五股','w','wu gu','711154000000','五股区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711155','7111',2,'八里','b','ba li','711155000000','八里区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711156','7111',2,'淡水','d','dan shui','711156000000','淡水区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711157','7111',2,'三芝','s','san zhi','711157000000','三芝区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711158','7111',2,'石门','s','shi men','711158000000','石门区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7112','71',1,'宜兰','y','yi lan','711200000000','宜兰县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711214','7112',2,'宜兰市','y','yi lan shi','711214000000','宜兰市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711215','7112',2,'头城','t','tou cheng','711215000000','头城镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711216','7112',2,'礁溪','j','jiao xi','711216000000','礁溪乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711217','7112',2,'壮围','z','zhuang wei','711217000000','壮围乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711218','7112',2,'员山','y','yuan shan','711218000000','员山乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711219','7112',2,'罗东','l','luo dong','711219000000','罗东镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711220','7112',2,'三星','s','san xing','711220000000','三星乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711221','7112',2,'大同','d','da tong','711221000000','大同乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711222','7112',2,'五结','w','wu jie','711222000000','五结乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711223','7112',2,'冬山','d','dong shan','711223000000','冬山乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711224','7112',2,'苏澳','s','su ao','711224000000','苏澳镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711225','7112',2,'南澳','n','nan ao','711225000000','南澳乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7113','71',1,'新竹县','x','xin zhu xian','711300000000','新竹县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711314','7113',2,'竹北','z','zhu bei','711314000000','竹北市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711315','7113',2,'湖口','h','hu kou','711315000000','湖口乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711316','7113',2,'新丰','x','xin feng','711316000000','新丰乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711317','7113',2,'新埔','x','xin bu','711317000000','新埔镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711318','7113',2,'关西','g','guan xi','711318000000','关西镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711319','7113',2,'芎林','x','xiong lin','711319000000','芎林乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711320','7113',2,'宝山','b','bao shan','711320000000','宝山乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711321','7113',2,'竹东','z','zhu dong','711321000000','竹东镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711322','7113',2,'五峰','w','wu feng','711322000000','五峰乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711323','7113',2,'横山','h','heng shan','711323000000','横山乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711324','7113',2,'尖石','j','jian shi','711324000000','尖石乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711325','7113',2,'北埔','b','bei bu','711325000000','北埔乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711326','7113',2,'峨眉','e','e mei','711326000000','峨眉乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7114','71',1,'桃园','t','tao yuan','711400000000','桃园市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711414','7114',2,'中坜','z','zhong li','711414000000','中坜区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711415','7114',2,'平镇','p','ping zhen','711415000000','平镇区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711416','7114',2,'龙潭','l','long tan','711416000000','龙潭区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711417','7114',2,'杨梅','y','yang mei','711417000000','杨梅区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711418','7114',2,'新屋','x','xin wu','711418000000','新屋区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711419','7114',2,'观音','g','guan yin','711419000000','观音区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711420','7114',2,'桃园区','t','tao yuan qu','711420000000','桃园区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711421','7114',2,'龟山','g','gui shan','711421000000','龟山区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711422','7114',2,'八德','b','ba de','711422000000','八德区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711423','7114',2,'大溪','d','da xi','711423000000','大溪区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711424','7114',2,'复兴','f','fu xing','711424000000','复兴区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711425','7114',2,'大园','d','da yuan','711425000000','大园区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711426','7114',2,'芦竹','l','lu zhu','711426000000','芦竹区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7115','71',1,'苗栗','m','miao li','711500000000','苗栗县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711519','7115',2,'竹南','z','zhu nan','711519000000','竹南镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711520','7115',2,'头份','t','tou fen','711520000000','头份市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711521','7115',2,'三湾','s','san wan','711521000000','三湾乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711522','7115',2,'南庄','n','nan zhuang','711522000000','南庄乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711523','7115',2,'狮潭','s','shi tan','711523000000','狮潭乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711524','7115',2,'后龙','h','hou long','711524000000','后龙镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711525','7115',2,'通霄','t','tong xiao','711525000000','通霄镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711526','7115',2,'苑里','y','yuan li','711526000000','苑里镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711527','7115',2,'苗栗市','m','miao li shi','711527000000','苗栗市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711528','7115',2,'造桥','z','zao qiao','711528000000','造桥乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711529','7115',2,'头屋','t','tou wu','711529000000','头屋乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711530','7115',2,'公馆','g','gong guan','711530000000','公馆乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711531','7115',2,'大湖','d','da hu','711531000000','大湖乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711532','7115',2,'泰安','t','tai an','711532000000','泰安乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711533','7115',2,'铜锣','t','tong luo','711533000000','铜锣乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711534','7115',2,'三义','s','san yi','711534000000','三义乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711535','7115',2,'西湖','x','xi hu','711535000000','西湖乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711536','7115',2,'卓兰','z','zhuo lan','711536000000','卓兰镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7117','71',1,'彰化','z','zhang hua','711700000000','彰化县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711727','7117',2,'彰化市','z','zhang hua shi','711727000000','彰化市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711728','7117',2,'芬园','f','fen yuan','711728000000','芬园乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711729','7117',2,'花坛','h','hua tan','711729000000','花坛乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711730','7117',2,'秀水','x','xiu shui','711730000000','秀水乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711731','7117',2,'鹿港','l','lu gang','711731000000','鹿港镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711732','7117',2,'福兴','f','fu xing','711732000000','福兴乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711733','7117',2,'线西','x','xian xi','711733000000','线西乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711734','7117',2,'和美','h','he mei','711734000000','和美镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711735','7117',2,'伸港','s','shen gang','711735000000','伸港乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711736','7117',2,'员林','y','yuan lin','711736000000','员林市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711737','7117',2,'社头','s','she tou','711737000000','社头乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711738','7117',2,'永靖','y','yong jing','711738000000','永靖乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711739','7117',2,'埔心','b','bu xin','711739000000','埔心乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711740','7117',2,'溪湖','x','xi hu','711740000000','溪湖镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711741','7117',2,'大村','d','da cun','711741000000','大村乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711742','7117',2,'埔盐','b','bu yan','711742000000','埔盐乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711743','7117',2,'田中','t','tian zhong','711743000000','田中镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711744','7117',2,'北斗','b','bei dou','711744000000','北斗镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711745','7117',2,'田尾','t','tian wei','711745000000','田尾乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711746','7117',2,'埤头','p','pi tou','711746000000','埤头乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711747','7117',2,'溪州','x','xi zhou','711747000000','溪州乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711748','7117',2,'竹塘','z','zhu tang','711748000000','竹塘乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711749','7117',2,'二林','e','er lin','711749000000','二林镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711750','7117',2,'大城','d','da cheng','711750000000','大城乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711751','7117',2,'芳苑','f','fang yuan','711751000000','芳苑乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711752','7117',2,'二水','e','er shui','711752000000','二水乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7119','71',1,'嘉义县','j','jia yi xian','711900000000','嘉义县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711919','7119',2,'番路','f','fan lu','711919000000','番路乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711920','7119',2,'梅山','m','mei shan','711920000000','梅山乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711921','7119',2,'竹崎','z','zhu qi','711921000000','竹崎乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711922','7119',2,'阿里山','a','a li shan','711922000000','阿里山乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711923','7119',2,'中埔','z','zhong bu','711923000000','中埔乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711924','7119',2,'大埔','d','da bu','711924000000','大埔乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711925','7119',2,'水上','s','shui shang','711925000000','水上乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711926','7119',2,'鹿草','l','lu cao','711926000000','鹿草乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711927','7119',2,'太保','t','tai bao','711927000000','太保市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711928','7119',2,'朴子','p','piao zi','711928000000','朴子市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711929','7119',2,'东石','d','dong shi','711929000000','东石乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711930','7119',2,'六脚','l','liu jiao','711930000000','六脚乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711931','7119',2,'新港','x','xin gang','711931000000','新港乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711932','7119',2,'民雄','m','min xiong','711932000000','民雄乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711933','7119',2,'大林','d','da lin','711933000000','大林镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711934','7119',2,'溪口','x','xi kou','711934000000','溪口乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711935','7119',2,'义竹','y','yi zhu','711935000000','义竹乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('711936','7119',2,'布袋','b','bu dai','711936000000','布袋镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7121','71',1,'云林','y','yun lin','712100000000','云林县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712121','7121',2,'斗南','d','dou nan','712121000000','斗南镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712122','7121',2,'大埤','d','da pi','712122000000','大埤乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712123','7121',2,'虎尾','h','hu wei','712123000000','虎尾镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712124','7121',2,'土库','t','tu ku','712124000000','土库镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712125','7121',2,'褒忠','b','bao zhong','712125000000','褒忠乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712126','7121',2,'东势','d','dong shi','712126000000','东势乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712127','7121',2,'台西','t','tai xi','712127000000','台西乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712128','7121',2,'仑背','l','lun bei','712128000000','仑背乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712129','7121',2,'麦寮','m','mai liao','712129000000','麦寮乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712130','7121',2,'斗六','d','dou liu','712130000000','斗六市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712131','7121',2,'林内','l','lin nei','712131000000','林内乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712132','7121',2,'古坑','g','gu keng','712132000000','古坑乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712133','7121',2,'莿桐','c','ci tong','712133000000','莿桐乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712134','7121',2,'西螺','x','xi luo','712134000000','西螺镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712135','7121',2,'二仑','e','er lun','712135000000','二仑乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712136','7121',2,'北港','b','bei gang','712136000000','北港镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712137','7121',2,'水林','s','shui lin','712137000000','水林乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712138','7121',2,'口湖','k','kou hu','712138000000','口湖乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712139','7121',2,'四湖','s','si hu','712139000000','四湖乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712140','7121',2,'元长','y','yuan chang','712140000000','元长乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7124','71',1,'屏东','p','ping dong','712400000000','屏东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712434','7124',2,'屏东市','p','ping dong shi','712434000000','屏东市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712435','7124',2,'三地门','s','san di men','712435000000','三地门乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712436','7124',2,'雾台','w','wu tai','712436000000','雾台乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712437','7124',2,'玛家','m','ma jia','712437000000','玛家乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712438','7124',2,'九如','j','jiu ru','712438000000','九如乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712439','7124',2,'里港','l','li gang','712439000000','里港乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712440','7124',2,'高树','g','gao shu','712440000000','高树乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712441','7124',2,'盐埔','y','yan bu','712441000000','盐埔乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712442','7124',2,'长治','c','chang zhi','712442000000','长治乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712443','7124',2,'麟洛','l','lin luo','712443000000','麟洛乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712444','7124',2,'竹田','z','zhu tian','712444000000','竹田乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712445','7124',2,'内埔','n','nei bu','712445000000','内埔乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712446','7124',2,'万丹','w','wan dan','712446000000','万丹乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712447','7124',2,'潮州','c','chao zhou','712447000000','潮州镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712448','7124',2,'泰武','t','tai wu','712448000000','泰武乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712449','7124',2,'来义','l','lai yi','712449000000','来义乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712450','7124',2,'万峦','w','wan luan','712450000000','万峦乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712451','7124',2,'崁顶','k','kan ding','712451000000','崁顶乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712452','7124',2,'新埤','x','xin pi','712452000000','新埤乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712453','7124',2,'南州','n','nan zhou','712453000000','南州乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712454','7124',2,'林边','l','lin bian','712454000000','林边乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712455','7124',2,'东港','d','dong gang','712455000000','东港镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712456','7124',2,'琉球','l','liu qiu','712456000000','琉球乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712457','7124',2,'佳冬','j','jia dong','712457000000','佳冬乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712458','7124',2,'新园','x','xin yuan','712458000000','新园乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712459','7124',2,'枋寮','f','fang liao','712459000000','枋寮乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712460','7124',2,'枋山','f','fang shan','712460000000','枋山乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712461','7124',2,'春日','c','chun ri','712461000000','春日乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712462','7124',2,'狮子','s','shi zi','712462000000','狮子乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712463','7124',2,'车城','c','che cheng','712463000000','车城乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712464','7124',2,'牡丹','m','mu dan','712464000000','牡丹乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712465','7124',2,'恒春','h','heng chun','712465000000','恒春镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712466','7124',2,'满州','m','man zhou','712466000000','满州乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7125','71',1,'台东','t','tai dong','712500000000','台东县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712517','7125',2,'台东市','t','tai dong shi','712517000000','台东市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712518','7125',2,'绿岛','l','lv dao','712518000000','绿岛乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712519','7125',2,'兰屿','l','lan yu','712519000000','兰屿乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712520','7125',2,'延平','y','yan ping','712520000000','延平乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712521','7125',2,'卑南','b','bei nan','712521000000','卑南乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712522','7125',2,'鹿野','l','lu ye','712522000000','鹿野乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712523','7125',2,'关山','g','guan shan','712523000000','关山镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712524','7125',2,'海端','h','hai duan','712524000000','海端乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712525','7125',2,'池上','c','chi shang','712525000000','池上乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712526','7125',2,'东河','d','dong he','712526000000','东河乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712527','7125',2,'成功','c','cheng gong','712527000000','成功镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712528','7125',2,'长滨','c','chang bin','712528000000','长滨乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712529','7125',2,'金峰','j','jin feng','712529000000','金峰乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712530','7125',2,'大武','d','da wu','712530000000','大武乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712531','7125',2,'达仁','d','da ren','712531000000','达仁乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712532','7125',2,'太麻里','t','tai ma li','712532000000','太麻里乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7126','71',1,'花莲','h','hua lian','712600000000','花莲县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712615','7126',2,'花莲市','h','hua lian shi','712615000000','花莲市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712616','7126',2,'新城','x','xin cheng','712616000000','新城乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712618','7126',2,'秀林','x','xiu lin','712618000000','秀林乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712619','7126',2,'吉安','j','ji an','712619000000','吉安乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712620','7126',2,'寿丰','s','shou feng','712620000000','寿丰乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712621','7126',2,'凤林','f','feng lin','712621000000','凤林镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712622','7126',2,'光复','g','guang fu','712622000000','光复乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712623','7126',2,'丰滨','f','feng bin','712623000000','丰滨乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712624','7126',2,'瑞穗','r','rui sui','712624000000','瑞穗乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712625','7126',2,'万荣','w','wan rong','712625000000','万荣乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712626','7126',2,'玉里','y','yu li','712626000000','玉里镇');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712627','7126',2,'卓溪','z','zhuo xi','712627000000','卓溪乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712628','7126',2,'富里','f','fu li','712628000000','富里乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('7127','71',1,'澎湖','p','peng hu','712700000000','澎湖县');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712707','7127',2,'马公','m','ma gong','712707000000','马公市');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712708','7127',2,'西屿','x','xi yu','712708000000','西屿乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712709','7127',2,'望安','w','wang an','712709000000','望安乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712710','7127',2,'七美','q','qi mei','712710000000','七美乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712711','7127',2,'白沙','b','bai sha','712711000000','白沙乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('712712','7127',2,'湖西','h','hu xi','712712000000','湖西乡');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('81','0',0,'香港','~1','xiang gang','810000000000','香港特别行政区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('8100','81',1,'香港','x','xiang gang','810000000000','香港特别行政区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('810000','8100',2,'香港','x','xiang gang','810000000000','香港特别行政区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('82','0',0,'澳门','~2','ao men','820000000000','澳门特别行政区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('8200','82',1,'澳门','a','ao men','820000000000','澳门特别行政区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('820000','8200',2,'澳门','a','ao men','820000000000','澳门特别行政区');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('91','0',0,'国外','~4','guo wai','0','国外');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('9100','91',1,'国外','g','guo wai','0','国外');
insert  into `sys_division_data`(`id`,`pid`,`deep`,`name`,`pinyin_prefix`,`pinyin`,`ext_id`,`ext_name`) values ('910000','9100',2,'国外','g','guo wai','0','国外');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
                           `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                           `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
                           `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                           `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                           `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
                           `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                           `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                           `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                           `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
                           PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
                               `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                               `job_name` varchar(64) NOT NULL COMMENT '任务名称',
                               `job_group` varchar(64) NOT NULL COMMENT '任务组名',
                               `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                               `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
                               `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                               `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
                                  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
                                  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
                                  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
                                  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
                                  PRIMARY KEY (`info_id`),
                                  KEY `idx_sys_logininfor_s` (`status`),
                                  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
                            `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                            `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
                            `menu_code` varchar(255) DEFAULT NULL COMMENT '菜单编号（国际化用这个字段作为key）',
                            `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
                            `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
                            `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                            `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                            `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
                            `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
                            `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT '' COMMENT '备注',
                            PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3065 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统管理','sysManage',0,8,'#','','M','0','1','','fa fa-gear','admin','2024-12-11 02:42:43','',NULL,'系统管理目录');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'系统监控','sysMonitor',0,9,'#','','M','0','1','','fa fa-video-camera','admin','2024-12-11 02:42:43','',NULL,'系统监控目录');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'系统工具','sysTools',0,10,'#','','M','0','1','','fa fa-bars','admin','2024-12-11 02:42:44','',NULL,'系统工具目录');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (100,'用户管理','userManage',1,1,'/system/user','','C','0','1','system:user:view','fa fa-user-o','admin','2024-12-11 02:42:44','',NULL,'用户管理菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (101,'角色管理','roleManage',1,2,'/system/role','','C','0','1','system:role:view','fa fa-user-secret','admin','2024-12-11 02:42:44','',NULL,'角色管理菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (102,'菜单管理','menuManage',1,3,'/system/menu','','C','0','1','system:menu:view','fa fa-th-list','admin','2024-12-11 02:42:44','',NULL,'菜单管理菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (103,'部门管理','deptManage',1,4,'/system/dept','','C','0','1','system:dept:view','fa fa-outdent','admin','2024-12-11 02:42:45','',NULL,'部门管理菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (104,'岗位管理','postManage',1,5,'/system/post','','C','0','1','system:post:view','fa fa-address-card-o','admin','2024-12-11 02:42:45','',NULL,'岗位管理菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (105,'字典管理','dictManage',1,6,'/system/dict','','C','0','1','system:dict:view','fa fa-bookmark-o','admin','2024-12-11 02:42:45','',NULL,'字典管理菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (106,'参数设置','configManage',1,7,'/system/config','','C','0','1','system:config:view','fa fa-sun-o','admin','2024-12-11 02:42:45','',NULL,'参数设置菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (107,'通知公告','noticeManage',1,8,'/system/notice','','C','0','1','system:notice:view','fa fa-bullhorn','admin','2024-12-11 02:42:46','',NULL,'通知公告菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (108,'日志管理','logManage',1,9,'#','','M','0','1','','fa fa-pencil-square-o','admin','2024-12-11 02:42:46','',NULL,'日志管理菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (109,'在线用户','onlineUser',2,1,'/monitor/online','','C','0','1','monitor:online:view','fa fa-user-circle','admin','2024-12-11 02:42:46','',NULL,'在线用户菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (112,'服务监控','serverManage',2,4,'/monitor/server','','C','0','1','monitor:server:view','fa fa-server','admin','2024-12-11 02:42:46','',NULL,'服务监控菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (113,'缓存监控','cacheMonitor',2,5,'/monitor/cache','','C','0','1','monitor:cache:view','fa fa-cube','admin','2024-12-11 02:42:47','',NULL,'缓存监控菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (114,'表单构建','buildTool',3,1,'/tool/build','','C','0','1','tool:build:view','fa fa-wpforms','admin','2024-12-11 02:42:47','',NULL,'表单构建菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (115,'代码生成','genTool',3,2,'/tool/gen','','C','0','1','tool:gen:view','fa fa-code','admin','2024-12-11 02:42:47','',NULL,'代码生成菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (116,'系统接口','swaggerTool',3,3,'/tool/swagger','','C','0','1','tool:swagger:view','fa fa-gg','admin','2024-12-11 02:42:47','',NULL,'系统接口菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (500,'操作日志','operLog',108,1,'/monitor/operlog','','C','0','1','monitor:operlog:view','fa fa-address-book','admin','2024-12-11 02:42:47','',NULL,'操作日志菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (501,'登录日志','loginLog',108,2,'/monitor/logininfor','','C','0','1','monitor:logininfor:view','fa fa-file-image-o','admin','2024-12-11 02:42:47','',NULL,'登录日志菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1000,'用户查询','userQuery',100,1,'#','','F','0','1','system:user:list','#','admin','2024-12-11 02:42:48','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1001,'用户新增','userAdd',100,2,'#','','F','0','1','system:user:add','#','admin','2024-12-11 02:42:48','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1002,'用户修改','userEdit',100,3,'#','','F','0','1','system:user:edit','#','admin','2024-12-11 02:42:48','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1003,'用户删除','userDel',100,4,'#','','F','0','1','system:user:remove','#','admin','2024-12-11 02:42:48','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1004,'用户导出','userExport',100,5,'#','','F','0','1','system:user:export','#','admin','2024-12-11 02:42:48','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1005,'用户导入','userImport',100,6,'#','','F','0','1','system:user:import','#','admin','2024-12-11 02:42:49','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1006,'重置密码','resetPass',100,7,'#','','F','0','1','system:user:resetPwd','#','admin','2024-12-11 02:42:49','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1007,'角色查询','roleQuery',101,1,'#','','F','0','1','system:role:list','#','admin','2024-12-11 02:42:49','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1008,'角色新增','roleAdd',101,2,'#','','F','0','1','system:role:add','#','admin','2024-12-11 02:42:49','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1009,'角色修改','roleEdit',101,3,'#','','F','0','1','system:role:edit','#','admin','2024-12-11 02:42:49','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1010,'角色删除','roleDel',101,4,'#','','F','0','1','system:role:remove','#','admin','2024-12-11 02:42:50','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1011,'角色导出','roleExport',101,5,'#','','F','0','1','system:role:export','#','admin','2024-12-11 02:42:50','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1012,'菜单查询','menuQuery',102,1,'#','','F','0','1','system:menu:list','#','admin','2024-12-11 02:42:50','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1013,'菜单新增','menuAdd',102,2,'#','','F','0','1','system:menu:add','#','admin','2024-12-11 02:42:50','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1014,'菜单修改','menuEdit',102,3,'#','','F','0','1','system:menu:edit','#','admin','2024-12-11 02:42:51','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1015,'菜单删除','menuDel',102,4,'#','','F','0','1','system:menu:remove','#','admin','2024-12-11 02:42:51','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1016,'部门查询','deptQuery',103,1,'#','','F','0','1','system:dept:list','#','admin','2024-12-11 02:42:51','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1017,'部门新增','deptAdd',103,2,'#','','F','0','1','system:dept:add','#','admin','2024-12-11 02:42:51','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1018,'部门修改','deptEdit',103,3,'#','','F','0','1','system:dept:edit','#','admin','2024-12-11 02:42:52','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1019,'部门删除','deptDel',103,4,'#','','F','0','1','system:dept:remove','#','admin','2024-12-11 02:42:52','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1020,'岗位查询','postQuery',104,1,'#','','F','0','1','system:post:list','#','admin','2024-12-11 02:42:52','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1021,'岗位新增','postAdd',104,2,'#','','F','0','1','system:post:add','#','admin','2024-12-11 02:42:52','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1022,'岗位修改','postEdit',104,3,'#','','F','0','1','system:post:edit','#','admin','2024-12-11 02:42:52','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1023,'岗位删除','postDel',104,4,'#','','F','0','1','system:post:remove','#','admin','2024-12-11 02:42:52','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1024,'岗位导出','postExport',104,5,'#','','F','0','1','system:post:export','#','admin','2024-12-11 02:42:53','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1025,'字典查询','dictQuery',105,1,'#','','F','0','1','system:dict:list','#','admin','2024-12-11 02:42:53','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1026,'字典新增','dictAdd',105,2,'#','','F','0','1','system:dict:add','#','admin','2024-12-11 02:42:53','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1027,'字典修改','dictEdit',105,3,'#','','F','0','1','system:dict:edit','#','admin','2024-12-11 02:42:53','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1028,'字典删除','dictDel',105,4,'#','','F','0','1','system:dict:remove','#','admin','2024-12-11 02:42:53','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1029,'字典导出','dictExport',105,5,'#','','F','0','1','system:dict:export','#','admin','2024-12-11 02:42:53','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1030,'参数查询','configQuery',106,1,'#','','F','0','1','system:config:list','#','admin','2024-12-11 02:42:54','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1031,'参数新增','configAdd',106,2,'#','','F','0','1','system:config:add','#','admin','2024-12-11 02:42:54','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1032,'参数修改','configEdit',106,3,'#','','F','0','1','system:config:edit','#','admin','2024-12-11 02:42:54','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1033,'参数删除','configDel',106,4,'#','','F','0','1','system:config:remove','#','admin','2024-12-11 02:42:54','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1034,'参数导出','configExport',106,5,'#','','F','0','1','system:config:export','#','admin','2024-12-11 02:42:54','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1035,'公告查询','noticeQuery',107,1,'#','','F','0','1','system:notice:list','#','admin','2024-12-11 02:42:54','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1036,'公告新增','noticeAdd',107,2,'#','','F','0','1','system:notice:add','#','admin','2024-12-11 02:42:55','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1037,'公告修改','noticeEdit',107,3,'#','','F','0','1','system:notice:edit','#','admin','2024-12-11 02:42:55','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1038,'公告删除','noticeDel',107,4,'#','','F','0','1','system:notice:remove','#','admin','2024-12-11 02:42:55','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1039,'操作查询','opraQuery',500,1,'#','','F','0','1','monitor:operlog:list','#','admin','2024-12-11 02:42:55','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1040,'操作删除','opraDel',500,2,'#','','F','0','1','monitor:operlog:remove','#','admin','2024-12-11 02:42:55','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1041,'详细信息','opraDetails',500,3,'#','','F','0','1','monitor:operlog:detail','#','admin','2024-12-11 02:42:56','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1042,'日志导出','opraExport',500,4,'#','','F','0','1','monitor:operlog:export','#','admin','2024-12-11 02:42:56','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1043,'登录查询','loginLogQuery',501,1,'#','','F','0','1','monitor:logininfor:list','#','admin','2024-12-11 02:42:56','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1044,'登录删除','loginLogDel',501,2,'#','','F','0','1','monitor:logininfor:remove','#','admin','2024-12-11 02:42:56','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1045,'日志导出','loginLogExport',501,3,'#','','F','0','1','monitor:logininfor:export','#','admin','2024-12-11 02:42:57','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1046,'账户解锁','userUnlock',501,4,'#','','F','0','1','monitor:logininfor:unlock','#','admin','2024-12-11 02:42:57','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1047,'在线查询','onlineQuery',109,1,'#','','F','0','1','monitor:online:list','#','admin','2024-12-11 02:42:57','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1048,'批量强退','batchOffline',109,2,'#','','F','0','1','monitor:online:batchForceLogout','#','admin','2024-12-11 02:42:57','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1049,'单条强退','oneOffline',109,3,'#','','F','0','1','monitor:online:forceLogout','#','admin','2024-12-11 02:42:57','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1050,'任务查询','jobQuery',110,1,'#','','F','0','1','monitor:job:list','#','admin','2024-12-11 02:42:57','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1051,'任务新增','jobAdd',110,2,'#','','F','0','1','monitor:job:add','#','admin','2024-12-11 02:42:58','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1052,'任务修改','jobEdit',110,3,'#','','F','0','1','monitor:job:edit','#','admin','2024-12-11 02:42:58','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1053,'任务删除','jobDel',110,4,'#','','F','0','1','monitor:job:remove','#','admin','2024-12-11 02:42:58','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1054,'状态修改','jobStatusEdit',110,5,'#','','F','0','1','monitor:job:changeStatus','#','admin','2024-12-11 02:42:58','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1055,'任务详细','jobDetails',110,6,'#','','F','0','1','monitor:job:detail','#','admin','2024-12-11 02:42:58','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1056,'任务导出','jobExport',110,7,'#','','F','0','1','monitor:job:export','#','admin','2024-12-11 02:42:59','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1057,'生成查询','genQuery',115,1,'#','','F','0','1','tool:gen:list','#','admin','2024-12-11 02:42:59','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1058,'生成修改','genEdit',115,2,'#','','F','0','1','tool:gen:edit','#','admin','2024-12-11 02:42:59','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1059,'生成删除','genDel',115,3,'#','','F','0','1','tool:gen:remove','#','admin','2024-12-11 02:43:00','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1060,'预览代码','previewCode',115,4,'#','','F','0','1','tool:gen:preview','#','admin','2024-12-11 02:43:00','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1061,'生成代码','genCode',115,5,'#','','F','0','1','tool:gen:code','#','admin','2024-12-11 02:43:00','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2000,'呼叫管理','callManage',0,1,'#','','M','0','1','','fa fa-tty','admin','2024-12-19 03:13:41','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2001,'switch.conf配置','switchConf',3022,1,'/cc/fsconf/switchconf','menuItem','C','0','1','cc:switchconf:view','#','admin','2024-12-19 03:15:15','admin','2025-05-05 13:05:28','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2002,'vars变量配置','varConf',3022,2,'/cc/fsconf/varsconf','menuItem','C','0','1','cc:varsconf:view','#','admin','2024-12-22 11:39:22','admin','2025-05-05 13:06:15','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2003,'讯飞ASR配置','xunfeiAsrConf',3018,3,'/cc/fsconf/xunfeiasrconf','menuItem','C','0','1','cc:xunfeiasrconf:view','#','admin','2024-12-22 11:41:44','admin','2025-05-05 10:43:33','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2004,'阿里ASR配置','aliAsrConf',3018,4,'/cc/fsconf/aliasrconf','menuItem','C','0','1','cc:aliasrconf:view','#','admin','2024-12-22 11:41:46','admin','2025-05-05 10:43:54','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2005,'证书配置','certWsspen',2000,6,'/cc/fsconf/certwsspen','menuItem','C','0','1','cc:certwsspen:view','#','admin','2024-12-22 11:41:48','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2010,'分机管理','extnum',3022,7,'/cc/extnum','menuItem','C','0','1','cc:extnum:view','#','admin','2024-12-22 15:44:52','admin','2025-05-05 13:11:39','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2011,'分机管理-新增分机','extnumAdd',2010,1,'#','','F','0','1','cc:extnum:add','#','admin','2024-12-22 15:46:49','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2012,'分机管理-修改分机','extnumEdit',2010,2,'#','','F','0','1','cc:extnum:edit','#','admin','2024-12-22 15:46:51','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2013,'分机管理-查看','extnumInfo',2010,3,'#','','F','0','1','cc:extnum:list','#','admin','2025-04-21 17:50:20','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2020,'业务组管理','bizgroup',2000,8,'/cc/bizgroup','menuItem','C','0','1','cc:bizgroup:view','#','admin','2024-12-22 15:44:55','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2021,'业务组管理-新增业务组','bizgroupAdd',2020,1,'#','','F','0','1','cc:bizgroup:add','#','admin','2024-12-22 19:29:44','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2022,'业务组管理-修改业务组','bizgroupEdit',2020,2,'#','','F','0','1','cc:bizgroup:edit','#','admin','2024-12-22 19:29:46','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2023,'业务组管理-查看','bizgroupInfo',2020,3,'#','','F','0','1','cc:bizgroup:list','#','admin','2025-04-21 17:51:26','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2030,'日志监控','catLogs',2000,9,'/cc/fsconf/catlogs','menuItem','C','0','1','cc:catlogs:view','#','admin','2024-12-22 19:31:11','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2040,'分机权限配置','extpower',2000,10,'/cc/extpower','menuItem','C','0','1','cc:extpower:view','#','admin','2024-12-24 16:39:35','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2041,'分机权限配置-新增','extpowerAdd',2040,1,'#','','F','0','1','cc:extpower:add','#','admin','2024-12-24 16:39:37','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2042,'分机权限配置-修改','extpowerEdit',2040,2,'#','','F','0','1','cc:extpower:edit','#','admin','2024-12-24 16:39:39','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2043,'分机权限配置-删除','extpowerDel',2040,3,'#','','F','0','1','cc:extpower:remove','#','admin','2024-12-24 16:39:41','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2044,'分机权限配置-列表查询','extpowerQuery',2040,4,'#','','F','0','1','cc:extpower:list','#','admin','2024-12-24 16:39:43','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2050,'profile管理','profileConf',3022,11,'/cc/fsconf/profileconf','menuItem','C','0','1','cc:profileconf:view','#','admin','2024-12-24 16:42:47','admin','2025-05-05 13:11:24','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2051,'profile管理-新增','profileConfAdd',2050,1,'#','','F','0','1','cc:profileconf:add','#','admin','2024-12-24 16:42:49','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2052,'profile管理-修改','profileConfEdit',2050,2,'#','','F','0','1','cc:profileconf:edit','#','admin','2024-12-24 16:42:51','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2053,'profile管理-查看状态','profileConfStatus',2050,3,'#','','F','0','1','cc:profileconf:status','#','admin','2024-12-24 16:42:52','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2054,'profile管理-启动','profileConfStart',2050,4,'#','','F','0','1','cc:profileconf:start','#','admin','2024-12-24 16:42:54','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2055,'profile管理-停止','profileConfStop',2050,5,'#','','F','0','1','cc:profileconf:stop','#','admin','2024-12-24 16:42:56','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2056,'profile管理-重启','profileConfRestart',2050,6,'#','','F','0','1','cc:profileconf:restart','#','admin','2024-12-24 16:42:57','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2057,'profile管理-查看','profileConfInfo',2050,7,'#','','F','0','1','cc:profileconf:list','#','admin','2025-04-21 17:52:33','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2060,'外呼线路配置','gateways',2000,12,'/cc/gateways','menuItem','C','0','1','cc:gateways:view','#','admin','2024-12-28 20:21:34','admin','2025-05-05 13:17:13','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2061,'线路配置-新增','gatewaysAdd',2060,1,'#','','F','0','1','cc:gateways:add','#','admin','2024-12-28 20:21:37','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2062,'线路配置-修改','gatewaysEdit',2060,2,'#','','F','0','1','cc:gateways:edit','#','admin','2024-12-28 20:21:38','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2063,'线路配置-列表查询','gatewaysQuery',2060,3,'#','','F','0','1','cc:gateways:list','#','admin','2024-12-28 20:21:40','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2070,'外呼记录查询','outboundcdr',2000,13,'/cc/outboundcdr','menuItem','C','0','1','cc:outboundcdr:view','#','admin','2024-12-31 15:28:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2071,'外呼记录-听录音','outboundcdrListen',2070,1,'#','','F','0','1','cc:outboundcdr:listen','#','admin','2025-01-02 21:47:02','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2072,'外呼记录-下载录音','outboundcdrDownload',2070,2,'#','','F','0','1','cc:outboundcdr:download','#','admin','2025-01-02 21:47:05','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2073,'呼入记录-查看','outboundcdrInfo',2070,3,'#','','F','0','1','cc:outboundcdr:list','#','',NULL,'',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2080,'呼入记录查询','inboundcdr',2000,14,'/cc/inboundcdr','menuItem','C','0','1','cc:inboundcdr:view','#','admin','2025-01-02 22:28:22','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2081,'呼入记录-听录音','inboundcdrListen',2080,1,'#','','F','0','1','cc:inboundcdr:listen','#','admin','2025-01-02 21:47:07','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2082,'呼入记录-下载录音','inboundcdrDownload',2080,2,'#','','F','0','1','cc:inboundcdr:download','#','admin','2025-01-02 21:47:09','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2083,'呼入记录-查看','inboundcdrInfo',2070,3,'#','','F','0','1','cc:inboundcdr:list','#','',NULL,'',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2090,'坐席监控','agentMonitor',2000,15,'/cc/monitor/agent','menuItem','C','0','1','cc:monitor:agent:view','#','admin','2025-01-02 22:28:23','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2091,'坐席监控-监听','agentMonitorListen',2090,1,'#','','F','0','1','cc:monitor:agent:listen','#','admin','2025-01-02 22:05:37','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2100,'呼入队列监控','inboundMonitor',2000,16,'/cc/monitor/inbound','menuItem','C','0','1','cc:monitor:inbound:view','#','admin','2025-01-03 15:28:25','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2110,'客户列表','custInfo',2000,17,'/cc/custinfo','menuItem','C','0','1','cc:custinfo:view','#','admin','2025-01-03 22:10:11','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2111,'客户信息-添加','custInfoAdd',2110,1,'#','','F','0','1','cc:custinfo:add','#','admin','2025-01-13 20:40:37','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2112,'客户信息-修改','custInfoEdit',2110,2,'#','','F','0','1','cc:custinfo:edit','#','admin','2025-01-13 20:40:39','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2113,'客户信息-删除','custInfoDel',2110,3,'#','','F','0','1','cc:custinfo:remove','#','admin','2025-01-13 20:40:40','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2114,'客户信息-查询','custInfoQuery',2110,4,'#','','F','0','1','cc:custinfo:list','#','admin','2025-04-21 18:02:46','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2120,'默认ASR设置','asrengine',3018,5,'/cc/fsconf/asrengine','menuItem','C','0','1','cc:asrengine:view','#','admin','2025-01-13 20:40:35','admin','2025-05-05 10:45:07','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2130,'参数管理','params',2000,0,'/system/params','menuItem','C','0','1','system:params:view','#','admin','2025-04-21 16:08:39','admin','2025-05-05 13:00:39','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2131,'参数管理-添加','paramsAdd',2130,1,'#','','F','0','1','system:params:add','#','admin','2025-04-21 16:08:41','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2132,'参数管理-修改','paramsEdit',2130,2,'#','','F','0','1','system:params:edit','#','admin','2025-04-21 16:08:44','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2133,'参数管理-删除','paramsDel',2130,3,'#','','F','0','1','system:params:remove','#','admin','2025-04-21 16:08:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2134,'客户信息-查看','paramsInfo',2130,4,'#','','F','0','1','system:params:list','#','admin','2025-04-21 17:47:44','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3000,'AI外呼','AIAssistant',0,2,'#','menuItem','M','0','1','','fa fa-television','admin','2025-03-27 13:53:06','admin','2025-03-27 05:56:41','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3010,'FAQ设置','faq',3000,50,'/aicall/faq','menuItem','C','1','1','aicall:faq:view','#','admin','2025-03-26 11:31:18','admin','2025-06-24 02:02:44','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3011,'FAQ设置-添加','faqAdd',3010,1,'#','','F','1','1','aicall:faq:add','#','admin','2025-03-26 11:32:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3012,'FAQ设置-修改','faqEdit',3010,2,'#','','F','1','1','aicall:faq:edit','#','admin','2025-03-26 11:32:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3013,'FAQ设置-删除','faqDel',3010,3,'#','','F','1','1','aicall:faq:remove','#','admin','2025-03-26 11:32:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3014,'FAQ设置-导入','faqImport',3010,4,'#','','F','1','1','aicall:faq:import','#','admin','2025-03-26 11:32:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3015,'FAQ设置-导出','faqExport',3010,5,'#','','F','1','1','aicall:faq:export','#','admin','2025-03-26 11:32:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3016,'FAQ设置-发布','faqPublish',3010,6,'#','','F','1','1','aicall:faq:publish','#','admin','2025-03-26 11:32:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3017,'阿里云tts配置','alittsconf',3019,6,'/cc/fsconf/alittsconf','menuItem','C','0','1','cc:alittsconf:view','#','admin','2025-05-04 21:56:07','admin','2025-05-05 10:48:02','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3018,'语音识别配置','ASRConf',2000,2,'#','menuItem','M','0','1','','fa fa-volume-down','admin','2025-05-05 10:42:52','admin','2025-05-05 13:24:20','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3019,'语音合成配置','TTSConf',2000,3,'#','menuItem','M','0','1','','fa fa-volume-up','admin','2025-05-05 10:47:06','admin','2025-05-05 13:24:31','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3020,'FunASR配置','funasrconf',3018,2,'/cc/fsconf/funasrconf','menuItem','C','0','1','cc:funasrconf:view','#','admin','2025-05-05 10:51:22','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3022,'FreeSWITCH配置','FreeswitchConf',2000,1,'#','menuItem','M','0','1','','#','admin','2025-05-05 13:05:05','admin','2025-05-05 13:24:01','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3030,'外呼任务管理','callTask',3000,60,'/aicall/callTask','menuItem','C','0','1','aicall:callTask:view','#','admin','2025-05-29 08:59:09','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3031,'创建任务','callTaskAdd',3030,1,'#','','F','0','1','aicall:callTask:add','#','admin','2025-05-29 08:59:09','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3032,'编辑任务','callTaskEdit',3030,1,'#','','F','0','1','aicall:callTask:edit','#','admin','2025-05-29 08:59:09','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3033,'列表查询','callTaskQuery',3030,1,'#','','F','0','1','aicall:callTask:list','#','admin','2025-05-29 08:59:09','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3034,'启动任务','callTaskStart',3030,1,'#','menuItem','F','0','1','aicall:callTask:start','#','admin','2025-05-29 08:59:09','admin','2025-05-29 09:54:35','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3035,'暂停任务','callTaskPause',3030,1,'#','','F','0','1','aicall:callTask:pause','#','admin','2025-05-29 08:59:09','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3036,'导入名单','callListImport',3030,1,'#','','F','0','1','aicall:callTask:import','#','admin','2025-05-29 08:59:09','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3040,'AI外呼记录','callPhone',3000,70,'/aicall/callPhone','menuItem','C','0','1','aicall:callPhone:view','#','admin','2025-05-29 08:59:09','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3041,'AI外呼记录查询','callPhoneQuery',3040,1,'#','','F','0','1','aicall:callPhone:list','#','admin','2025-05-29 08:59:10','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3050,'大模型配置','llmAccount',3000,80,'/aicall/account','menuItem','C','0','1','aicall:account:view','#','admin','2025-06-16 06:22:40','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3051,'大模型配置查询','llmAccountQuery',3050,1,'#','','F','0','1','aicall:account:list','#','admin','2025-06-16 06:22:41','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3052,'大模型配置新增','llmAccountAdd',3050,1,'#','','F','0','1','aicall:account:add','#','admin','2025-06-16 06:22:41','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3053,'大模型配置修改','llmAccountEdit',3050,1,'#','','F','0','1','aicall:account:edit','#','admin','2025-06-16 06:22:41','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3054,'大模型配置删除','llmAccountDel',3050,1,'#','','F','0','1','aicall:account:del','#','admin','2025-06-16 06:22:42','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3060,'呼入配置','inboundllm',3000,5,'/aicall/inboundllm','','C','0','1','aicall:inboundllm:view','#','admin','2025-06-24 02:10:46','',NULL,'呼入大模型配置菜单');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3061,'呼入大模型配置查询','inboundllmQuery',3060,1,'#','','F','0','1','aicall:inboundllm:list','#','admin','2025-06-24 02:10:46','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3062,'呼入大模型配置新增','inboundllmAdd',3060,2,'#','','F','0','1','aicall:inboundllm:add','#','admin','2025-06-24 02:10:47','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3063,'呼入大模型配置修改','inboundllmEdit',3060,3,'#','','F','0','1','aicall:inboundllm:edit','#','admin','2025-06-24 02:10:47','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3064,'呼入大模型配置删除','inboundllmDel',3060,4,'#','','F','0','1','aicall:inboundllm:remove','#','admin','2025-06-24 02:10:48','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
                              `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                              `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
                              `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
                              `notice_content` longblob COMMENT '公告内容',
                              `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
                                `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                `title` varchar(50) DEFAULT '' COMMENT '模块标题',
                                `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                `method` varchar(200) DEFAULT '' COMMENT '方法名称',
                                `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
                                `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
                                `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
                                `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
                                `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
                                `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
                                `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
                                `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
                                `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
                                `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                                `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
                                PRIMARY KEY (`oper_id`),
                                KEY `idx_sys_oper_log_bt` (`business_type`),
                                KEY `idx_sys_oper_log_s` (`status`),
                                KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
                            `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                            `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
                            `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
                            `post_sort` int NOT NULL COMMENT '显示顺序',
                            `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ceo','董事长',1,'0','admin','2024-12-11 02:42:36','',NULL,'');
insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'se','项目经理',2,'0','admin','2024-12-11 02:42:36','',NULL,'');
insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'hr','人力资源',3,'0','admin','2024-12-11 02:42:36','',NULL,'');
insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,'user','普通员工',4,'0','admin','2024-12-11 02:42:37','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
                            `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                            `role_name` varchar(30) NOT NULL COMMENT '角色名称',
                            `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
                            `role_sort` int NOT NULL COMMENT '显示顺序',
                            `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                            `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'超级管理员','admin',1,'1','0','0','admin','2024-12-11 02:42:40','',NULL,'超级管理员');
insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'普通角色','common',2,'2','0','0','admin','2024-12-11 02:42:40','admin','2025-05-29 09:50:59','普通角色');
insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'呼入','inbound',3,'1','0','0','admin','2025-07-04 09:24:51','admin','2025-07-04 09:28:21','');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `dept_id` bigint NOT NULL COMMENT '部门ID',
                                 PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,100);
insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,101);
insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `menu_id` bigint NOT NULL COMMENT '菜单ID',
                                 PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2000);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2001);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2002);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2003);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2004);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2010);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2011);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2012);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2013);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2030);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2050);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2051);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2052);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2053);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2054);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2055);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2056);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2057);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2060);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2061);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2062);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2063);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2070);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2071);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2072);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2073);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2080);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2081);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2082);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2083);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2120);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2130);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2131);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2132);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2133);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2134);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3017);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3018);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3019);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3020);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3022);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3030);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3031);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3032);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3033);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3034);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3035);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3036);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3040);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3041);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2000);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2080);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2081);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2082);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,3000);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,3050);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,3060);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
                            `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                            `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
                            `login_name` varchar(30) NOT NULL COMMENT '登录账号',
                            `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
                            `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
                            `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
                            `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
                            `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                            `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
                            `password` varchar(50) DEFAULT '' COMMENT '密码',
                            `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
                            `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
                            `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
                            `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`login_name`,`user_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`salt`,`status`,`del_flag`,`login_ip`,`login_date`,`pwd_update_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,103,'admin','admin','00','admin@163.com','15888888888','1','','29c67a30398638269fe600f73a054934','111111','0','0','192.168.67.32','2025-08-04 15:09:43',NULL,'admin','2024-12-11 02:42:33','','2025-08-04 07:09:43','管理员');
insert  into `sys_user`(`user_id`,`dept_id`,`login_name`,`user_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`salt`,`status`,`del_flag`,`login_ip`,`login_date`,`pwd_update_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,103,'easycallcenter365','easycallcenter365','00','492322852@qq.com','15005600327','0','','321adc95fbb78c4856554e5ccb54be55','505ffc','0','0','127.0.0.1','2025-06-16 14:18:03','2025-05-05 13:00:15','admin','2025-05-05 12:58:06','','2025-06-16 06:18:03',NULL);
insert  into `sys_user`(`user_id`,`dept_id`,`login_name`,`user_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`salt`,`status`,`del_flag`,`login_ip`,`login_date`,`pwd_update_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,100,'test01','test01','00','','','0','','68c400e4ca5c5885a7b721324145f608','167d8d','0','0','192.168.66.5','2025-07-04 17:27:25','2025-07-04 17:23:13','admin','2025-07-04 09:23:12','admin','2025-07-04 09:27:24','');

/*Table structure for table `sys_user_online` */

DROP TABLE IF EXISTS `sys_user_online`;

CREATE TABLE `sys_user_online` (
                                   `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
                                   `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
                                   `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                   `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
                                   `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                   `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                   `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                   `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
                                   `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
                                   `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
                                   `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
                                   PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='在线用户记录';

/*Data for the table `sys_user_online` */

insert  into `sys_user_online`(`sessionId`,`login_name`,`dept_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`start_timestamp`,`last_access_time`,`expire_time`) values ('8148b9b0-30f6-4fcf-ae26-e459fd1f25a3','admin','研发部门','192.168.67.32','内网IP','Chrome 13','Windows 10','on_line','2025-08-04 14:57:56','2025-08-04 15:09:43',1800000);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `post_id` bigint NOT NULL COMMENT '岗位ID',
                                 PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values (1,1);
insert  into `sys_user_post`(`user_id`,`post_id`) values (3,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1);
insert  into `sys_user_role`(`user_id`,`role_id`) values (3,2);
insert  into `sys_user_role`(`user_id`,`role_id`) values (4,3);
insert  into `sys_user_role`(`user_id`,`role_id`) values (100,2);

