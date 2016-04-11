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
    
    HcdLotteryCell *currentView;
    float intervalTime;//变换时间差（用来表示速度）
    float allTime, currentTime;
    NSArray *array;
    NSTimer *timer;
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
        
        array = [[NSArray alloc] initWithObjects:lotteryCell1,lotteryCell2,lotteryCell3,lotteryCell4,lotteryCell5,lotteryCell6,lotteryCell7,lotteryCell8,lotteryCell9,lotteryCell10,nil];
        NSInteger count = array.count;
        for (int i = 0; i < count; i++) {
            HcdLotteryCell *view = array[i];
            view.tag = i;
        }
        
        startButton=[[HcdLotteryButton alloc] initWithFrame:CGRectMake(originX+cellWidth+space, orginY+cellHeight+space, cellWidth*2+space, cellHeight)];
        [self addSubview:startButton];
        [startButton addTarget:self action:@selector(prepareLotteryAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//得到上一个view
-(UIView *)previewByCurrentView:(UIView *)curView inArray:(NSArray *)views{
    NSInteger count = views.count;
    NSInteger curIndex = [views indexOfObject:curView];
    NSInteger preIndex;
    if (curIndex == 0) {
        preIndex = count - 1;
    }else{
        preIndex = curIndex - 1;
    }
    return [views objectAtIndex:preIndex];
}

//得到下一个view
-(UIView *)nextViewByCurrentView:(UIView *)curView inArray:(NSArray *)views{
    NSInteger count = views.count;
    NSInteger curIndex = [views indexOfObject:curView];
    NSInteger nextIndex;
    if (curIndex == count - 1) {
        nextIndex = 0;
    }else{
        nextIndex = curIndex + 1;
    }
    return [views objectAtIndex:nextIndex];
}

//单元格移动一下
-(void)moveCurrentView:(HcdLotteryCell *)curView  inArray:(NSArray *)views{
    
    HcdLotteryCell *preView = (HcdLotteryCell *)[self previewByCurrentView:curView inArray:views];
    
    preView.label.textColor = [UIColor colorWithRed:0.74 green:0.46 blue:0.07 alpha:1];
    preView.image=[UIImage imageNamed:@"l3"];
    curView.label.textColor = [UIColor whiteColor];
    curView.image=[UIImage imageNamed:@"l2"];
    
}

//抽奖按钮按下后的准备工作
- (void)prepareLotteryAction {
    NSLog(@"prepareLotteryAction");
    
    intervalTime = 0.7;//起始的变换时间差（速度）
    allTime = 10.0f+(rand()%10)*0.2;
    currentTime = 0.0f;
    
    currentView.label.textColor = [UIColor colorWithRed:0.74 green:0.46 blue:0.07 alpha:1];
    currentView.image=[UIImage imageNamed:@"l3"];
    
    currentView = [array objectAtIndex:0];
    currentView.label.textColor = [UIColor whiteColor];
    currentView.image=[UIImage imageNamed:@"l2"];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:intervalTime target:self selector:@selector(startLotterry:) userInfo:currentView repeats:NO];
    
//    __block int timeout=59; //倒计时时间
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
//    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
//    dispatch_source_set_event_handler(_timer, ^{
//        if(timeout<=0){ //倒计时结束，关闭
//            dispatch_source_cancel(_timer);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                //设置界面的按钮显示 根据自己需求设置
//                
//            });
//        }else{
//            //            int minutes = timeout / 60;
//            int seconds = timeout % 60;
//            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                //设置界面的按钮显示 根据自己需求设置
//                NSLog(@"%@", strTime);
//                currentView = (HcdLotteryCell *)[self nextViewByCurrentView:currentView inArray:array];
//                [self moveCurrentView:currentView inArray:array];
//            });
//            timeout--;
//        }
//    });
//    dispatch_resume(_timer);
}

//开始抽奖
-(void)startLotterry:(NSTimer *)sender{
    
    NSInteger count = array.count;
    NSTimer *myTimer = (NSTimer *)sender;
    UIView *preView = (UIView *)myTimer.userInfo;
    NSInteger index;
    if (preView == nil) {
        index = 0;
    } else {
        index = [array indexOfObject:preView];
    }
    if (index == count - 1) {
        currentView = [array objectAtIndex:0];
    } else {
        currentView = [array objectAtIndex:index+1];
    }
    
    [self moveCurrentView:currentView inArray:array];
    
    if (intervalTime > 0.1) {
        intervalTime = intervalTime - 0.1;
        currentTime += intervalTime;
        timer = [NSTimer scheduledTimerWithTimeInterval:intervalTime target:self selector:@selector(startLotterry:) userInfo:currentView repeats:NO];
    } else {
        if (currentTime > allTime / 2) {
            currentTime += intervalTime;
            timer = [NSTimer scheduledTimerWithTimeInterval:intervalTime target:self selector:@selector(moveToStopWithAccelerate:) userInfo:currentView repeats:NO];
        } else {
            currentTime += intervalTime;
            timer = [NSTimer scheduledTimerWithTimeInterval:intervalTime target:self selector:@selector(startLotterry:) userInfo:currentView repeats:NO];
        }
    }
}

- (void)moveToStopWithAccelerate:(NSTimer *)sender{
    NSInteger count = array.count;
    NSTimer *myTimer = (NSTimer *)sender;
    UIView *preView = (UIView *)myTimer.userInfo;
    NSInteger index;
    if (preView == nil) {
        index = 0;
    } else {
        index = [array indexOfObject:preView];
    }
    if (index == count - 1) {
        currentView = [array objectAtIndex:0];
    } else {
        currentView = [array objectAtIndex:index+1];
    }
    
    [self moveCurrentView:currentView inArray:array];
    
    if (intervalTime < 0.7) {
        intervalTime = intervalTime + 0.1;
        currentTime += intervalTime;
        timer = [NSTimer scheduledTimerWithTimeInterval:intervalTime target:self selector:@selector(moveToStopWithAccelerate:) userInfo:currentView repeats:NO];
    } else {
        NSLog(@"currentTime:%f", currentTime);
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
