//
//  ALMyPageButtonView.m
//  ALApp
//
//  Created by xujing on 16/11/15.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import "ALMyPageButtonView.h"
#import "ALMyPageBarButton.h"

#define BUTTON_TITLE(button,title) [button setTitle:title forState:UIControlStateNormal];
#define BUTTON_IMG(button, imageName) [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

@interface ALMyPageButtonView()

@property (nonatomic, strong) NSArray * iconImgNameArr;
@property (nonatomic, strong) NSArray * lableTitleArr;

@end

@implementation ALMyPageButtonView

- (instancetype)initWithFrame: (CGRect)frame ImgArr:(NSArray *)iconImgNameArr titleLableArr:(NSArray *)lableTitleArr
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.iconImgNameArr = iconImgNameArr;
        self.lableTitleArr = lableTitleArr;
        self.backgroundColor = self.viewBackgroudColor?self.viewBackgroudColor:[UIColor whiteColor];
        [self interfaceUI];
    }
    return self;
}

- (void)initWithImgArr:(NSArray *)iconImgNameArr titleLableArr:(NSArray *)lableTitleArr{
    self.iconImgNameArr = iconImgNameArr;
    self.lableTitleArr = lableTitleArr;
    self.backgroundColor = self.viewBackgroudColor?self.viewBackgroudColor:[UIColor whiteColor];
    [self interfaceUI];
}

- (void)interfaceUI{
    
    for (int i = 0; i<_iconImgNameArr.count ; i++) {
        ALMyPageBarButton *button = [[ALMyPageBarButton alloc]init];
        
        BUTTON_TITLE(button, _lableTitleArr[i]);
        BUTTON_IMG(button, _iconImgNameArr[i]);
        button.tag = 50+i;
        [button addTarget:self action:@selector(outsideTap:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonWidth = self.frame.size.width/_iconImgNameArr.count;
        [self addSubview:button];
       // button.sd_layout.leftSpaceToView(self,buttonWidth*i).topSpaceToView(self,0).bottomSpaceToView(self,0).widthIs(buttonWidth);
        button.frame = CGRectMake(buttonWidth*i, 0, buttonWidth, self.frame.size.height);
    }
}

- (void)refreshButtonTitleWithtitleLableArr:(NSArray *)lableTitleArr{
    for (int i = 0; i<_iconImgNameArr.count ; i++) {
        UIButton *button = [self viewWithTag:50+i];
        BUTTON_TITLE(button, lableTitleArr[i]);
    }
}

- (void)outsideTap:(ALMyPageBarButton *)button{
    
    self.myPageButtonViewCompletionHandler(button.tag -50,button.currentTitle);
}

- (void)myPageButtonViewTapedCompletionHandler:(ALMyPageButtonViewTapedCompletionHandler)handle{
    self.myPageButtonViewCompletionHandler = handle;
}

//- (void)setStatisticsDto:(ALProfessionalStatisticsDto *)statisticsDto
//{
//    _statisticsDto = statisticsDto;
//    NSMutableArray *array = [NSMutableArray array];
//    [array addObject:[NSString stringWithFormat:@"关注 %d",statisticsDto.attCount.intValue]];
//    [array addObject:[NSString stringWithFormat:@"有用 %d",statisticsDto.thumbsUpCount.intValue]];
//    [array addObject:[NSString stringWithFormat:@"提问 %d",statisticsDto.questionCount.intValue]];
//    [array addObject:[NSString stringWithFormat:@"回答 %d",statisticsDto.answerCount.intValue]];
//    [array addObject:[NSString stringWithFormat:@"评论 %d",statisticsDto.commentCount.intValue]];
//    for (int i = 0; i<array.count ; i++) {
//        ALMyPageBarButton *button = (ALMyPageBarButton *)[self viewWithTag:50+i];
//        BUTTON_TITLE(button, array[i]);
//    }
//}
@end
