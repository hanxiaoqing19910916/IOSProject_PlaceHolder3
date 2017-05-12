/**
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
 
 
 
 */
