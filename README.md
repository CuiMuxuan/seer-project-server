## 简介
**本项目是赛尔计划攻略项目网服务端的开源储存库，可独立使用**

若有疑问则提出issue等待他人作答或前往[作者B站](https://space.bilibili.com/589465087)进行付费答疑，作者原则上不解决任何问题。

项目使用`Java21`与`Spring3`，接口文档使用`springdoc`结合swagger3，ORM框架使用`mybatis-flex`，缓存使用`redis`实现。

## 启动项目
> 提前准备MySQL、redis、maven环境。

运行seer_project.sql文件以初始化数据。

在src/main/resources/application.yml文件中根据注释提示补充项目配置文件。

使用maven加载pom.xml文件以加载依赖项。

启动src/main/java/cn/colorcollision/seerprojectserver/SeerProjectServerApplication.java以运行程序。

建议使用IDEA启动与调试项目。
