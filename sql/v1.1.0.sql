DROP TABLE IF EXISTS `cc_call_task`;
CREATE TABLE `cc_call_task` (
                                `batch_id` int(11) NOT NULL AUTO_INCREMENT,
                                `group_id` varchar(256) NOT NULL DEFAULT '1' COMMENT '外呼任务的业务组 ',
                                `batch_name` varchar(50) NOT NULL DEFAULT '外呼任务名称',
                                `ifcall` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否启动任务, 1 启动， 0 停止',
                                `rate` double NOT NULL DEFAULT '5' COMMENT '外呼速率',
                                `thread_num` int(11) NOT NULL DEFAULT '30' COMMENT '当前任务最大可用外线数',
                                `createtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务创建时间',
                                `executing` int(11) NOT NULL DEFAULT '0' COMMENT '任务是否正在执行;',
                                `stop_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务停止时间',
                                `userid` varchar(32) NOT NULL DEFAULT '' COMMENT '任务创建者用户id',
                                `task_type` int(2) NOT NULL DEFAULT '1' COMMENT '0 Pure manual outbound call; 1 AI outbound calling; 2 voice call notification.',
                                `gateway_id` int(11) NOT NULL COMMENT '使用哪条线路外呼',
                                `voice_code` varchar(255) NOT NULL DEFAULT '' COMMENT '外呼任务，机器人的发音人',
                                `voice_source` varchar(255) NOT NULL DEFAULT 'aliyun' COMMENT '外呼任务，机器人的tts提供者',
                                `avg_ring_time_len` double(8,3) NOT NULL DEFAULT '0.000' COMMENT 'The average ringing duration of the call; seconds',
  `avg_call_talk_time_len` double(8,3) NOT NULL DEFAULT '0.000' COMMENT 'The average pure call duration per call; seconds',
  `avg_call_end_process_time_len` double(8,3) NOT NULL DEFAULT '0.000' COMMENT 'The duration of form filling after the call ends; seconds',
  `call_node_no` varchar(11) NOT NULL DEFAULT '01' COMMENT '外呼节点',
  `llm_account_id` int(8) NOT NULL DEFAULT '0' COMMENT '大模型底座账号的Id',
  `play_times` int(2) NOT NULL DEFAULT '2' COMMENT 'voice call notification play times.',
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='外呼任务表';


DROP TABLE IF EXISTS `cc_call_phone`;
CREATE TABLE `cc_call_phone` (
                                 `id` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
                                 `batch_id` int(11) NOT NULL COMMENT '任务批次id',
                                 `telephone` varchar(50) NOT NULL,
                                 `cust_name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户称呼',
                                 `createtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务创建时间',
                                 `callstatus` smallint(6) NOT NULL DEFAULT '0' COMMENT '0. Not dialed  \r\n1. Entered call queue  \r\n2. Dialing (in progress)  \r\n3. Not connected (If the empty number detection feature is turned off)\r\n4. Connected  \r\n5. Call dropped (hung up before transferring to agent)  \r\n6. Successfully transferred to agent or AI  \r\n7. Line failure  \r\n\r\n30. Not connected\r\n31. Customer is on another call  \r\n32. Phone is powered off  \r\n33. Invalid number  \r\n34. No answer  \r\n35. Suspended service  \r\n36. Network busy  \r\n37. Voice assistant\r\n38. Temporarily unavailable\r\n39. Call restriction',
                                 `callout_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '外呼时间',
                                 `callcount` smallint(6) NOT NULL DEFAULT '0' COMMENT '呼叫次数',
                                 `call_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '呼叫结束时间',
                                 `time_len` int(11) NOT NULL DEFAULT '0' COMMENT '通话时长; 秒;',
                                 `valid_time_len` int(11) NOT NULL DEFAULT '0' COMMENT '人工接听的通话时长; 秒',
                                 `uuid` varchar(50) NOT NULL DEFAULT '' COMMENT '通话唯一标志',
                                 `connected_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '通话接通时间',
                                 `hangup_cause` varchar(50) NOT NULL DEFAULT 'Normal Clearing' COMMENT '挂机原因',
                                 `answered_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '人工坐席应答时间',
                                 `dialogue` text COMMENT '对话内容',
                                 `wavfile` varchar(200) NOT NULL DEFAULT '' COMMENT '全程通话录音文件名',
                                 `record_server_url` varchar(255) NOT NULL DEFAULT '' COMMENT '录音文件路径前缀',
                                 `biz_json` varchar(5000) NOT NULL DEFAULT '' COMMENT '业务json数据',
                                 `dialogue_count` int(11) DEFAULT '0' COMMENT '交互轮次（一问一答算一轮交互）',
                                 `acd_opnum` varchar(50) NOT NULL DEFAULT '' COMMENT '人工坐席工号',
                                 `acd_queue_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '加入转人工排队的时间; ',
                                 `acd_wait_time` int(8) NOT NULL DEFAULT '0' COMMENT '人工排队等待时长,秒',
                                 `tts_text` text COMMENT 'tts text for voice call notification.',
                                 `empty_number_detection_text` varchar(1000) NOT NULL DEFAULT '',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外呼号码表';



-- 任务管理菜单
INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3030','外呼任务管理','3000','2','/aicall/callTask','menuItem','C','0','1','aicall:callTask:view','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3031','创建任务','3030','1','#','','F','0','1','aicall:callTask:add','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3032','编辑任务','3030','1','#','','F','0','1','aicall:callTask:edit','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3033','列表查询','3030','1','#','','F','0','1','aicall:callTask:list','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3034','启动任务','3030','1','#','','F','0','1','aicall:callTask:start','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3035','暂停任务','3030','1','#','','F','0','1','aicall:callTask:pause','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3036','导入名单','3030','1','#','','F','0','1','aicall:callTask:import','#','admin',NOW()) ;



-- AI外呼记录查询菜单
INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3040','AI外呼记录','3000','3','/aicall/callPhone','menuItem','C','0','1','aicall:callPhone:view','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3041','AI外呼记录查询','3040','1','#','','F','0','1','aicall:callPhone:list','#','admin',NOW()) ;


/*Table structure for table `cc_tts_aliyun` */

DROP TABLE IF EXISTS `cc_tts_aliyun`;

CREATE TABLE `cc_tts_aliyun` (
                                 `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                 `voice_name` varchar(100) NOT NULL COMMENT 'tts发音人名称',
                                 `voice_code` varchar(100) NOT NULL COMMENT 'tts发音人代码',
                                 `voice_enabled` int(2) NOT NULL DEFAULT '1' COMMENT '是否启用',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COMMENT='阿里云音色列表';

/*Data for the table `cc_tts_aliyun` */

insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (5,'阿斌 - 广东普通话','abin',1);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (6,'知小白 - 普通话女声','zhixiaobai',2);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (7,'知小夏 - 普通话女声','zhixiaoxia',3);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (8,'知小妹 - 普通话女声','zhixiaomei',4);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (9,'知柜 - 普通话女声','zhigui',5);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (10,'知硕 - 普通话男声','zhishuo',6);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (11,'艾夏 - 普通话女声','aixia',7);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (12,'Cally - 美式英文女声','cally',8);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (13,'知锋_多情感 - 多种情感男声','zhifeng_emo',9);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (14,'知冰_多情感 - 多种情感男声','zhibing_emo',10);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (15,'知妙_多情感 - 多种情感女声','zhimiao_emo',11);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (16,'知米_多情感 - 多种情感女声','zhimi_emo',12);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (17,'知燕_多情感 - 多种情感女声','zhiyan_emo',13);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (18,'知贝_多情感 - 多种情感童声','zhibei_emo',14);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (19,'知甜_多情感 - 多种情感女声','zhitian_emo',15);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (20,'小云 - 标准女声','xiaoyun',16);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (21,'小刚 - 标准男声','xiaogang',17);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (22,'若兮 - 温柔女声','ruoxi',18);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (23,'思琪 - 温柔女声','siqi',19);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (24,'思佳 - 标准女声','sijia',20);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (25,'思诚 - 标准男声','sicheng',21);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (26,'艾琪 - 温柔女声','aiqi',22);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (27,'艾佳 - 标准女声','aijia',23);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (28,'艾诚 - 标准男声','aicheng',24);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (29,'艾达 - 标准男声','aida',25);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (30,'宁儿 - 标准女声','ninger',26);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (31,'瑞琳 - 标准女声','ruilin',27);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (32,'思悦 - 温柔女声','siyue',28);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (33,'艾雅 - 严厉女声','aiya',29);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (34,'艾美 - 甜美女声','aimei',30);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (35,'艾雨 - 自然女声','aiyu',31);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (36,'艾悦 - 温柔女声','aiyue',32);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (37,'艾婧 - 严厉女声','aijing',33);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (38,'小美 - 甜美女声','xiaomei',34);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (39,'艾娜 - 浙普女声','aina',35);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (40,'伊娜 - 浙普女声','yina',36);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (41,'思婧 - 严厉女声','sijing',37);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (42,'思彤 - 儿童音','sitong',38);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (43,'小北 - 萝莉女声','xiaobei',39);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (44,'艾彤 - 儿童音','aitong',40);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (45,'艾薇 - 萝莉女声','aiwei',41);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (46,'艾宝 - 萝莉女声','aibao',42);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (47,'Harry - 英音男声','harry',43);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (48,'Abby - 美音女声','abby',44);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (49,'Andy - 美音男声','andy',45);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (50,'Eric - 英音男声','eric',46);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (51,'Emily - 英音女声','emily',47);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (52,'Luna - 英音女声','luna',48);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (53,'Luca - 英音男声','luca',49);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (54,'Wendy - 英音女声','wendy',50);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (55,'William - 英音男声','william',51);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (56,'Olivia - 英音女声','olivia',52);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (57,'姗姗 - 粤语女声','shanshan',53);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (58,'艾媛 - 知心姐姐','aiyuan',54);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (59,'艾颖 - 软萌童声','aiying',55);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (60,'艾祥 - 磁性男声','aixiang',56);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (61,'艾墨 - 情感男声','aimo',57);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (62,'艾晔 - 青年男声','aiye',58);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (63,'艾婷 - 电台女声','aiting',59);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (64,'艾凡 - 情感女声','aifan',60);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (65,'Lydia - 英中双语女声','lydia',61);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (66,'小玥 - 四川话女声','chuangirl',62);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (67,'艾硕 - 自然男声','aishuo',63);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (68,'青青 - 中国台湾话女声','qingqing',64);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (69,'翠姐 - 东北话女声','cuijie',65);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (70,'小泽 - 湖南重口音男声','xiaoze',66);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (71,'艾楠 - 广告男声','ainan',67);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (72,'艾浩 - 资讯男声','aihao',68);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (73,'艾茗 - 诙谐男声','aiming',69);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (74,'艾笑 - 资讯女声','aixiao',70);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (75,'艾厨 - 舌尖男声','aichu',71);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (76,'艾倩 - 资讯女声','aiqian',72);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (77,'智香 - 日语女声','tomoka',73);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (78,'智也 - 日语男声','tomoya',74);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (79,'Annie - 美语女声','annie',75);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (80,'艾树 - 资讯男声','aishu',76);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (81,'艾茹 - 新闻女声','airu',77);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (82,'佳佳 - 粤语女声','jiajia',78);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (83,'Indah - 印尼语女声','indah',79);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (84,'桃子 - 粤语女声','taozi',80);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (85,'柜姐 - 亲切女声','guijie',81);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (86,'Stella - 知性女声','stella',82);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (87,'Stanley - 沉稳男声','stanley',83);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (88,'Kenny - 沉稳男声','kenny',84);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (89,'Rosa - 自然女声','rosa',85);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (90,'Farah - 马来语女声','farah',86);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (91,'马树 - 儿童剧男声','mashu',87);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (92,'知琪 - 温柔女声','zhiqi',88);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (93,'知厨 - 舌尖男声','zhichu',89);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (94,'小仙 - 亲切女声','xiaoxian',90);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (95,'悦儿 - 儿童剧女声','yuer',91);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (96,'猫小美 - 活力女声','maoxiaomei',92);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (97,'知祥 - 磁性男声','zhixiang',93);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (98,'知佳 - 标准女声','zhijia',94);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (99,'知楠 - 广告男声','zhinan',95);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (100,'知倩 - 资讯女声','zhiqian',96);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (101,'知茹 - 新闻女声','zhiru',97);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (102,'知德 - 新闻男声','zhide',98);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (103,'知飞 - 激昂解说','zhifei',99);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (104,'艾飞 - 激昂解说','aifei',100);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (105,'亚群 - 卖场广播','yaqun',101);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (106,'巧薇 - 卖场广播','qiaowei',102);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (107,'大虎 - 东北话男声','dahu',103);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (108,'ava - 美语女生','ava',104);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (109,'知伦 - 悬疑解说','zhilun',105);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (110,'艾伦 - 悬疑解说','ailun',106);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (111,'杰力豆 - 治愈童声','jielidou',107);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (112,'知薇 - 萝莉女声','zhiwei',108);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (113,'老铁 - 东北老铁','laotie',109);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (114,'老妹 - 吆喝女声','laomei',110);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (115,'艾侃 - 天津话男声','aikan',111);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (116,'Tala - 菲律宾语女声','tala',112);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (117,'知甜 - 甜美女声','zhitian',113);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (118,'知青 - 中国台湾话女生','zhiqing',114);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (119,'Tien - 越南语女声','tien',115);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (120,'Becca - 美语客服女声','becca',116);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (121,'Kyong - 韩语女声','Kyong',117);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (122,'masha - 俄语女声','masha',118);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (123,'camila - 西班牙语女声','camila',119);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (124,'perla - 意大利语女声','perla',120);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (125,'知猫 - 普通话女声','zhimao',121);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (126,'知媛 - 普通话女声','zhiyuan',122);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (127,'知雅 - 普通话女声','zhiya',123);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (128,'知悦 - 普通话女声','zhiyue',124);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (129,'知达 - 普通话男声','zhida',125);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (130,'知莎 - 普通话女声','zhistella',126);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (131,'Kelly - 香港粤语女声','kelly',127);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (132,'clara - 法语女声','clara',128);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (133,'hanna - 德语女声','hanna',129);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (134,'waan - 泰语女声','waan',130);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (135,'betty - 美式英文女声','betty',131);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (136,'beth - 美式英文女声','beth',132);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (137,'cindy - 美式英文女声','cindy',133);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (138,'donna - 美式英文女声','donna',134);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (139,'eva - 美式英文女声','eva',135);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (140,'brian - 美式英文男声','brian',136);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (141,'david - 美式英文男声','david',137);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (142,'abby_ecmix - 美式英文女声','abby_ecmix',138);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (143,'annie_ecmix - 美式英文女声','annie_ecmix',139);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (144,'andy_ecmix - 美式英文男声','andy_ecmix',140);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (145,'ava_ecmix - 美式英文女声','ava_ecmix',141);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (146,'betty_ecmix - 美式英文女声','betty_ecmix',142);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (147,'beth_ecmix - 美式英文女声','beth_ecmix',143);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (148,'brian_ecmix - 美式英文男声','brian_ecmix',144);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (149,'cindy_ecmix - 美式英文女声','cindy_ecmix',145);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (150,'cally_ecmix - 美式英文女声','cally_ecmix',146);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (151,'donna_ecmix - 美式英文女声','donna_ecmix',147);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (152,'david_ecmix - 美式英文男声','david_ecmix',148);
insert  into `cc_tts_aliyun`(`id`,`voice_name`,`voice_code`,`voice_enabled`) values (153,'eva_ecmix - 美式英文女声','eva_ecmix',149);


ALTER TABLE `sys_menu` ADD COLUMN menu_code VARCHAR(255) COMMENT '菜单编号（国际化用这个字段作为key）' AFTER menu_name;

UPDATE sys_menu SET menu_code = 'sysManage' WHERE menu_id = 1;
UPDATE sys_menu SET menu_code = 'sysMonitor' WHERE menu_id = 2;
UPDATE sys_menu SET menu_code = 'sysTools' WHERE menu_id = 3;
UPDATE sys_menu SET menu_code = 'userManage' WHERE menu_id = 100;
UPDATE sys_menu SET menu_code = 'roleManage' WHERE menu_id = 101;
UPDATE sys_menu SET menu_code = 'menuManage' WHERE menu_id = 102;
UPDATE sys_menu SET menu_code = 'deptManage' WHERE menu_id = 103;
UPDATE sys_menu SET menu_code = 'postManage' WHERE menu_id = 104;
UPDATE sys_menu SET menu_code = 'dictManage' WHERE menu_id = 105;
UPDATE sys_menu SET menu_code = 'configManage' WHERE menu_id = 106;
UPDATE sys_menu SET menu_code = 'noticeManage' WHERE menu_id = 107;
UPDATE sys_menu SET menu_code = 'logManage' WHERE menu_id = 108;
UPDATE sys_menu SET menu_code = 'onlineUser' WHERE menu_id = 109;
UPDATE sys_menu SET menu_code = 'jobManage' WHERE menu_id = 110;
UPDATE sys_menu SET menu_code = 'dataMonitor' WHERE menu_id = 111;
UPDATE sys_menu SET menu_code = 'serverManage' WHERE menu_id = 112;
UPDATE sys_menu SET menu_code = 'cacheMonitor' WHERE menu_id = 113;
UPDATE sys_menu SET menu_code = 'buildTool' WHERE menu_id = 114;
UPDATE sys_menu SET menu_code = 'genTool' WHERE menu_id = 115;
UPDATE sys_menu SET menu_code = 'swaggerTool' WHERE menu_id = 116;
UPDATE sys_menu SET menu_code = 'operLog' WHERE menu_id = 500;
UPDATE sys_menu SET menu_code = 'loginLog' WHERE menu_id = 501;
UPDATE sys_menu SET menu_code = 'userQuery' WHERE menu_id = 1000;
UPDATE sys_menu SET menu_code = 'userAdd' WHERE menu_id = 1001;
UPDATE sys_menu SET menu_code = 'userEdit' WHERE menu_id = 1002;
UPDATE sys_menu SET menu_code = 'userDel' WHERE menu_id = 1003;
UPDATE sys_menu SET menu_code = 'userExport' WHERE menu_id = 1004;
UPDATE sys_menu SET menu_code = 'userImport' WHERE menu_id = 1005;
UPDATE sys_menu SET menu_code = 'resetPass' WHERE menu_id = 1006;
UPDATE sys_menu SET menu_code = 'roleQuery' WHERE menu_id = 1007;
UPDATE sys_menu SET menu_code = 'roleAdd' WHERE menu_id = 1008;
UPDATE sys_menu SET menu_code = 'roleEdit' WHERE menu_id = 1009;
UPDATE sys_menu SET menu_code = 'roleDel' WHERE menu_id = 1010;
UPDATE sys_menu SET menu_code = 'roleExport' WHERE menu_id = 1011;
UPDATE sys_menu SET menu_code = 'menuQuery' WHERE menu_id = 1012;
UPDATE sys_menu SET menu_code = 'menuAdd' WHERE menu_id = 1013;
UPDATE sys_menu SET menu_code = 'menuEdit' WHERE menu_id = 1014;
UPDATE sys_menu SET menu_code = 'menuDel' WHERE menu_id = 1015;
UPDATE sys_menu SET menu_code = 'deptQuery' WHERE menu_id = 1016;
UPDATE sys_menu SET menu_code = 'deptAdd' WHERE menu_id = 1017;
UPDATE sys_menu SET menu_code = 'deptEdit' WHERE menu_id = 1018;
UPDATE sys_menu SET menu_code = 'deptDel' WHERE menu_id = 1019;
UPDATE sys_menu SET menu_code = 'postQuery' WHERE menu_id = 1020;
UPDATE sys_menu SET menu_code = 'postAdd' WHERE menu_id = 1021;
UPDATE sys_menu SET menu_code = 'postEdit' WHERE menu_id = 1022;
UPDATE sys_menu SET menu_code = 'postDel' WHERE menu_id = 1023;
UPDATE sys_menu SET menu_code = 'postExport' WHERE menu_id = 1024;
UPDATE sys_menu SET menu_code = 'dictQuery' WHERE menu_id = 1025;
UPDATE sys_menu SET menu_code = 'dictAdd' WHERE menu_id = 1026;
UPDATE sys_menu SET menu_code = 'dictEdit' WHERE menu_id = 1027;
UPDATE sys_menu SET menu_code = 'dictDel' WHERE menu_id = 1028;
UPDATE sys_menu SET menu_code = 'dictExport' WHERE menu_id = 1029;
UPDATE sys_menu SET menu_code = 'configQuery' WHERE menu_id = 1030;
UPDATE sys_menu SET menu_code = 'configAdd' WHERE menu_id = 1031;
UPDATE sys_menu SET menu_code = 'configEdit' WHERE menu_id = 1032;
UPDATE sys_menu SET menu_code = 'configDel' WHERE menu_id = 1033;
UPDATE sys_menu SET menu_code = 'configExport' WHERE menu_id = 1034;
UPDATE sys_menu SET menu_code = 'noticeQuery' WHERE menu_id = 1035;
UPDATE sys_menu SET menu_code = 'noticeAdd' WHERE menu_id = 1036;
UPDATE sys_menu SET menu_code = 'noticeEdit' WHERE menu_id = 1037;
UPDATE sys_menu SET menu_code = 'noticeDel' WHERE menu_id = 1038;
UPDATE sys_menu SET menu_code = 'opraQuery' WHERE menu_id = 1039;
UPDATE sys_menu SET menu_code = 'opraDel' WHERE menu_id = 1040;
UPDATE sys_menu SET menu_code = 'opraDetails' WHERE menu_id = 1041;
UPDATE sys_menu SET menu_code = 'opraExport' WHERE menu_id = 1042;
UPDATE sys_menu SET menu_code = 'loginLogQuery' WHERE menu_id = 1043;
UPDATE sys_menu SET menu_code = 'loginLogDel' WHERE menu_id = 1044;
UPDATE sys_menu SET menu_code = 'loginLogExport' WHERE menu_id = 1045;
UPDATE sys_menu SET menu_code = 'userUnlock' WHERE menu_id = 1046;
UPDATE sys_menu SET menu_code = 'onlineQuery' WHERE menu_id = 1047;
UPDATE sys_menu SET menu_code = 'batchOffline' WHERE menu_id = 1048;
UPDATE sys_menu SET menu_code = 'oneOffline' WHERE menu_id = 1049;
UPDATE sys_menu SET menu_code = 'jobQuery' WHERE menu_id = 1050;
UPDATE sys_menu SET menu_code = 'jobAdd' WHERE menu_id = 1051;
UPDATE sys_menu SET menu_code = 'jobEdit' WHERE menu_id = 1052;
UPDATE sys_menu SET menu_code = 'jobDel' WHERE menu_id = 1053;
UPDATE sys_menu SET menu_code = 'jobStatusEdit' WHERE menu_id = 1054;
UPDATE sys_menu SET menu_code = 'jobDetails' WHERE menu_id = 1055;
UPDATE sys_menu SET menu_code = 'jobExport' WHERE menu_id = 1056;
UPDATE sys_menu SET menu_code = 'genQuery' WHERE menu_id = 1057;
UPDATE sys_menu SET menu_code = 'genEdit' WHERE menu_id = 1058;
UPDATE sys_menu SET menu_code = 'genDel' WHERE menu_id = 1059;
UPDATE sys_menu SET menu_code = 'previewCode' WHERE menu_id = 1060;
UPDATE sys_menu SET menu_code = 'genCode' WHERE menu_id = 1061;
UPDATE sys_menu SET menu_code = 'callManage' WHERE menu_id = 2000;
UPDATE sys_menu SET menu_code = 'switchConf' WHERE menu_id = 2001;
UPDATE sys_menu SET menu_code = 'varConf' WHERE menu_id = 2002;
UPDATE sys_menu SET menu_code = 'xunfeiAsrConf' WHERE menu_id = 2003;
UPDATE sys_menu SET menu_code = 'aliAsrConf' WHERE menu_id = 2004;
UPDATE sys_menu SET menu_code = 'certWsspen' WHERE menu_id = 2005;
UPDATE sys_menu SET menu_code = 'extnum' WHERE menu_id = 2010;
UPDATE sys_menu SET menu_code = 'extnumAdd' WHERE menu_id = 2011;
UPDATE sys_menu SET menu_code = 'extnumEdit' WHERE menu_id = 2012;
UPDATE sys_menu SET menu_code = 'extnumInfo' WHERE menu_id = 2013;
UPDATE sys_menu SET menu_code = 'bizgroup' WHERE menu_id = 2020;
UPDATE sys_menu SET menu_code = 'bizgroupAdd' WHERE menu_id = 2021;
UPDATE sys_menu SET menu_code = 'bizgroupEdit' WHERE menu_id = 2022;
UPDATE sys_menu SET menu_code = 'bizgroupInfo' WHERE menu_id = 2023;
UPDATE sys_menu SET menu_code = 'catLogs' WHERE menu_id = 2030;
UPDATE sys_menu SET menu_code = 'extpower' WHERE menu_id = 2040;
UPDATE sys_menu SET menu_code = 'extpowerAdd' WHERE menu_id = 2041;
UPDATE sys_menu SET menu_code = 'extpowerEdit' WHERE menu_id = 2042;
UPDATE sys_menu SET menu_code = 'extpowerDel' WHERE menu_id = 2043;
UPDATE sys_menu SET menu_code = 'extpowerQuery' WHERE menu_id = 2044;
UPDATE sys_menu SET menu_code = 'profileConf' WHERE menu_id = 2050;
UPDATE sys_menu SET menu_code = 'profileConfAdd' WHERE menu_id = 2051;
UPDATE sys_menu SET menu_code = 'profileConfEdit' WHERE menu_id = 2052;
UPDATE sys_menu SET menu_code = 'profileConfStatus' WHERE menu_id = 2053;
UPDATE sys_menu SET menu_code = 'profileConfStart' WHERE menu_id = 2054;
UPDATE sys_menu SET menu_code = 'profileConfStop' WHERE menu_id = 2055;
UPDATE sys_menu SET menu_code = 'profileConfRestart' WHERE menu_id = 2056;
UPDATE sys_menu SET menu_code = 'profileConfInfo' WHERE menu_id = 2057;
UPDATE sys_menu SET menu_code = 'gateways' WHERE menu_id = 2060;
UPDATE sys_menu SET menu_code = 'gatewaysAdd' WHERE menu_id = 2061;
UPDATE sys_menu SET menu_code = 'gatewaysEdit' WHERE menu_id = 2062;
UPDATE sys_menu SET menu_code = 'gatewaysQuery' WHERE menu_id = 2063;
UPDATE sys_menu SET menu_code = 'outboundcdr' WHERE menu_id = 2070;
UPDATE sys_menu SET menu_code = 'outboundcdrListen' WHERE menu_id = 2071;
UPDATE sys_menu SET menu_code = 'outboundcdrDownload' WHERE menu_id = 2072;
UPDATE sys_menu SET menu_code = 'outboundcdrInfo' WHERE menu_id = 2073;
UPDATE sys_menu SET menu_code = 'inboundcdr' WHERE menu_id = 2080;
UPDATE sys_menu SET menu_code = 'inboundcdrListen' WHERE menu_id = 2081;
UPDATE sys_menu SET menu_code = 'inboundcdrDownload' WHERE menu_id = 2082;
UPDATE sys_menu SET menu_code = 'inboundcdrInfo' WHERE menu_id = 2083;
UPDATE sys_menu SET menu_code = 'agentMonitor' WHERE menu_id = 2090;
UPDATE sys_menu SET menu_code = 'agentMonitorListen' WHERE menu_id = 2091;
UPDATE sys_menu SET menu_code = 'inboundMonitor' WHERE menu_id = 2100;
UPDATE sys_menu SET menu_code = 'custInfo' WHERE menu_id = 2110;
UPDATE sys_menu SET menu_code = 'custInfoAdd' WHERE menu_id = 2111;
UPDATE sys_menu SET menu_code = 'custInfoEdit' WHERE menu_id = 2112;
UPDATE sys_menu SET menu_code = 'custInfoDel' WHERE menu_id = 2113;
UPDATE sys_menu SET menu_code = 'custInfoQuery' WHERE menu_id = 2114;
UPDATE sys_menu SET menu_code = 'asrengine' WHERE menu_id = 2120;
UPDATE sys_menu SET menu_code = 'params' WHERE menu_id = 2130;
UPDATE sys_menu SET menu_code = 'paramsAdd' WHERE menu_id = 2131;
UPDATE sys_menu SET menu_code = 'paramsEdit' WHERE menu_id = 2132;
UPDATE sys_menu SET menu_code = 'paramsDel' WHERE menu_id = 2133;
UPDATE sys_menu SET menu_code = 'paramsInfo' WHERE menu_id = 2134;
UPDATE sys_menu SET menu_code = 'AIAssistant' WHERE menu_id = 3000;
UPDATE sys_menu SET menu_code = 'faq' WHERE menu_id = 3010;
UPDATE sys_menu SET menu_code = 'faqAdd' WHERE menu_id = 3011;
UPDATE sys_menu SET menu_code = 'faqEdit' WHERE menu_id = 3012;
UPDATE sys_menu SET menu_code = 'faqDel' WHERE menu_id = 3013;
UPDATE sys_menu SET menu_code = 'faqImport' WHERE menu_id = 3014;
UPDATE sys_menu SET menu_code = 'faqExport' WHERE menu_id = 3015;
UPDATE sys_menu SET menu_code = 'faqPublish' WHERE menu_id = 3016;
UPDATE sys_menu SET menu_code = 'alittsconf' WHERE menu_id = 3017;
UPDATE sys_menu SET menu_code = 'ASRConf' WHERE menu_id = 3018;
UPDATE sys_menu SET menu_code = 'TTSConf' WHERE menu_id = 3019;
UPDATE sys_menu SET menu_code = 'funasrconf' WHERE menu_id = 3020;
UPDATE sys_menu SET menu_code = 'FreeswitchConf' WHERE menu_id = 3022;
UPDATE sys_menu SET menu_code = 'callTask' WHERE menu_id = 3030;
UPDATE sys_menu SET menu_code = 'callTaskAdd' WHERE menu_id = 3031;
UPDATE sys_menu SET menu_code = 'callTaskEdit' WHERE menu_id = 3032;
UPDATE sys_menu SET menu_code = 'callTaskQuery' WHERE menu_id = 3033;
UPDATE sys_menu SET menu_code = 'callTaskStart' WHERE menu_id = 3034;
UPDATE sys_menu SET menu_code = 'callTaskPause' WHERE menu_id = 3035;
UPDATE sys_menu SET menu_code = 'callListImport' WHERE menu_id = 3036;
UPDATE sys_menu SET menu_code = 'callPhone' WHERE menu_id = 3040;
UPDATE sys_menu SET menu_code = 'callPhoneQuery' WHERE menu_id = 3041;


-- 大模型底座菜单
INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3050','大模型配置','llmAccount','3000','4','/aicall/account','menuItem','C','0','1','aicall:account:view','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3051','大模型配置查询','llmAccountQuery','3050','1','#','','F','0','1','aicall:account:list','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3052','大模型配置新增','llmAccountAdd','3050','1','#','','F','0','1','aicall:account:add','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3053','大模型配置修改','llmAccountEdit','3050','1','#','','F','0','1','aicall:account:edit','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3054','大模型配置删除','llmAccountDel','3050','1','#','','F','0','1','aicall:account:del','#','admin',NOW()) ;



UPDATE `sys_menu` SET menu_name = 'AI外呼' WHERE menu_id = 3000;
UPDATE `sys_menu` SET visible = '1' WHERE menu_id = 3010;
UPDATE `sys_menu` SET visible = '1' WHERE parent_id = 3010;

ALTER TABLE cc_gateways ADD COLUMN purpose INT(2) DEFAULT 0 COMMENT '网关用途 0 dropped; 1 phonebar; 2 outbound tasks; 3. Unlimited';

-- 菜单 SQL
INSERT INTO sys_menu (menu_id, menu_name, menu_code, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('3060', '呼入配置', 'inboundllm', '3000', '5', '/aicall/inboundllm', 'C', '0', 'aicall:inboundllm:view', '#', 'admin', SYSDATE(), '', NULL, '呼入大模型配置菜单');

-- 按钮 SQL
INSERT INTO sys_menu (menu_id, menu_name, menu_code, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('3061','呼入大模型配置查询', 'inboundllmQuery', '3060', '1',  '#',  'F', '0', 'aicall:inboundllm:list',         '#', 'admin', SYSDATE(), '', NULL, '');

INSERT INTO sys_menu (menu_id, menu_name, menu_code, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('3062','呼入大模型配置新增', 'inboundllmAdd', '3060', '2',  '#',  'F', '0', 'aicall:inboundllm:add',          '#', 'admin', SYSDATE(), '', NULL, '');

INSERT INTO sys_menu (menu_id, menu_name, menu_code, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('3063','呼入大模型配置修改', 'inboundllmEdit', '3060', '3',  '#',  'F', '0', 'aicall:inboundllm:edit',         '#', 'admin', SYSDATE(), '', NULL, '');

INSERT INTO sys_menu (menu_id, menu_name, menu_code, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('3064','呼入大模型配置删除', 'inboundllmDel', '3060', '4',  '#',  'F', '0', 'aicall:inboundllm:remove',       '#', 'admin', SYSDATE(), '', NULL, '');


-- cc_inbound_llm_account
DROP TABLE IF EXISTS `cc_inbound_llm_account`;
CREATE TABLE `cc_inbound_llm_account` (
                                          `id` INT(8) NOT NULL AUTO_INCREMENT,
                                          `llm_account_id` INT(8) NOT NULL COMMENT 'llm or ai-agent account id.',
                                          `callee` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'callee number',
                                          PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;



-- cc_llm_agent_account
DROP TABLE IF EXISTS `cc_llm_agent_account`;
CREATE TABLE `cc_llm_agent_account` (
                                        `id` INT(8) NOT NULL AUTO_INCREMENT,
                                        `account_json` TEXT NOT NULL,
                                        `provider_class_name` VARCHAR(100) NOT NULL COMMENT 'Name of the implementation class.',
                                        `name` VARCHAR(50) NOT NULL COMMENT '别名',
                                        `account_entity` VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Entity class for storing account config info.',
                                        PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Conversation foundation:  configuration parameters for accessing large language models or ai agents.';


-- cc_llm_agent_provider
DROP TABLE IF EXISTS `cc_llm_agent_provider`;
CREATE TABLE `cc_llm_agent_provider` (
                                         `id` int(8) NOT NULL AUTO_INCREMENT,
                                         `provider_class_name` varchar(100) NOT NULL,
                                         `note` varchar(100) DEFAULT NULL,
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cc_llm_agent_provider` */

insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (1,'DeepSeekChat','对接deepseek chat模型');
insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (2,'ChatGpt4o','对接chatgpt4o-mini');
insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (3,'Coze','对接字节扣子智能体');
insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (4,'MaxKB','对接MaxKB');
insert  into `cc_llm_agent_provider`(`id`,`provider_class_name`,`note`) values (5,'Dify','对接Dify');


-- cc_params增加参数数据
INSERT INTO `cc_params` (`id`, `param_name`, `param_code`, `param_value`, `param_type`, `hide_value`)
VALUES('77', '群呼转人工坐席的场景下，是否开启预测外呼算法', 'outbound-enable-prediction-algorithm', 'true', 'batchcall', '0') ;

INSERT INTO `cc_params` (`id`, `param_name`, `param_code`, `param_value`, `param_type`, `hide_value`)
VALUES('78', '阿里云tts账号参数json', 'aliyun-tts-account-json', 'param_value', '{"access_key_id":"LT**********","app_key":"nb********Wr","sample_rate":"16000","voice_volume":"50","write_pcm_enable":"0","ws_conn_timeout_ms":"9000","access_key_secret":"1e*********","speech_rate":"5","voice_name":"aixia","server_url":"wss://nls-gateway-cn-beijing.aliyuncs.com/ws/v1","server_url_webapi":"https://nls-gateway.aliyuncs.com/stream/v1/tts"}', '1') ;

INSERT INTO `cc_params` (`id`, `param_name`, `param_code`, `param_value`, `param_type`, `hide_value`)
VALUES('79', '空号识别功能是否开启', 'empty-number-detection-enabled', 'true', 'batchcall', '0') ;

INSERT INTO `cc_params` (`id`, `param_name`, `param_code`, `param_value`, `param_type`, `hide_value`)
VALUES('80', '空号识别定义', 'empty-number-detection-config', '[{"key":"ASSISTANT","code":37,"cat":"语音助手","words":"留言,结束请挂机,语音信箱服务,语音助手,秘书,助理"},{"key":"NO_ANSWER","code":34,"cat":"无人接听","words":"无人接听,暂时无人"},{"key":"BUSY","code":31,"cat":"占线","words":"用户正忙,正在通话中,电话通话中,电话正在通话"},{"key":"EMPTY","code":33,"cat":"空号","words":"是空号,号码不存在"},{"key":"OFF","code":32,"cat":"关机","words":"用户已关机,电话已关机"},{"key":"STOP","code":35,"cat":"停机","words":"已停机,已暂停服务"},{"key":"NETWORK_BUSY","code":36,"cat":"网络忙","words":"网络忙"},{"key":"NOT_AVAILABLE","code":38,"cat":"无法接通","words":"暂时无法接通,不在服务区"},{"key":"REMINDER","code":30,"cat":"来电提醒","words":"来电提醒,来电信息将以短信,短信提醒,短信通知,短信的形式,启动通信助理"},{"key":"LIMIT","code":39,"cat":"呼入限制","words":"已呼入限制,已互祝限制"}]', 'sys', '0') ;




