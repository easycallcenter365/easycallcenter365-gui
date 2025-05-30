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
VALUES('3030','外呼任务管理','2000','15','/aicall/callTask','menuItem','C','0','1','aicall:callTask:view','#','admin',NOW()) ;

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
VALUES('3040','AI外呼记录','2000','16','/aicall/callPhone','menuItem','C','0','1','aicall:callPhone:view','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3041','AI外呼记录查询','3030','1','#','','F','0','1','aicall:callPhone:list','#','admin',NOW()) ;





