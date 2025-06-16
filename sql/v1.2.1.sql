-- 大模型底座菜单
INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3050','大模型配置','llmAccount','2000','16','/aicall/account','menuItem','C','0','1','aicall:account:view','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3051','大模型配置查询','llmAccountQuery','3050','1','#','','F','0','1','aicall:account:list','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3052','大模型配置新增','llmAccountAdd','3050','1','#','','F','0','1','aicall:account:add','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3053','大模型配置修改','llmAccountEdit','3050','1','#','','F','0','1','aicall:account:edit','#','admin',NOW()) ;

INSERT INTO `sys_menu` (`menu_id`,`menu_name`,`menu_code`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`)
VALUES('3054','大模型配置删除','llmAccountDel','3050','1','#','','F','0','1','aicall:account:del','#','admin',NOW()) ;

