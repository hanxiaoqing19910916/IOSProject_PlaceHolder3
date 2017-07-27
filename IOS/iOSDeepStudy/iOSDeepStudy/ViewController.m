//
//  ViewController.m
//  iOSDeepStudy
//
//  Created by hanxiaoqing on 2017/6/23.
//  Copyright © 2017年 hanxiaoqing. All rights reserved.
//

#import "ViewController.h"
#import "KVCExample.h"

#import "Immessage.pbobjc.h" //模型
#import "VendorALL.h"
#import "ClassToolAll.h"
#import "HXConst.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)kvcTest
{
    KVCExample *model = [[KVCExample alloc] init];
    [model setValue:@"wo" forKey:@"name"];
    [model printName];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UserInfo *uinfo = [[UserInfo  alloc] init];
    uinfo.name = @"wang";
    uinfo.level = 3;
    
    NSData *da =[uinfo delimitedData];
    
    
    GPBCodedInputStream *inputStream = [GPBCodedInputStream streamWithData:da];
    
    NSError *error;
    UserInfo *per = [UserInfo parseDelimitedFromCodedInputStream:inputStream extensionRegistry:nil error:&error];
    
    if (error){
        return;
    }

    NSLog(@"--%@",per.name);
    
    

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [NSString validateEmail:@"da"];
    
    HXApiManager *mag = [HXApiManager manager];
    mag.urlStirng = @"http://www.baidu.com";
    NSDictionary *d = @{@"a":@"b"};
    [mag loadGETwithService:nil params:d success:^(HXResponsResult *response) {
        

        
        
    } fail:^(HXResponsResult *response) {
        NSLog(@"---%@",response.resError);
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
