//
//  HcdLotteryView.m
//  hcdLotteryView
//
//  Created by polesapp-hcd on 16/4/6.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import "HcdLotteryView.h"
#import "HcdLotteryCell.h"
#import "HcdLotteryButton.h"

@interface HcdLotteryView() {
    
    HcdLotteryCell *lotteryCell1;
    HcdLotteryCell *lotteryCell2;
    HcdLotteryCell *lotteryCell3;
    HcdLotteryCell *lotteryCell4;
    HcdLotteryCell *lotteryCell5;
    HcdLotteryCell *lotteryCell6;
    HcdLotteryCell *lotteryCell7;
    HcdLotteryCell *lotteryCell8;
    HcdLotteryCell *lotteryCell9;
    HcdLotteryCell *lotteryCell10;
    
    HcdLotteryButton *startButton;
}

@end

@implementation HcdLotteryView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        float originX=15;
        float space=10;
        float cellWidth=50;
        float cellHeight=43;
        float orginY=75;
        
        lotteryCell1=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX, orginY, cellWidth, cellHeight)];
        [self addSubview:lotteryCell1];
        lotteryCell1.label.text=@"2";
        lotteryCell2=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth+space, orginY, cellWidth, cellHeight)];
        [self addSubview:lotteryCell2];
        lotteryCell2.label.text=@"4";
        lotteryCell3=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth*2+space*2, orginY, cellWidth, cellHeight)];
        [self addSubview:lotteryCell3];
        lotteryCell3.label.text=@"6";
        lotteryCell4=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth*3+space*3, orginY, cellWidth, cellHeight)];
        [self addSubview:lotteryCell4];
        lotteryCell4.label.text=@"8";
        lotteryCell5=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth*3+space*3, orginY+cellHeight+space, cellWidth, cellHeight)];
        [self addSubview:lotteryCell5];
        lotteryCell5.label.text=@"10";
        
        lotteryCell6=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth*3+space*3, orginY+(cellHeight+space)*2, cellWidth, cellHeight)];
        [self addSubview:lotteryCell6];
        lotteryCell6.label.text=@"12";
        
        lotteryCell7=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth*2+space*2, orginY+(cellHeight+space)*2, cellWidth, cellHeight)];
        [self addSubview:lotteryCell7];
        lotteryCell7.label.text=@"14";
        
        lotteryCell8=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth*1+space*1, orginY+(cellHeight+space)*2, cellWidth, cellHeight)];
        [self addSubview:lotteryCell8];
        lotteryCell8.label.text=@"16";
        
        lotteryCell9=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth*0+space*0, orginY+(cellHeight+space)*2, cellWidth, cellHeight)];
        [self addSubview:lotteryCell9];
        lotteryCell9.label.text=@"18";
        
        lotteryCell10=[[HcdLotteryCell alloc] initWithFrame:CGRectMake(originX+cellWidth*0+space*0, orginY+cellHeight+space, cellWidth, cellHeight)];
        [self addSubview:lotteryCell10];
        lotteryCell10.label.text=@"20";
        
        
        startButton=[[HcdLotteryButton alloc] initWithFrame:CGRectMake(originX+cellWidth+space, orginY+cellHeight+space, cellWidth*2+space, cellHeight)];
        [self addSubview:startButton];
        [startButton addTarget:self action:@selector(prepareLotteryAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//抽奖按钮按下后的准备工作
- (void)prepareLotteryAction {
    NSLog(@"prepareLotteryAction");
    __block int timeout=59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"%@", strTime);
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
