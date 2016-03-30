//
//  HcdLotteryButton.m
//  hcdLotteryView
//
//  Created by polesapp-hcd on 16/3/26.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import "HcdLotteryButton.h"

@implementation HcdLotteryButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //        50*43  - 110*43
        //        70  40  30*15
        float height=frame.size.height;
        float width=frame.size.width;
        //        self.layer.masksToBounds=YES;
        //        self.layer.cornerRadius=height/2;
        float labelWidth=70;
        self.backgroundColor=[UIColor colorWithRed:0.99 green:0.54 blue:0.16 alpha:1];
        float imageWidth=20;
        // float width=frame.size.width;
        _label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, height)];
        
        [self addSubview:_label];
        _titleImageView=[[UIImageView alloc] initWithFrame:CGRectMake(labelWidth+5, (height-15)/2, 30,15)];
        [self addSubview:_titleImageView];
        _titleImageView.image=[UIImage imageNamed:@"l4"];
        
        _label.font=[UIFont boldSystemFontOfSize:15];
        _label.textColor=[UIColor whiteColor];
        
        _label.textAlignment=NSTextAlignmentRight;
        _label.text=@"开始抽奖";
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
