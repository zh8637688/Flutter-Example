# zhihu_daily

Flutter版知乎日报

## 页面截图

### Splash 启动白屏优化对比
<img src="https://github.com/zh8637688/Flutter-Practise/blob/master/screenshot/baiping.gif?raw=true" width = "180" height = "320" alt="启动白屏" align=center />  <img src="https://github.com/zh8637688/Flutter-Practise/blob/master/screenshot/baiping_opt.gif?raw=true" width = "180" height = "320" alt="启动白屏优化" align=center />   

* 启动白屏
* [Canvas绘制](https://flutter.io/flutter-for-android/#how-do-i-use-a-canvas-to-drawpaint)；
* 补间动画，[Animation](https://flutter.io/animations/#tween-animation)；
* 页面导航，[Navigator](https://docs.flutter.io/flutter/widgets/Navigator-class.html)

### Drawer
<img src="https://github.com/zh8637688/Flutter-Practise/blob/master/screenshot/zhihu-drawer.png?raw=true" width = "180" height = "320" alt="Drawer" align=center />

* [Drawer](https://docs.flutter.io/flutter/material/Drawer-class.html)

### 首页
<img src="https://github.com/zh8637688/Flutter-Practise/blob/master/screenshot/zhihu-home.png?raw=true" width = "180" height = "320" alt="首页" align=center />

* Banner焦点图，[PageView](https://docs.flutter.io/flutter/widgets/PageView-class.html)，[实例](https://github.com/zh8637688/Flutter-Practise/blob/master/zhihu_daily/lib/widgets/homeBanner.dart) 
  - 循环播放，两种方法：1，itemCount最大值；2.首尾各增加一个虚拟item占位
  - 预加载，目前PageView只有在下一个Item出现前才会去加载这个Item，所以暂时无法预加载next item
* 下拉刷新，[RefreshIndicator](https://docs.flutter.io/flutter/material/RefreshIndicator-class.html)，[实例](https://github.com/zh8637688/Flutter-Practise/blob/master/zhihu_daily/lib/fragment/homeFragment.dart#L46)
* 上拉加载，ListView & ScrollController，[实例](https://github.com/zh8637688/Flutter-Practise/blob/master/zhihu_daily/lib/fragment/homeFragment.dart#L66)

### 详情
<img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/zhihu-detail.png?raw=true" width = "180" height = "320" alt="detail" align=center />

* WebView，Flutter官方并没有对 WebView 提供支持，所以 WebView 使用的第三方插件[flutter_webview_plugin](https://pub.dartlang.org/packages/flutter_webview_plugin#-example-tab-)。**该插件是基于原生 WebView 进行开发，所以无法与 Flutter 的控件进行整合，只能在新页面中使用。**

### 夜间模式
<img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/zhihu-menu.png?raw=true" width = "180" height = "320" alt="menu" align=center />  <img src="https://github.com/zh8637688/Flutter-Example/blob/master/screenshot/zhihu-dark.png?raw=true" width = "180" height = "320" alt="dark" align=center />

* showDialog，自定义 Dialog
* 通过配置 Theme 实现换肤效果，[链接](https://proandroiddev.com/how-to-dynamically-change-the-theme-in-flutter-698bd022d0f0)
