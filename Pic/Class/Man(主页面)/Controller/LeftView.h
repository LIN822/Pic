//
//  LeftView.h
//  Pic
//
//  Created by 麟 on 2018/8/29.
//  Copyright © 2018年 麟. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HomeMenuViewDelegate <NSObject>

-(void)LeftMenuViewClick:(NSInteger)tag;

@end

@interface LeftView : UIView
@property (nonatomic ,weak)id <HomeMenuViewDelegate> customDelegate;

@end
