//
//  ALCommentButton.m
//  ALApp
//
//  Created by xujing on 17/3/16.
//  Copyright © 2017年 AiLi. All rights reserved.
//

#import "ALCommentButton.h"

@implementation ALCommentButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    
    CGRect retValue = CGRectMake(self.frame.size.width ,
                                 -10,
                                 contentRect.size.width,
                                 10);
    return retValue;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect retValue = CGRectMake(0,
                                 0,
                                 self.frame.size.width,
                                 self.frame.size.height);
    return retValue;
}

@end
