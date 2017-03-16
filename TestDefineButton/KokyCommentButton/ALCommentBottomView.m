//
//  ALCommentBottomView.m
//  ALApp
//
//  Created by xujing on 17/3/9.
//  Copyright © 2017年 AiLi. All rights reserved.
//

#import "ALCommentBottomView.h"
#import "ALCommentButton.h"
#define intervalW 30
#define rightMargin 10

@interface ALCommentBottomView()
{
    NSArray *_backgroundImageArray;
}
@end

@implementation ALCommentBottomView

- (instancetype)initWithFrame:(CGRect)frame backgroundImageArray:(NSArray *)backgroundImageArray highlightImageArray:(NSArray *)highlightImageArray {

    self = [super init];
    if (self) {
        _backgroundImageArray = backgroundImageArray;
        self.backgroundColor = [UIColor whiteColor];
        self.frame = frame;
       
        UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
        topLine.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        [self addSubview:topLine];
        
       
        for (NSInteger i = 0; i<backgroundImageArray.count; i++) {
            ALCommentButton *button = [[ALCommentButton alloc]init];
            [button setBackgroundImage:[UIImage imageNamed:backgroundImageArray[i]] forState:UIControlStateNormal];
            if (highlightImageArray) {
                [button setBackgroundImage:[UIImage imageNamed:highlightImageArray[i]] forState:UIControlStateHighlighted];
            }
            [button addTarget:self action:@selector(bottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 60+i;
            button.frame = CGRectMake((self.frame.size.width - rightMargin)-intervalW *i - 23*(i+1) , 12, 23, 23);
            [self addSubview:button];
        }
    }
    return self;
}

- (void)bottomButtonClicked:(UIButton *)sender{
    if (_didSelectedItemCompletion) {
        _didSelectedItemCompletion(sender.tag - 60);
    }
}

-(void)setCommentNum:(NSString *)commentNum{
    ALCommentButton *button = (ALCommentButton *)[self viewWithTag:60+_backgroundImageArray.count - 1];
    [button setTitle:commentNum forState:UIControlStateNormal];
}

- (void)setZanNum:(NSString *)zanNum{
    ALCommentButton *button = (ALCommentButton *)[self viewWithTag:60+_backgroundImageArray.count - 1 - 1];
    [button setTitle:zanNum forState:UIControlStateNormal];
}

@end
