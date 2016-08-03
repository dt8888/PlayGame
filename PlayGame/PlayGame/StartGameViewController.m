//
//  StartGameViewController.m
//  PlayGame
//
//  Created by Luxurious on 16/8/3.
//  Copyright © 2016年 董婷. All rights reserved.
//

#import "StartGameViewController.h"

@implementation StartGameViewController
{
    UIButton *_submitButton;//正确的图片
    int s;//倒计时的秒数
    int a;//需要点击次数的变换
    int  p;//横排个数
    int  d;//在结束前点击错误的个数不能超过3次
    
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self createTimer];
    p = 2;
    NSInteger width = (self.view.bounds.size.width)/4;
    NSInteger height = self.view.bounds.size.height;
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*1.25-30, height-50, width+120, 50)];
    
    self.timeLabel.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.timeLabel];
    [self playGame];
    
}
-(void)createTimer
{
    [self.runTimer setFireDate:[NSDate distantPast]];
    self.runTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)timerAction
{
    if (++s>=60||d>3) {
        s=0;
        NSString *str = [NSString stringWithFormat:@"您一共找出来了%d张图片",a-1];
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"恭喜" message:str delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        p = 2;
        [aler show];
        [self.runTimer setFireDate:[NSDate distantFuture]];
        [self.navigationController popViewControllerAnimated:YES];
    }
    self.timeLabel.text=[NSString stringWithFormat:@"剩余时间%02zd",60-s];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
}
- (void)playGame{
    // 1. 先将原来的v移除
    UIView *view = [self.view viewWithTag:987];
    [view removeFromSuperview];
    a++;
    if (a %5 == 0) {
        p ++;
    }
    NSInteger height=(self.view.bounds.size.height)/p;
    NSInteger width=(self.view.bounds.size.width)/p;
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, height*p-100)];
    v.tag = 987;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    v.backgroundColor = [UIColor whiteColor];
    
    int s = arc4random()%(p*p);
    CGFloat hue = ( arc4random() % 128 / 256.0 )+0.5;
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    for (int i = 0; i < p*p; i++) {
        _submitButton = [[UIButton alloc]initWithFrame:CGRectMake(width*(i/p+0.025), ((height*0.83) *(i%p)), width*0.95, height*0.8)];
        if (i == s ) {
            _submitButton.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:(0.5+0.01*a)];
            [_submitButton addTarget:self action:@selector(playGame) forControlEvents:UIControlEventTouchDown];
        }else{
            [_submitButton addTarget:self action:@selector(wrongBtn) forControlEvents:UIControlEventTouchDown];
            _submitButton.backgroundColor = [ UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        }
        [v addSubview:_submitButton];
    }
    [self.view addSubview:v];
}
//三次错误机会
-(void)wrongBtn
{
    d++;
}
@end
