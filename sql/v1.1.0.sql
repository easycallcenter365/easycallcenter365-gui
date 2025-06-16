DROP TABLE IF EXISTS `cc_call_task`;
CREATE TABLE `cc_call_task` (
                                `batch_id` INT(11) NOT NULL AUTO_INCREMENT,
                                `group_id` VARCHAR(256) NOT NULL DEFAULT '1' COMMENT '外呼任务的业务组 ',
                                `batch_name` VARCHAR(50) NOT NULL DEFAULT '外呼任务名称',
                                `ifcall` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT '是否启动任务, 1 启动， 0 停止',
                                `rate` DOUBLE NOT NULL DEFAULT '5' COMMENT '外呼速率',
                                `thread_num` INT(11) NOT NULL DEFAULT '30' COMMENT '当前任务最大可用外线数',
                                `createtime` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '任务创建时间',
                                `executing` INT(11) NOT NULL DEFAULT '0' COMMENT '任务是否正在执行;',
                                `stop_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '任务停止时间',
                                `userid` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '任务创建者用户id',
                                `phonenum_buffer` INT(11) NOT NULL DEFAULT '10000' COMMENT '号码缓存池大小; 标记为删除，代码已经不在引用该字段。',
                                `batchcall_wait_time` INT(11) NOT NULL DEFAULT '5000' COMMENT '一批数据外呼后等待时间。标记为删除，代码已经不在引用该字段。',
                                `gateway_id` INT(11) NOT NULL COMMENT '使用哪条线路外呼',
                                `voice_code` VARCHAR(255) DEFAULT NULL COMMENT '音色',
                                `voice_source` VARCHAR(255) DEFAULT NULL COMMENT '音源',
                                PRIMARY KEY (`batch_id`)
) ENGINE=INNODB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='外呼任务表';


DROP TABLE IF EXISTS `cc_call_phone`;
CREATE TABLE `cc_call_phone` (
                                 `id` VARCHAR(32) NOT NULL,
                                 `group_id` VARCHAR(32) DEFAULT NULL COMMENT '业务组',
                                 `batch_id` INT(11) NOT NULL COMMENT '任务批次id',
                                 `telephone` VARCHAR(50) NOT NULL,
                                 `createtime` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '任务创建时间',
                                 `callstatus` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT '0  未拨打; 1   已经进入呼叫队列;  2   正在呼叫（进行中）;  3   未接通（状态： 客户正在通话中;   关机 ；  空号;  无人接听;   停机， ）;  4   已接通（拆分成接通后我方挂断，接通后对方挂断）; 5   呼损（未触发、未弹屏、仅弹屏、己介入）; 6   成功转接座席或者AI（只针对人机耦合）;  7线路故障;   [ 3、4、5  是统计大类， 实际写入到数据表的值是 后面的大数字 ]     31;  客户正在通话中;  32 关机;  33 空号;  34 无人接听; 35 停机。 41 拆分成接通后我方挂断;  42 接通后对方挂断 。 51 未触发（未到达弹屏节点）; 52 未弹屏（到达弹屏节点，没有弹屏出来） ;   53 仅弹屏（仅弹屏给座席但座席未介入通话，包括呼损）;   54 己介入（弹屏给到座席座席介入通话）',
                                 `callout_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '外呼时间',
                                 `callcount` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT '呼叫次数',
                                 `call_end_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '呼叫结束时间',
                                 `time_len` INT(11) NOT NULL DEFAULT '0' COMMENT '通话时长; 秒;',
                                 `valid_time_len` INT(11) NOT NULL DEFAULT '0' COMMENT '有效通话时长; 秒',
                                 `uuid` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '通话唯一标志',
                                 `uuid_robot` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '机器人接听端的通话唯一标识; ',
                                 `connected_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '通话接通时间',
                                 `hangup_cause` VARCHAR(50) NOT NULL DEFAULT 'Normal Clearing' COMMENT '挂机原因',
                                 `queue_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '加入转人工排队的时间; ',
                                 `answered_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '电话应答时间',
                                 `dialogue` TEXT COMMENT '对话内容',
                                 `wavfile` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '全程通话录音文件名',
                                 `record_server_url` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '录音文件路径前缀',
                                 `biz_json` VARCHAR(5000) NOT NULL DEFAULT '' COMMENT '业务json数据',
                                 `ringing_file_flag` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT '振铃文件是否写入了磁盘; 0 否 1是',
                                 `ringing_wav_file` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '振铃文件路径;',
                                 `ringing_file_processed` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT '振铃文件是否已经送asr识别; 0 否 1 是',
                                 `asr_product` INT(11) NOT NULL DEFAULT '0' COMMENT 'asr引擎;  0 没有获取到asr通道;  1 阿里; 2 思必驰 3 百度',
                                 `who_hangup` INT(11) NOT NULL DEFAULT '1' COMMENT '1客户主动挂断; 2机器人主动挂断;',
                                 `dialogue_count` INT(11) DEFAULT '0' COMMENT '交互轮次（一问一答算一轮交互）',
                                 `gateway_id` INT(11) DEFAULT NULL COMMENT '使用哪条线路外呼',
                                 `voice_code` VARCHAR(255) DEFAULT NULL COMMENT '音色',
                                 `voice_source` VARCHAR(255) DEFAULT NULL COMMENT '音源',
                                 `record_path` VARCHAR(255) DEFAULT NULL COMMENT '话术录音文件根路径',
                                 PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='外呼号码表';



-- 任务管理菜单
INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3030','外呼任务管理','3000','60','/aicall/callTask','menuItem','C','0','1','aicall:callTask:view','#','admin',NOW()) ;

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
VALUES('3040','AI外呼记录','3000','70','/aicall/callPhone','menuItem','C','0','1','aicall:callPhone:view','#','admin',NOW()) ;

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



