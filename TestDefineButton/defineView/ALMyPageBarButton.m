//
//  ALMyPageBarButton.m
//  ALApp
//
//  Created by Tywin on 2016/11/14.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import "ALMyPageBarButton.h"
#define BUTTON_IMG(button, imageName) [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

@implementation ALMyPageBarButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    if ([title containsString:@"关注"]) {
        BUTTON_IMG(self, @"my_page_followProfession_icon");
    }else if ([title containsString:@"有用"]){
        BUTTON_IMG(self, @"my_page_userfulArticle_icon");
    }else if ([title containsString:@"提问"]){
        BUTTON_IMG(self, @"my_page_question_icon");
    }else if ([title containsString:@"回答"]){
        BUTTON_IMG(self, @"my_page_answer_icon");
    }else if ([title containsString:@"评论"]){
        BUTTON_IMG(self, @"my_page_comment_icon");
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    
    CGRect retValue = CGRectMake(0,
                                 self.frame.size.height-30,
                                 contentRect.size.width,
                                 30);
    return retValue;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect retValue = CGRectMake(self.frame.size.width/2 - 10,
                                 self.frame.size.height-50,
                                 20,
                                 20);
    return retValue;
}

@end
