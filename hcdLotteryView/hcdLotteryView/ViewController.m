//
//  ViewController.m
//  hcdLotteryView
//
//  Created by polesapp-hcd on 16/3/26.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import "ViewController.h"
#import "HcdLotteryView.h"

#define Screen_Height [[UIScreen mainScreen] bounds].size.height
#define Screen_Width [[UIScreen mainScreen] bounds].size.width
#define iOS7_OR_LATER [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0

@interface ViewController ()

@property (nonatomic, strong) HcdLotteryView *hcdLotteryView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.hcdLotteryView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private

- (HcdLotteryView *)hcdLotteryView {
    if (!_hcdLotteryView) {
        _hcdLotteryView = [[HcdLotteryView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    }
    return _hcdLotteryView;
}

@end
