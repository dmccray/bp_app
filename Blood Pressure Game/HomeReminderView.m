//
//  HomeReminderView.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/7/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import "HomeReminderView.h"
#import "UIView+Borders.h"

@implementation HomeReminderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _header = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x +15, frame.origin.y +15, 100, 200)];
        [_header setFont:[UIFont fontWithName:@"Helvetica Neue" size:10.0]];
        //[_header setTextColor:[UIColor blackColor]];
        _header.text = @"Reminders/Game Badges";
        
        NSLog(@"Reminder Label Frame: %f, %f, %f, %f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        
        [self addTopBorderWithHeight:0.5f andColor:[UIColor lightGrayColor]];
        
        [self addSubview:_header];
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
