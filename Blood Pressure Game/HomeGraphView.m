//
//  HomeGraphView.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/7/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import "HomeGraphView.h"
#import "UIView+Borders.h"

@implementation HomeGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       // _header = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x +15, frame.origin.y +15, 100, 20)];
       //[_header setFont:[UIFont fontWithName:@"Helvetica Neue" size:10.0]];
       //_header.text = @"Graph View";
        
       // [self addSubview:_header];
        
        
        [self addTopBorderWithHeight:0.5f andColor:[UIColor lightGrayColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
