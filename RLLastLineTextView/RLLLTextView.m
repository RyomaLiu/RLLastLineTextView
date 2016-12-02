//
//  RLLLTextView.m
//  RLLastLineTextView
//
//  Created by LiuMingchuan on 2016/12/2.
//  Copyright © 2016年 LiuMingchuan. All rights reserved.
//

#import "RLLLTextView.h"

@implementation RLLLTextView

-(void)setText:(NSString *)text {
    [super setText:text];
    [self scrollRangeToVisible:NSMakeRange(text.length, 1)];
    self.layoutManager.allowsNonContiguousLayout = NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
