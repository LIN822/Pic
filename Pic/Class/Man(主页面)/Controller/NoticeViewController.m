//
//  NoticeViewController.m
//  Pic
//
//  Created by 麟 on 2018/8/28.
//  Copyright © 2018年 麟. All rights reserved.
//

#import "NoticeViewController.h"
#import "AFNetworking.h"
#import <SVProgressHUD.h>
#import "NoticeTableViewCell.h"
#import "SDCycleScrollView.h"



@interface NoticeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic , strong) UIView *navview;
@property (nonatomic , strong) UIView *nextview;
@property (nonatomic , strong) UIView *endview;
@property (nonatomic , strong) UITableView *tableview;

@end

@implementation NoticeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self noticeVC];
    [self post];
}
- (void)noticeVC{
    self.navview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, (StatusBarH)+50)];
    self.navview.backgroundColor = [UIColor whiteColor];
    UIButton *blackbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, (StatusBarH)+10, 30, 30)];
    [blackbtn setImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    [blackbtn addTarget:self action:@selector(returnalock) forControlEvents:UIControlEventTouchUpInside];
    [self.navview addSubview:blackbtn];
    UILabel *textlab = [[UILabel alloc] initWithFrame:CGRectMake(SCREENW/2-25, (StatusBarH) +5, 50, 40)];
    textlab.text = @"公告";
    textlab.font = [UIFont systemFontOfSize:20];
    textlab.textAlignment = NSTextAlignmentCenter;
    [self.navview addSubview:textlab];
    self.nextview = [[UIView alloc] initWithFrame:CGRectMake(0, self.navview.frame.size.height+self.navview.frame.origin.x, SCREENW, 200)];
    self.nextview.backgroundColor = [UIColor redColor];
    NSArray *imageNames = @[@"banner.png",
                            @"banner.png",
                            @"banner.png",
                            @"banner.png"
                            ];
    // 本地加载 --- 创建不带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREENW, 200) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolAlimentCenter;
    [self.nextview addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //--- 轮播时间间隔，默认1.0秒，可自定义
    cycleScrollView.autoScrollTimeInterval = 2.0;
    
    self.endview = [[UIView alloc] initWithFrame:CGRectMake(0, self.nextview.frame.origin.y + self.nextview.frame.size.height, SCREENW, SCREENH - self.nextview.frame.origin.y - self.nextview.frame.size.height)];
    self.endview.backgroundColor = [UIColor yellowColor];
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.endview.frame.size.width, self.endview.frame.size.height)];
    self.tableview.backgroundColor = [UIColor blackColor];
    self.tableview.tableFooterView = [[UIView alloc]init];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;

    [self.tableview registerNib:[UINib nibWithNibName:@"NoticeTableViewCell" bundle:nil] forCellReuseIdentifier:@"NoticeTableViewCell"];
    [self.tableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.endview addSubview:self.tableview];
    [self.view addSubview:self.navview];
    [self.view addSubview:self.nextview];
    [self.view addSubview:self.endview];
}
- (void)post{
    /*
    //1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.封装参数
    NSDictionary *dict = @{
                           @"userId":userId,
                           @"page":@"1"
                           };
    //3.发送POST请求
    NSString *url = [NSString stringWithFormat:@"%@/connector/comment/getComment",httpurl];
    
    [manager POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[responseObject objectForKey:@"result"] isKindOfClass:[NSArray class]]) {
            self->dic = [responseObject objectForKey:@"result"];
            for (NSDictionary *dicts in self->dic) {
                CommentModel *model  =[[CommentModel alloc]init];
                model.time = dicts[@"time"];
                model.iconimg = dicts[@"userPortrait"];
                model.title = dicts[@"describe"];
                model.worksimg = dicts[@"worksPreview"];
                [self->mutableArray addObject:model];
            }
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"暂无评论消息" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            // 弹出对话框
            [self presentViewController:alert animated:true completion:nil];
        }
        [self comment:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"加载失败" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        // 弹出对话框
        [self presentViewController:alert animated:true completion:nil];
    }];
     */
}
- (void)returnalock{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
//列数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
// 从 Modal 数据模型中取出数据更新 View 的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NoticeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NoticeTableViewCell"];
    
   
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
