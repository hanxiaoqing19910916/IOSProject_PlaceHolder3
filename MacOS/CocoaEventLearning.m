/**  (摘自Event Architecture)
 
 鼠标和触控板事件的传递路径
 
 一个NSWindow对象里面的sendEvent:方法将鼠标事件转发到涉及用户操作的视图.它调用NSView的
 hitTest方法，用于返回一个包含鼠标点击位置的最低层次的子View。（通常是最上层的view）
 然后window对象通过发送一个鼠标相关的确切类型的NSResponder的消息转发事件到view上，
 比如 mouseDown:, mouseDragged:, or rightMouseUp: 在一些鼠标左键按下的事件window
 也会询问接受event的View是否要成为第一响应者能接受随后的键盘事件以及动作
 
 一个view对象接受鼠标事件有三种类型：点击，拖拽，移动，Mouse-click事件有更进一层的分类：
 具体到NSEventType常量和一些由鼠标（左右或者其他）按键以及点击的方向（上或者下）相关的
 响应者对象方法。Mouse-dragged mouse-up （拖拽和鼠标抬起）事件通常发送给相同的
 最近接收到mouse-down的view。 Mouse-moved事件发送给第一响应者。
 Mouse-down, mouse-dragged, mouse-up, and mouse-moved events只能发生在与其他事件
 关联的具体情形：
 1.Each mouse-up event must be preceded by a mouse-down event.
 2.Mouse-dragged events occur only between a mouse-down event and a mouse-up event.
 3.Mouse-moved events do not occur between a mouse-down and a mouse-up event.
 
 当用户点击鼠标按钮并且指针在一个view的上面会发送Mouse-down事件。如果包含这个view的window
 不是keywindow，这个window会成为keywindow同时会丢弃掉这个Mouse-down。然而一个view可以
 规避这个默认行为，通过重写NSView的acceptsFirstMouse:方法返回YES.
 
 view自动接收点击和拖拽（mouse-clicked and mouse-dragged）事件 不过由于鼠标移动
 （mouse-moved）事件会频繁的产生并且会阻塞事件队列，一个view必须明确的请求它的所属window去监
 听它的，通过window一个setAcceptsMouseMovedEvents:方法。定义在Other Event Dispatching
 文档说明中的追踪视图矩形区域的方法，是跟随鼠标移动位置的一个相对节省性能的方式。
 
 基于NSResponder对象的鼠标事件的方法的实现，子类化NSView可把一个鼠标事件具体化为执行一个动作响应，
 例如发送一个target-action消息，选取一个图形元素，对自己在特定位置进行重绘等等。每个事件方法
 都包含它唯一的 NSEvent对象参数，包含这个view的关于这个事件的信息，比如可以用view
 的locationInWindow方法找到鼠标指针基于事件接受者window坐标系的点。把它转换到view的坐标系统
 ，可以使用 convertPoint:fromView: 传一个 nil view 参数.然后你可以用 mouse:inRect:方法
 决定是否要在制定的区域产生点击事件。
 
 触控板事件采用的传递路径到视图view的机制与鼠标事件类似。NSWindow对象代表触控板事件出现的窗口，
 转发事件到位于鼠标指针下的视图，然而存在两种触控板事件，接触类事件，和点触类事件。前者通常是原生的
 触控板事件（NSTabletProximity）发生在触笔进入或者离开触控板。点触类事件出现在proximity-
 entering（进入）and proximity-leaving（进入）事件之间，象征着触笔方向，压力，按钮点击之类的
 事情。点触类事件常作为鼠标事件的子类。查阅Handling Tablet Events的更详细的信息
 
 
 
 The Path of Key Events（键盘事件的传递路径）
 
 以下是对键盘事件传递路径详细描述，按照应用对每个键盘事件的评估的顺序。
 1.Key equivalents 是一个按键或者组合（通常是一个按键被command键改变）在应用程序中通常绑定到
 某些菜单项或控件对象。按下组合键类似于控制点击或者选择菜单的动作
 
 应用对象通过不断向下检索视图view层次来处理Key equivalents，向每个view发送
 performKeyEquivalent: 消息直到某个view对象返回YES.如果所有的view层级都没有处理，NSApp会
 发送到菜单栏的菜单项目。一些cooca类NSButton, NSMenu, NSMatrix,  NSSavePanel提供了一些默认的
 实现 欲了解更多, 参考 Handling Key Equivalents
 
 
 
 
 
 
 
 
 
 
 
 */
