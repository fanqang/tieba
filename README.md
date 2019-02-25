## 该项目是继java基础之后使用SSM三大框架完成开发并且严格按照MVC设计模式，通过这个项目熟悉了SSM框架的业务流程并且高效率的实现各种业务操作。本系统是我仿百度贴吧的部分功能，贴吧是以兴趣为主题聚集志同道合朋友的互动平台，本系统分为两个模块即贴吧系统和后台管理系统。页面同样使用了大量的Ajax验证操作并且静态页面也使用了大量的EL/JSTL表达式,注册模块主要就是注册时的用户名不能重复,登录模块登录时用Session域判断该用户是否登录，有则拦截并提示，没有继续验证登录密码是否和数据库密码一致，首页模块查询贴吧表所有贴吧,贴吧详情模块根据首页模块的贴吧id查询详细信息，发帖模块每次发布一条帖子则像帖子表插入一条信息，帖子详情模块则根据用户点击的帖子携带的帖子id编号查询出，评论也是一样的，重点说下子评论的实现，我是这样做的,我在子评论表的字段中添加了一个回复的字段，默认的值为0即是父评论的子评论，如果回复了子评论则在该子评论表字段添加回复子评论的id编号，前台静态页面则根据该字段用EL/JSTL表达式判断是否属于子评论的回复评论，后台管理模块就是根据id编号进行增删改查，并且数据库的表设置了外键约束，如果删除评论或者帖子或者用户那么旗下所有与之关联的数据统统都将被级联删除，每个大模块都应用了分页管理。
   
## 项目截图如下
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img1.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img2.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img3.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img4.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img5.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img6.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img7.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img8.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img9.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img10.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img11.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img12.png"/>
<img src="https://github.com/fanqang/tieba/blob/master/%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE/img13.png"/>

