//
//  LoginViewController.m
//  Pic
//
//  Created by 麟 on 2018/8/27.
//  Copyright © 2018年 麟. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()


@property (nonatomic , strong) UIView *loginV;
@property (nonatomic , strong) UIImageView *imgview;
@property (nonatomic , strong) UIView *nextV;
@property (nonatomic , strong) UITextField *namefield;
@property (nonatomic , strong) UITextField *codefield;
@property (nonatomic , strong) UIButton *codebtn;
@property (nonatomic , strong) UITextField *recomfield;
@property (nonatomic , strong) UIButton *loginbtn;



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loginVC];
}
- (void)loginVC{
    _loginV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/4)];
    _loginV.backgroundColor = bgrgb;
    
    [self.view addSubview:_loginV];
    
    
    _nextV = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENH/4, SCREENW, SCREENH/4*3)];
    _nextV.backgroundColor = [UIColor whiteColor];
    
    //field 账户
    _namefield = [[UITextField alloc] initWithFrame:CGRectMake( 30, 100,SCREENW-60 ,38)];
    _namefield.placeholder = @"输入手机号";
     [_namefield setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _namefield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _namefield.keyboardType = UIKeyboardTypePhonePad;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 30.0, 38.0)];//左端缩进20像素
    _namefield.leftView = view;
    _namefield.leftViewMode = UITextFieldViewModeAlways;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,_namefield.frame.size.height - 1, _namefield.frame.size.width, 1)];
    lineView.backgroundColor = RGB(231, 231, 231);
    [_namefield addSubview:lineView];
    UIButton *namebtn = [[UIButton alloc] initWithFrame:CGRectMake(35, _namefield.frame.origin.y, 25, 38)];
    [namebtn setImage:[UIImage imageNamed:@"手机"] forState:UIControlStateNormal];
    
    _codefield = [[UITextField alloc] initWithFrame:CGRectMake(30, _namefield.frame.origin.y + 50, SCREENW-60, 38)];
    _codefield.placeholder = @"输入验证码";
    [_codefield setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _codefield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _codefield.keyboardType = UIKeyboardTypePhonePad;
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 30.0, 38.0)];//左端缩进20像素
    _codefield.leftView = view1;
    _codefield.leftViewMode = UITextFieldViewModeAlways;
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0,_codefield.frame.size.height - 1, _codefield.frame.size.width, 1)];
    lineView1.backgroundColor = RGB(231, 231, 231);
    [_codefield addSubview:lineView1];
    UIButton *namebtn1 = [[UIButton alloc] initWithFrame:CGRectMake(35, _codefield.frame.origin.y, 25, 38)];
    [namebtn1 setImage:[UIImage imageNamed:@"锁"] forState:UIControlStateNormal];
    //推荐码btn
    _codebtn = [[UIButton alloc] initWithFrame:CGRectMake(_codefield.frame.size.width-120, 0, 120, 38)];
    [_codebtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _codebtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_codebtn setTitleColor:bgrgb forState:UIControlStateNormal];
    [_codebtn addTarget:self action:@selector(getcode) forControlEvents:UIControlEventTouchUpInside];
    [_codefield addSubview:_codebtn];
    
    
    _recomfield = [[UITextField alloc] initWithFrame:CGRectMake(30, _codefield.frame.origin.y + 50, SCREENW-60, 38)];
    _recomfield.placeholder = @"输入验证码";
    [_recomfield setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _recomfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _recomfield.keyboardType = UIKeyboardTypePhonePad;
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 30.0, 38.0)];//左端缩进20像素
    _recomfield.leftView = view2;
    _recomfield.leftViewMode = UITextFieldViewModeAlways;
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0,_recomfield.frame.size.height - 1, _codefield.frame.size.width, 1)];
    lineView2.backgroundColor = RGB(231, 231, 231);
    [_recomfield addSubview:lineView2];
    UIButton *namebtn2 = [[UIButton alloc] initWithFrame:CGRectMake(35, _recomfield.frame.origin.y, 25, 38)];
    [namebtn2 setImage:[UIImage imageNamed:@"推荐码"] forState:UIControlStateNormal];
    
    _loginbtn = [[UIButton alloc] initWithFrame:CGRectMake(30, _recomfield.frame.origin.y+80, SCREENW - 60, 38)];
    [_loginbtn setTitle:@"登 录" forState:UIControlStateNormal];
    _loginbtn.backgroundColor = bgrgb;
    _loginbtn.layer.masksToBounds = YES;
    _loginbtn.layer.cornerRadius = 10;
    [_loginbtn addTarget:self action:@selector(loginalock) forControlEvents:UIControlEventTouchUpInside];
    
    [_nextV addSubview:_namefield];
    [_nextV addSubview:namebtn];
    [_nextV addSubview:_codefield];
    [_nextV addSubview:namebtn1];
    [_nextV addSubview:_recomfield];
    [_nextV addSubview:namebtn2];
    [_nextV addSubview:_loginbtn];
    [self.view addSubview:_nextV];
    
    
    _imgview = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENW/2-45, SCREENH/4-45, 90, 90)];
    _imgview.userInteractionEnabled = YES;
    //_imgview.layer.masksToBounds = YES;
    _imgview.layer.cornerRadius = 20;
    _imgview.backgroundColor = [UIColor whiteColor];
    
    //添加边框
    CALayer * layer = [_imgview layer];
    layer.borderColor = [[UIColor lightTextColor] CGColor];
    layer.borderWidth = 10.0f;
    //添加四个边阴影
    _imgview.layer.shadowColor = [UIColor lightGrayColor].CGColor;//阴影颜色
    _imgview.layer.shadowOffset = CGSizeMake(0, 0);//偏移距离
    _imgview.layer.shadowOpacity = 0.5;//不透明度
    _imgview.layer.shadowRadius = 10.0;//半径
    [self.view bringSubviewToFront:_imgview];
    [self.view addSubview:_imgview];
}
- (void)getcode{
    [self messageTime];
}
- (void)messageTime{
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self->_codebtn setTitle:@"发送验证码" forState:UIControlStateNormal];
                [self->_codebtn setTitleColor:bgrgb forState:0];
                self->_codebtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self->_codebtn setTitle:[NSString stringWithFormat:@"(%@)重新发送",strTime] forState:UIControlStateNormal];
                [self->_codebtn setTitleColor:bgrgb forState:0];
                //To do
                [UIView commitAnimations];
                self->_codebtn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
- (void)loginalock{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
