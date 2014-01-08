//
//  HomeButtonNavView.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/7/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import "HomeButtonNavView.h"
#import "UIView+Borders.h"
#import "BPReadingViewController.h"

@implementation HomeButtonNavView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _readingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_readingButton setFrame:CGRectMake(0,0,frame.size.width/2,frame.size.height/2)];
        [_readingButton setTitle:@"Reading" forState:UIControlStateNormal];
        //_readingButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
        
        _logButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_logButton setFrame:CGRectMake(frame.size.width/2,0,frame.size.width/2,frame.size.height/2)];
        [_logButton setTitle:@"Log" forState:UIControlStateNormal];
        
        _friendsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_friendsButton setFrame:CGRectMake(0,frame.size.height/2,frame.size.width/2,frame.size.height/2)];
        [_friendsButton setTitle:@"Friends" forState:UIControlStateNormal];
        
        _exportButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_exportButton setFrame:CGRectMake(frame.size.width/2,frame.size.height/2,frame.size.width/2,frame.size.height/2)];
        [_exportButton setTitle:@"Data Export" forState:UIControlStateNormal];
        
        [self addTopBorderWithHeight:0.5f andColor:[UIColor lightGrayColor]];
        [_readingButton addRightBorderWithWidth:0.5f andColor:[UIColor lightGrayColor]];
        [_friendsButton addRightBorderWithWidth:0.5f andColor:[UIColor lightGrayColor]];
        [_friendsButton addTopBorderWithHeight:0.5f andColor:[UIColor lightGrayColor]];
        [_exportButton addTopBorderWithHeight:0.5f andColor:[UIColor lightGrayColor]];
                
        [self addSubview:_readingButton];
        [self addSubview:_logButton];
        [self addSubview:_friendsButton];
        [self addSubview:_exportButton];
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
