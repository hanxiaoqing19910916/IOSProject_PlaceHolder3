

1.背景色
self.scrollView.drawsBackground = NO;
self.scrollView.backgroundColor= [NSColor purpleColor];

设置drawsBackground = NO 背景色无效（默认是YES）

2.为scrollView的contentView增加额外的滚动区域
self.scrollView.contentView.automaticallyAdjustsContentInsets = NO;
self.scrollView.contentView.contentInsets = NSEdgeInsetsMake(40, 0, 40, 0);

3.控制鼠标滚轮滑动量
@property CGFloat horizontalLineScroll;
@property CGFloat verticalLineScroll;
@property CGFloat lineScroll;
lineScroll同时设置水平和数值滚动量

4.放大scrollView的contentView的内容
self.scrollView.allowsMagnification = YES;
self.scrollView.magnification = 2;

设置最小/最大放大倍数
@property CGFloat maxMagnification;
@property CGFloat minMagnification;

// 制定rect矩形区域放大
- (void)magnifyToFitRect:(NSRect)rect;
// 围绕某个中心点放大
- (void)setMagnification:(CGFloat)magnification centeredAtPoint:(NSPoint)point;


5.禁止滚动
[_textScrollView setVerticalLineScroll:0.0];
[_textScrollView setVerticalPageScroll:0.0];

6.增加流动的view（滚动内容的时候可竖直方向一直可见，也可以水平方向一直可见）
NSView *dView = [[NSView alloc] init];
dView.wantsLayer = YES;
dView.layer.backgroundColor = [NSColor redColor].CGColor;
[dView setFrameSize:CGSizeMake(50, 50)];
[self.scrollView addFloatingSubview:dView forAxis:NSEventGestureAxisHorizontal];
NSEventGestureAxisHorizontal //水平总可见
NSEventGestureAxisVertical //竖直总可见
