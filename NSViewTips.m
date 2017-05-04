当app启动的时候
View：
先调用window最上层的view的updateConstraints方法 再调用他们父view的updateConstraints方法

例如BaseVcView有两个子view: LeftView、RightView
会先调用LeftView的updateConstraints和RightView的updateConstraints，然后再调用BaseVcView的updateConstraints

然后layout相关方法开始调用
从父view开始，比如先调用BaseVcView的layout，然后依次调用 LeftView、RightView的layout方法


最后是drawRect相关方法开始调用
从父view开始，比如先调用BaseVcView的drawRect，然后依次调用 LeftView、RightView的drawRect方法

注意一点：如果父view是非layer backed
每次drawRect的调用都会触发所有子view的drawRect
尤其是BaseVcView的setNeedsDisplay=YES的时候，会触发内部所有子view的drawRect




layer的contentMode
Tweaking the Content You Provide

layer介绍
Setting Up Layer Objects

从nib创建的view默认setWantsLayer: method and pass a value of YES
Layer-backed views默认创建一个CALayer的对象
你可以通过重写makeBackingLayer方法改变默认的layer class


一个layer-hosting view是个你可以自己创建layer并且管理的NSView 对象.
当你想控制某个view关联的layer的类型你可能会用到这个

Creating a layer-hosting view

Create myView...
[myView setWantsLayer:YES];
CATiledLayer* hostedLayer = [CATiledLayer layer];
[myView setLayer:hostedLayer];

Add myView to a view hierarchy ....

如果选择了host layers，必须手动设置contentsScale和提供一个high-resolution content在适当的时候，
关于high-resolution content with your layers,参照文档Working with High-Resolution Images

