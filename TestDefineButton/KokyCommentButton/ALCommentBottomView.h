//
//  ALCommentBottomView.h
//  ALApp
//
//  Created by xujing on 17/3/9.
//  Copyright © 2017年 AiLi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidSelectedButtonBlock)(NSInteger selectedIndex);

@interface ALCommentBottomView : UIView

@property (nonatomic, copy) DidSelectedButtonBlock didSelectedItemCompletion;

@property (nonatomic,strong)NSString *commentNum;//评论数
@property (nonatomic,strong)NSString *zanNum;//点赞数

- (instancetype)initWithFrame:(CGRect)frame backgroundImageArray:(NSArray *)backgroundImageArray highlightImageArray:(NSArray *)highlightImageArray ;

@end
