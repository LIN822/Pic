//
//  PersonalViewController.m
//  Pic
//
//  Created by 麟 on 2018/8/28.
//  Copyright © 2018年 麟. All rights reserved.
//

#import "PersonalViewController.h"
#import "ADRollView.h"
#import "ADRollModel.h"
#import "UIColor+ColorHelper.h"
#import "NoticeViewController.h"
#import <SVProgressHUD.h>
#import "MenuView.h"
#import "LeftView.h"

@interface PersonalViewController ()

@property (nonatomic , strong) UIView *firstview;
@property (nonatomic , strong) UIButton *perbtn;
@property (nonatomic , strong) ADRollView *adRollView;
@property (nonatomic , strong) NSMutableArray *adsArray;

@property (nonatomic , strong) UIView *nextview;
@property (nonatomic , strong) UILabel *money;
@property (nonatomic , strong) UILabel *Interest;
@property (nonatomic , strong) UILabel *time;



@end

@implementation PersonalViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.adRollView start];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.adRollView stopTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adsArray = [NSMutableArray array];
    [self personalVC];
}
- (void)personalVC{
    
    
    self.firstview = [[UIView alloc ] initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/5)];
    self.firstview.backgroundColor = bgrgb;
    self.perbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.firstview.frame.size.height/2-20, 40, 40)];
    [self.perbtn setImage:[UIImage imageNamed:@"人"] forState:UIControlStateNormal];
    self.perbtn.layer.masksToBounds = YES;
    self.perbtn.layer.cornerRadius = 8;
    self.perbtn.backgroundColor = RGB(102, 192, 250);
    [self.perbtn addTarget:self action:@selector(peralock) forControlEvents:UIControlEventTouchUpInside];
    [self.firstview addSubview:self.perbtn];
    
    //ADRollView
    self.adRollView = [[ADRollView alloc] initWithFrame:CGRectMake( 70, self.perbtn.frame.origin.y, SCREENW-90, 40)];
    self.adRollView.backgroundColor = RGB(102, 192, 250);
    self.adRollView.layer.masksToBounds = YES;
    self.adRollView.layer.cornerRadius = 8;
    [self.adRollView setVerticalShowDataArr:[self getData]];
    
    //点击公告内容
    __weak __typeof(self)weakSelf = self;
    self.adRollView.clickBlock = ^(NSInteger index) {
        ADRollModel *model = weakSelf.adsArray[index];
        NoticeViewController *noticeVC = [[NoticeViewController alloc] init];
        [weakSelf presentViewController:noticeVC animated:YES completion:nil];
        //跳转
        /*
        WebViewController *adWeb = [[WebViewController alloc] initWithUrl:model.urlString title:model.noticeTitle];
        [weakSelf.navigationController pushViewController:adWeb animated:YES];
         */
        NSLog(@"点击了: %@", model.noticeTitle);
    };
    
    [self.firstview addSubview:self.adRollView];
    [self.view addSubview:self.firstview];
    self.nextview = [[UIView alloc] initWithFrame:CGRectMake( 20, SCREENH/6, SCREENW-40, SCREENH/6*3)];
    self.nextview.backgroundColor = [UIColor whiteColor];
    self.nextview.userInteractionEnabled = YES;
    self.nextview.layer.cornerRadius = 10;
    self.nextview.layer.shadowOpacity = 1;
    //self.nextview.layer.masksToBounds = YES;
    self.nextview.layer.shadowOffset = CGSizeMake(1, 5);
    self.nextview.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    float w = self.nextview.frame.size.width;
    //float h = self.nextview.frame.size.height;
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(w/4, 50, w/2, 38)];
    lab.text = @"申请金额";
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentCenter;
    [self.nextview addSubview:lab];
    self.money = [[UILabel alloc] initWithFrame:CGRectMake(w/4, lab.frame.origin.y+40, w/2, 50)];
    self.money.text = @"10000";
    self.money.backgroundColor = [UIColor redColor];
    self.money.textAlignment = NSTextAlignmentCenter;
    self.money.font = [UIFont systemFontOfSize:40];
    [self.nextview addSubview:self.money];
    
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(w/2, self.money.frame.origin.y+50, 1, 50)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.nextview addSubview:line];
    
    self.Interest = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y, w/2, 25)];
    
    [self.nextview addSubview:self.Interest];
    self.time = [[UILabel alloc] initWithFrame:CGRectMake(w/2, line.frame.origin.y, w/2, 25)];
    [self.nextview addSubview:self.time];
    
    
    
    
    [self.view bringSubviewToFront:self.nextview];
    [self.view addSubview:self.nextview];
    
    UIButton *btn =[[UIButton alloc] initWithFrame:CGRectMake(30, SCREENH/6*4+50, SCREENW-60, 50)];
    btn.backgroundColor = bgrgb;
    [btn setTitle:@"我要借款" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jiekuan) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];
    
    
}
- (NSMutableArray *)getData {
    
    NSArray *adTypeArray = @[@"紧急", @"公告", @"通告"];
    NSArray *titleArray = @[@"程序员才是真正的段子手", @"iOS动画-从不会到熟练应用", @"移动导航设计，看这一篇就够了"];
    NSArray *timeArray = @[@"2016-12-25", @"2017-02-14", @"2017-05-13"];
    NSArray *urlArray = @[@"http://www.cocoachina.com/programmer/20170315/18892.html", @"http://www.cocoachina.com/ios/20170315/18890.html", @"http://www.cocoachina.com/design/20170315/18884.html"];
    
    for (int i = 0; i < adTypeArray.count; i++) {
        ADRollModel *model = [[ADRollModel alloc] init];
        model.noticeType = adTypeArray[i];
        model.noticeTitle = titleArray[i];
        model.addTime = timeArray[i];
        model.urlString = urlArray[i];
        [self.adsArray addObject:model];
    }
    
    return self.adsArray;
}
//点击出现侧菜单
- (void)peralock{
    
}

//跳转借款界面
- (void)jiekuan{
    [SVProgressHUD showSuccessWithStatus:@"跳转借款界面"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
