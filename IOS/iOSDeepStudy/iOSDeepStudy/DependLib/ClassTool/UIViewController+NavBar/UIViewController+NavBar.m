//
//  UIViewController+NavBar.m
//  IMModule2.0
//
//  Created by LiuBang on 2017/6/28.
//  Copyright © 2017年 LiuBang. All rights reserved.
//

#import "UIViewController+NavBar.h"

@implementation UIViewController(NavBar)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)viewDidLoad {
    if (self.navigationController.viewControllers.count > 1) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 60, 50);
        [btn addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left_arrow_darkGray"]];
        imageView.frame = CGRectMake(5, 18, 16, 16);
        [btn addSubview:imageView];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        self.navigationItem.leftBarButtonItem = item;
    }
    self.automaticallyAdjustsScrollViewInsets = YES;
}
#pragma clang diagnostic pop


- (void)creatNavRightIcon:(UIImage *)icon {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 50);
    [btn addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:icon];
    imageView.frame = CGRectMake(35, 18, 16, 16);
    [btn addSubview:imageView];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)rightButtonAction:(UIButton *)btn {

}

- (void)creatNavRightTitle:(NSString *)title {
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 20, 15 * title.length + 5, 44);
    [btn addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)leftButtonAction:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
