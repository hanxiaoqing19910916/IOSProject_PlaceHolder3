一:view事件处理
1.发生事件的时候，会把事件加入到由UIApplication对象管理的队列里面
2.UIApplication会取出最前的事件分发给主窗口keywindow
keywindow找合适的view
找到view之后调用touchs/以及keydown/mouseDown方法

如何找到最合适的view？
1.自己能不能接收事件？不能，传递到次结束
2.触摸点在不在自己身上？不在，传递到次结束
3.从后往前遍历子控件，重复前面的两个步骤


