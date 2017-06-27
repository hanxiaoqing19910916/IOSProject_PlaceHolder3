tcp/ip
应用层：
传输层：
网络层:
数据链路层：
osi ：
应用层
表示层
会话层
传输层
网络层
物理层

最大tcp连接为客户端ip数×客户端port数，对IPV4，不考虑ip地址分类等因素，最大tcp连接数约为2的32次方（ip数）×2的16次方（port数），也就是server端单机最大tcp连接数约为2的48次方

socket的引入是为了解决不同计算机间进程间通信的问题
socket与进程间的关系:socket   用来让一个进程和其他的进程互通信息(IPC)，而Socket接口是TCP/IP网络的API接口函数。





一:view事件处理
1.发生事件的时候，会把事件加入到由UIApplication对象管理的队列里面
2.UIApplication会取出最前的事件分发给主窗口keywindow
keywindow找合适的view
找到view之后调用touchs/以及keydown/mouseDown方法

如何找到最合适的view？
1.自己能不能接收事件？不能，传递到次结束
2.触摸点在不在自己身上？不在，传递到次结束
3.从后往前遍历子控件，重复前面的两个步骤

SDWebImage:
重要子类：
1.SDWebImageDownloaderOperation:
具体每个下载任务操作：通过initWithRequest:inSession:options:progress:completed:cancelled:
一个图片下载任务对应一个SDWebImageDownloaderOperation

2.SDWebImageDownloader：（单例）
下载器：控制多个下载任务的开始，挂起，取消
维持和管理所有下载任务Operation所在的队列（配置最大并发下载数，获取当前下载数量等。）
包括把NSURLSessionDataDelegate一些代理映射回SDWebImageDownloaderOperation里面，（感觉有点问题）

额外tips：
//为了保证线程安全，所有增改回调集合URLCallbacks的操作使用dispatch_barrier_sync放入队列barrierQueue中，而查询URLCallbakcs的操作只需使用dispatch_sync放入队列barrierQueue中
//dispatch_barrier_sync和dispatch_barrier_async的共同点：
//1、都会等待在它前面插入队列的任务先执行完
//2、都会等待他们自己的任务执行完再执行后面的任务
//
//dispatch_barrier_sync和dispatch_barrier_async的不同点：
//任务插入queue时，dispatch_barrier_sync要等待自己任务结束后才会继续执行后面的任务
//而dispatch_barrier_async将自己的任务插入到queue之后，不会等待自己的任务结束，它会继续把后面的任务插入到queue
//dispatch_barrier_async的不等待（异步）特性体现在将任务插入队列的过程，它的等待特性体现在任务真正执行的过程
//dispatch_main_sync_safe(block) 判断[NSThread isMainThread]==yes直接调用block
//不是yes 通过dispatch_sync(dispatch_get_main_queue(), block);回到主线程调用block

3.SDWebImageManager （单例）
管理整个下载，缓存机制，图片解码，以及最后所有的一些回调block。


HXRefresh：
HXRefreshComponent 基类：定义 开始/结束刷新 摆放子控件方法 回调以及状态定义 等等方法
核心机制：
NSScrollView分类动态绑定一个HXRefreshHeader HXRefreshFooter属性
然后通过在NSScrollView的管理内容的clipview里面加上header/footer
通过控制clipview contentInsets 把内容view 往上或者下挤压，从而露出header/footer


runtime：
动态类型：程序直到执行时才能确定所属的类。
动态绑定：程序直到执行时才能确定实际要调用的方法。
动态加载：根据需求加载所需要的资源

Runtime消息机制

首先通过obj的isa指针找到obj对应的class。

首先检测这个 selector 是不是要忽略。比如有了ARC就不理会 retain，release 这些函数。
检测这个 selector 的 target 是不是 nil，Objc 允许我们对一个 nil 对象执行任何方法不会 Crash，因为运行时会被忽略掉。
如果上面两步都通过了，那么就开始查找这个类的实现 IMP，

