//
//  MainViewController.m
//  RLLastLineTextView
//
//  Created by LiuMingchuan on 2016/12/2.
//  Copyright © 2016年 LiuMingchuan. All rights reserved.
//

#import "MainViewController.h"
#import "RLLLTextView.h"
#import <Masonry.h>

NSString * const START_PRINT = @"StartLog";
NSString * const STOP_PRINT = @"StopLog";

@interface MainViewController () {
    NSTimer *timer;
    RLLLTextView *rlllTxtV;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"AlwaysLastLine"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:STOP_PRINT style:UIBarButtonItemStylePlain target:self action:@selector(printContrl:)];
    
    rlllTxtV = ({RLLLTextView *txtV = [[RLLLTextView alloc]init];
        [txtV setBackgroundColor:[UIColor blackColor]];
        [txtV setTextColor:[UIColor redColor]];
        [txtV setEditable:NO];
        txtV;});
    [self.view addSubview:rlllTxtV];
    
    [rlllTxtV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.offset(100);
    }];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.8 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSString *randomNum = [NSString stringWithFormat:@" random num is -> %d",arc4random()%100 + 40];
        [self showLog:randomNum];
    }];
    
}

- (void)printContrl:(id)sender{
    UIBarButtonItem *barItem = (UIBarButtonItem *)sender;
    if ([STOP_PRINT isEqualToString:barItem.title]) {
        [timer setFireDate:[NSDate distantFuture]];
        [barItem setTitle:START_PRINT];
    } else {
        [timer setFireDate:[NSDate date]];
        [barItem setTitle:STOP_PRINT];
    }
}

-(void)showLog:(NSString *)log {
    if ( [@"" isEqualToString:rlllTxtV.text]) {
        rlllTxtV.text = [NSString stringWithFormat:@">>%@",log];
    } else {
        rlllTxtV.text = [NSString stringWithFormat:@"%@\n>>%@",rlllTxtV.text,log];
    }
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
