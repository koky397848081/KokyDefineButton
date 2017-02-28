//
//  ALMyPageButtonView.h
//  ALApp
//
//  Created by xujing on 16/11/15.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ALMyPageButtonView;
typedef void(^ALMyPageButtonViewTapedCompletionHandler)(NSInteger buttonIndex,NSString *buttonTitle);

@interface ALMyPageButtonView : UIView

@property (nonatomic,copy) ALMyPageButtonViewTapedCompletionHandler myPageButtonViewCompletionHandler;
@property (nonatomic,strong) UIColor *viewBackgroudColor;

- (instancetype)initWithFrame: (CGRect)frame ImgArr:(NSArray *)iconImgNameArr titleLableArr:(NSArray *)lableTitleArr;
- (void)initWithImgArr:(NSArray *)iconImgNameArr titleLableArr:(NSArray *)lableTitleArr;
- (void)myPageButtonViewTapedCompletionHandler:(ALMyPageButtonViewTapedCompletionHandler)handle;
//更新button titlelable
- (void)refreshButtonTitleWithtitleLableArr:(NSArray *)lableTitleArr;

@end
