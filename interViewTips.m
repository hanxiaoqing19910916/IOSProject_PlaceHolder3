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


键盘鼠标事件：









http状态码请求头，行，体，响应头，行，体。    https ipv4/ipv6等知识点

线程锁