在Class中先去cache中 通过SEL查找对应函数method，找到就执行对应的实现。

若cache中未找到，再去methodList中查找，找到就执行对应的实现。

若methodlist中未找到，则取superClass中查找（重复执行以上两个步骤），直到找到最根的类为止。
若任何一部能找到，则将method加 入到cache中，以方便下次查找，并通过method中的函数指针跳转到对应的函数中去执行。
如果以上都不能找到，则会开始进行消息转发

消息转发
1.动态方法解析：向当前类发送 resolveInstanceMethod: 信号，检查是否动态向该类添加了方法。（迷茫请搜索：@dynamic）
2.快速消息转发：检查该类是否实现了 forwardingTargetForSelector: 方法，若实现了则调用这个方法。若该方法返回值对象非nil或非self，则向该返回对象重新发送消息。
3.标准消息转发：runtime发送methodSignatureForSelector:消息获取Selector对应的方法签名。返回值非空则通过forwardInvocation:转发消息，返回值为空则向当前对象发送doesNotRecognizeSelector:消息，程序崩溃退出

在一个函数找不到时，OC提供了三种方式去补救：
1、调用resolveInstanceMethod给个机会让类添加这个实现这个函数
2、调用forwardingTargetForSelector让别的对象去执行这个函数
3、调用forwardInvocation（函数执行器）灵活的将目标函数以其他形式执行。 如果都不中，调用doesNotRecognizeSelector抛出异常。

KVC原理：
KVC运用了一个isa-swizzling类型混合指针机制通过isa-swizzling，来实现其内部查找定位的。isa指针，如其名称所指，（就是is a kind of的意思），指向维护分发表的对象的类。该分发表实际上包含了指向实现类中的方法的指针，和其它数据。

[dic setVaule:@"zhangsan" forKey:@"name"];

当运行的时候就会被编译成：
SEL sel = sel_get_uid("setValue:forKey:");
IMP method = objc_msg_lookup(dic->isa,sel);
method(dic,sel,@"zhangsan",@"name");

其中，sel_get_uid函数是通过方法名得到一个方法选择器。
objc_msg_lookup:如果我们想用OC运行函数得到一个IMP，就可以使用objc_msg_lookup函数 。
这样KVC内部实现就可以这样描述了：

一个对象在调用setValue的时候，
1、根据方法名找到运行方法的时候所需要的环境参数。
2、他会从自己isa指针结合环境参数，找到具体的方法实现接口。
3、再直接查找得到的具体的方法实现。


KVO原理：
系统就会在运行期动态地创建该类的一个派生类，在这个派生类中重写基类中任何被观察属性的 setter 方法。
重写了 class 方法以“欺骗”外部调用者它就是起初的那个类。然后系统将这个对象的 isa 指针指向这个新诞生的派生类


键盘鼠标事件：



http状态码请求行，头，体，响应行，头，体。
200 - 服务器成功返回数据
304 - 客户端缓存
400 - 请求限制
404 - 链接网页或者数据不存在
500 - 服务器内部错误
503 - 服务器出错
、、、、、、、、、、、、、、、、、、、、、、、、
请求行包括：
请求method ：POST/GET
资源地址：/sample.jsp
协议版本：HTTP/1.1

请求头大概包括：
content-type :资源类型
cookie：
Connection:Keep-Alive
Host:localhostUser-Agent:Mozila/4.0(compatible:MSIE5.01:Windows NT5.0)
content-Length：数据长度

请求体 就是具体的数据
、、、、、、、、、、、、、、、、、、、、、、、、

响应行包括
协议版本：HTTP/1.1   状态码400  描述：bad request

响应头大概包括：
content-type :资源类型
content-Length：数据长度
Connection: close
Server:
cache-control:

响应体 就是具体的数据
、、、、、、、、、、、、、、、、、、、、、、、、



https





ipv4/ipv6等知识点

线程锁

runloop



字典的工作原理 ？怎100w个中是怎么快速去取value？

Block和函数指针的区别？





















