//
//  ViewController.m
//  PlayGame
//
//  Created by Luxurious on 16/8/3.
//  Copyright © 2016年 董婷. All rights reserved.
//

#import "ViewController.h"
#import "StartGameViewController.h"
@interface ViewController ()
@property (nonatomic,strong)UIButton *startGame;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.startGame setTitle:@"开始" forState:UIControlStateNormal];
    // Do any additional setup after loading the view, typically from a nib.
}
-(UIButton *)startGame
{
    if(!_startGame)
    {
        _startGame = [[UIButton alloc]initWithFrame:CGRectMake(100, 160, 160, 80)];
        _startGame.titleLabel.font = [UIFont systemFontOfSize:42];
        [_startGame setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_startGame addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        self.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_startGame];
    }
    return _startGame;
}
-(void)start
{
    StartGameViewController *startGameVC = [[StartGameViewController alloc]init];
    [self.navigationController pushViewController:startGameVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
