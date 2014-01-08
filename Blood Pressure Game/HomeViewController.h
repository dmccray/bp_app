//
//  HomeViewController.h
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/7/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeGraphView;
@class HomeButtonNavView;
@class HomeReminderView;

@interface HomeViewController : UIViewController
@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) HomeGraphView *homeGraphView;
@property (strong, nonatomic) HomeButtonNavView *homeButtonNavView;
@property (strong, nonatomic) HomeReminderView *homeReminderView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

