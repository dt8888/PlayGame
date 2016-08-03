//
//  StartGameViewController.h
//  PlayGame
//
//  Created by Luxurious on 16/8/3.
//  Copyright © 2016年 董婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartGameViewController : UIViewController
@property(nonatomic,strong)UILabel *timeLabel;
//计时器用来刷新时间
@property(nonatomic,strong)NSTimer *runTimer;
@end
