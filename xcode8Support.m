一.Xcode8 支持ios7的方法

首先我们要找到Xcode是通过什么来兼容iOS版本的，请打开以下路径：
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport
在文件夹中我们能够看到Xcode支持的iOS版本，从8.0开始，唯独没有8.0以下的，
所以我们第一步要做的就是把需要支持的iOS版本的配置包放进来真机配置包下载，下载下来后拖进去。

接下来需要配置Xcode，打开以下路径：
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk
在这里我们要改点东西，但是在这个文件夹里的东西是锁定的，首先右键‘空白部分’，点击显示简介，滑动到最下面，点击小锁打开权限，需要输入管理员密码，接着把所有的权限改为读写，第一步完成，接下来，右键SDKSettings.plist文件夹，和上面同样的操作，打开读写权限，然后双击打开SDKSettings.plist文件，

第二种方案：
xcode8支持ios8以下真机测试方法:
1.打开老版本xcode 显示包内容-Contents-Developer-Platforms-iPhoneOS.platform-DeviceSupport 把里边 6.0 6.1 7.0 7.1 的文件夹粘贴到xcode8 对应的文件夹内
2.xcode 显示包内容-Contents-Developer-Platforms-iPhoneOS.platform-Developer-SDKs-iPhoneOS.sdk-SDKSettings.plist 文件
下DefaultProperties - DEPLOYMENT_TARGET_SUGGESTE... 该数组中添加 6.0 6.1 7.0 7.1 对应的测试版本,

(注意:如果你的文件是只读模式的,那么是不能修改的,你需要把SDKSettings.plist 文件改成读写模式 所在文件夹以及上级文件夹也需要改成读写模式，右键显示简介最下面的权限管理)
这个版本排序一定要是从小到大,直接把小的添加到下面是不管用的,必须把小的拖到最上边.这个时候退出你的Xcode,然后重新启动,你就会发现ios8.0以下的真机 也可以正常测试了



二.代码及Api注意
1.UIWebView的代理方法：
**注意要删除NSError前面的 nullable，否则报错。
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self hideHud];
}

2.之前两个汉字占用24宽度,现在占用27了,导致部分UI可能需要重新适配;
或者判断下当前系统版本,如果>=10.0,就让需要适配的控件调用 sizetofit  方法.

3.代码注释不能用的解决办法:
这个是因为苹果解决xcode ghost，把插件屏蔽了。
解决方法
打开终端，命令运行： sudo /usr/libexec/xpccachectl
然后必须重启电脑后生效

注意：Xcode8内置了开启注释的功能，位置在这里
Editor ->Structure -> AddDoucumentation



4.MJRefresh iOS10的系统上每次下拉刷新后没办法完全恢复Normal 状态  Y轴距离上总是相差20左右...(楼主个人也使用的MJ,表示暂时没有发现这个问题)
解决方案 http://www.cnblogs.com/dev1024/p/5889865.html

5.ItunesConnect上传遇到问题，ERROR ITMS-90682: "Invalid Bundle. The asset catalog at 'Payload/ElitePlus.app/Assets.car' can't contain 16-bit or P3 assets if the app is targeting iOS releases earlier than iOS 9.3."   解决方法: http://www.cnblogs.com/zyonbao/p/5872943.html     http://www.jianshu.com/p/b13e1e441116

6.iOS 10 因苹果健康导致闪退 crash
Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'NSHealthUpdateUsageDescription must be set in the app's Info.plist in order to request write authorization.'
原文链接：http://www.jianshu.com/p/545bd1bf5a23


7.iOS10相册相机闪退bug
http://www.jianshu.com/p/5085430b029f

8.新增了CAAnimationDelegate  ,之前使用CAAnimation的文件需要强制添加代理


三.更新Xcode8之后，新建立工程，都会打印一堆莫名其妙看不懂的Log.

屏蔽的方法如下:
Xcode8里边 Edit Scheme-> Run -> Arguments, 或者用快捷键打开：ctrl+shift+<,在Environment Variables里边添加
OS_ACTIVITY_MODE ＝ Disable




四、权限以及相关设置

注意，添加的时候，末尾不要有空格
我们需要打开info.plist文件添加相应权限的说明，否则程序在iOS10上会出现崩溃。

麦克风权限：Privacy - Microphone Usage Description 是否允许此App使用你的麦克风？
相机权限： Privacy - Camera Usage Description 是否允许此App使用你的相机？
相册权限： Privacy - Photo Library Usage Description 是否允许此App访问你的媒体资料库？通讯录权限： Privacy - Contacts Usage Description 是否允许此App访问你的通讯录？
蓝牙权限：Privacy - Bluetooth Peripheral Usage Description 是否许允此App使用蓝牙？

语音转文字权限：Privacy - Speech Recognition Usage Description 是否允许此App使用语音识别？
日历权限：Privacy - Calendars Usage Description 是否允许此App使用日历？

定位权限：Privacy - Location When In Use Usage Description 我们需要通过您的地理位置信息获取您周边的相关数据
定位权限: Privacy - Location Always Usage Description 我们需要通过您的地理位置信息获取您周边的相关数据
定位的需要这么写，防止上架被拒。


论坛持续更新地址：
http://www.cocoachina.com/bbs/read.php?tid-1696016.html
