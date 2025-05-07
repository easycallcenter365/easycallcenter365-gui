# easycallcenter365

![easycallcenter365](logo.jpg)

基于FreeSWITCH和大模型的智能电话客服系统。 当前项目是 `easycallcenter365` 的web管理界面。

### 功能列表

* easycallcenter365 的参数在线配置
* 电话工具条
* FreeSWITCH在线配置
* 分机管理
* 日志在线监控
* 语音识别配置
* 语音合成配置
* 通话记录查询

### 系统截图

![系统截图](webgui.png)


### 技术交流 && 商业咨询

bug反馈或者咨询问题请在gitee/github上，新建 Issue，并贴上日志。

![联系方式](wetchat.png)
 

### 编译指南

#### 使用maven导入`freeswitch-esl`库

mvn install:install-file -Dfile=thirdparty\freeswitch-esl-1.3.release.jar -DgroupId=link.thingscloud -DartifactId=freeswitch-esl  -Dversion=1.3.release  -Dpackaging=jar
   
   
#### 设置数据库参数
 
修改 ruoyi-admin\src\main\resources\application-dev.yml, 这里它和 `easycallcenter365` 项目使用的是同一个数据库;

```txt
	url: jdbc:mysql://easycallcenter365:3306/easycallcenter365?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
	username: root
	password: 123456
```


#### 编译

   执行源代码根目录下的 bin\package.bat 脚本，编译完成后，jar包位于 ruoyi-admin\target 目录下，名字是 easycallcenter365-gui.jar 。
   
#### 部署

部署参考： https://gitee.com/easycallcenter365/easycallcenter365/blob/master/Deploy.txt   
   
   
   