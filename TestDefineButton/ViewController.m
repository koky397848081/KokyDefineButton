//
//  ViewController.m
//  TestDefineButton
//
//  Created by xujing on 17/2/28.
//  Copyright © 2017年 xujing. All rights reserved.
//

#import "ViewController.h"
#import "ALMyPageButtonView.h"

@interface ViewController ()
{
     ALMyPageButtonView *_buttonsView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self interfaceUI];
}

- (void)interfaceUI{
    _buttonsView = [[ALMyPageButtonView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60) ImgArr:@[@"my_page_followProfession_icon",@"my_page_userfulArticle_icon",@"my_page_question_icon",@"my_page_answer_icon",@"my_page_comment_icon"] titleLableArr:@[@"关注 10",@"有用 20",@"提问 30",@"回答 10",@"评论 20"]];
    [self.view addSubview:_buttonsView];
    
    [_buttonsView myPageButtonViewTapedCompletionHandler:^(NSInteger buttonIndex,NSString *buttonTitle) {
        // 点击了按钮
        NSLog(@"点击的按钮是第：%ld个,标题是：%@",buttonIndex + 1,buttonTitle);
    }];
}

- (IBAction)loadDataRefresh:(id)sender {
    
    NSString *followNum = [NSString stringWithFormat:@"关注 %@",@(rand()%10)];
    NSString *thumbsUpCount= [NSString stringWithFormat:@"有用 %@",@(rand()%100)];
    NSString *questionCount = [NSString stringWithFormat:@"提问 %@",@(rand()%100)];
    NSString *answerCount = [NSString stringWithFormat:@"回答 %@",@(rand()%100)];
    NSString *commentCount = [NSString stringWithFormat:@"评论 %@",@(rand()%100)];
    [_buttonsView refreshButtonTitleWithtitleLableArr:@[followNum,thumbsUpCount,questionCount,answerCount,commentCount]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
