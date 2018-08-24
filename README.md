# Flutter-Example
Flutter是Google推出的一款移动端跨平台UI开发框架。  

不同于React-Native、Weex等跨平台框架，Flutter具有以下的特性：
1. Flutter抛弃了桥接原生控件的方案，而是通过平台提供的Canvas自行绘制所有控件；
2. Flutter使用Dart作为编程语言，Dart语言的AOT特性使得Flutter应用代码能够被预编译成本地代码。 

这些特性让Flutter能够更加流畅地运行在各个移动平台中。

Flutter即将发布第一个Release版本，这里记录一下Flutter的学习过程及Flutter相关的资料。

### Flutter官网
[https://flutter.io/](https://flutter.io/)

### Flutter中文网站
[https://flutter-io.cn/](https://flutter-io.cn/)  
[Flutter中文网](https://flutterchina.club/)  
[Flutter中文开发者论坛](http://flutter-dev.cn/)

### FlutterStudio，一个在线的Flutter页面构建工具
[https://flutterstudio.app/](https://flutterstudio.app/)  
<img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/flutterstudio.png?raw=true" width = "406" height = "224" alt="FlutterStudio" align=center />

### Flutter填坑
* **[Android应用启动白屏](https://juejin.im/post/5b443975f265da0f6825b56c)**  
* **Flutter 中关于 WebView 的[讨论](https://github.com/flutter/flutter/issues/730)**，目前 Flutter 自身还不支持 WebView，可通过[插件](https://pub.dartlang.org/packages/flutter_webview_plugin)使用 native 的 WebView。（native webview 会覆盖在 flutter 渲染层之上，导致后续打开的页面被遮挡）

<br />

## [知乎日报](https://github.com/zh8637688/Flutter-Practise/tree/master/zhihu_daily)
<img src="https://github.com/zh8637688/Flutter-Practise/blob/master/screenshot/zhihu-splash.gif?raw=true" width = "180" height = "320" alt="Splash" align=center />  <img src="https://github.com/zh8637688/Flutter-Practise/blob/master/screenshot/zhihu-home.png?raw=true" width = "180" height = "320" alt="Home" align=center />  <img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/zhihu-detail.png?raw=true" width = "180" height = "320" alt="detail" align=center />

<img src="https://github.com/zh8637688/Flutter-Practise/blob/master/screenshot/zhihu-drawer.png?raw=true" width = "180" height = "320" alt="Drawer" align=center />  <img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/zhihu-login.png?raw=true" width = "180" height = "320" alt="Login" align=center />  <img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/zhihu-collection.png?raw=true" width = "180" height = "320" alt="Collection" align=center />

<img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/zhihu-menu.png?raw=true" width = "180" height = "320" alt="menu" align=center />  <img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/zhihu-dark.png?raw=true" width = "180" height = "320" alt="dark" align=center />

### Future
* Route
  * 支持设置统一的页面跳转动画；
  * 支持带参数的命名路由，``Navigator.of(context).pushNamed(pagePath + '?key=value')``；
  * 支持路由拦截，``RouteInterceptor``；

## [Flutter 2048](https://github.com/zh8637688/Flutter-Practise/tree/master/flutter2048/)
<img src="https://github.com/zh8637688/Flutter-Practise/blob/master/screenshot/2048.png?raw=true" width = "270" height = "480" alt="Flutter 2048" align=center />  
