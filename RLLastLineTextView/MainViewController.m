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
NSString * const CLAER_LOG = @"ClearLog";

@interface MainViewController () {
    NSTimer *timer;
    RLLLTextView *rlllTxtV;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"AlwaysLastLine"];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc]initWithTitle:START_PRINT style:UIBarButtonItemStylePlain target:self action:@selector(printContrl:)]];
    
    rlllTxtV = ({RLLLTextView *txtV = [[RLLLTextView alloc]init];
        [txtV setBackgroundColor:[UIColor blackColor]];
        [txtV setTextColor:[UIColor redColor]];
        [txtV setFont:[UIFont systemFontOfSize:20]];
        [txtV setEditable:NO];
        txtV;});
    [self.view addSubview:rlllTxtV];
    
    [rlllTxtV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(0);
        make.height.equalTo(self.view);
    }];
    
}

- (void)printContrl:(id)sender{
    UIBarButtonItem *barItem = (UIBarButtonItem *)sender;
    if (timer) {
        [barItem setTitle:START_PRINT];
        [timer invalidate];
        timer = nil;
    } else {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSString *randomNum = [NSString stringWithFormat:@" random num is -> %d",arc4random()%100 + 40];
            [self showLog:randomNum];
            [barItem setTitle:STOP_PRINT];
        }];
        [timer setFireDate:[NSDate date]];
    }
}

- (void)clearLog {
    rlllTxtV.text = @"";
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
