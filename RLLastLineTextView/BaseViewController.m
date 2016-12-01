//
//  BaseViewController.m
//  RLLastLineTextView
//
//  Created by LiuMingchuan on 2016/12/2.
//  Copyright © 2016年 LiuMingchuan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //调整因版本问题出现的导航遮挡视图
    if ([[UIDevice currentDevice]systemVersion].doubleValue>7.0) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
        [self.navigationController.navigationBar setTranslucent:NO];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
