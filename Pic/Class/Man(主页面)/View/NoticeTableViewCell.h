//
//  NoticeTableViewCell.h
//  Pic
//
//  Created by 麟 on 2018/8/28.
//  Copyright © 2018年 麟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticeModel.h"

@interface NoticeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleimg;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIButton *delate;

@property (nonatomic , strong) NoticeModel *noticemodel;

@end
