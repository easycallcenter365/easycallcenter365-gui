-- 大模型底座菜单
INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3050','大模型配置','llmAccount','3000','80','/aicall/account','menuItem','C','0','1','aicall:account:view','#','admin',NOW()) ;

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

ALTER TABLE cc_gateways ADD COLUMN purpose INT(2) DEFAULT 0 COMMENT '网关用途 0 dropped; 1 phonebar; 2 outbound tasks; 3. Unlimited'
