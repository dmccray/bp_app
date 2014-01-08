//
//  HomeViewController.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/7/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeGraphView.h"
#import "HomeButtonNavView.h"
#import "HomeReminderView.h"
#import "UIView+Borders.h"
#import "BPReadingViewController.h"
#import "BPLogViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];  //hide NavBar on home view
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];    //show NavBar on subsequent views
    [super viewWillDisappear:animated];
}

- (void)loadView
{
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    CGRect screenFrame = CGRectMake(windowFrame.origin.x, windowFrame.origin.y + 20, windowFrame.size.width, windowFrame.size.height -20);
    
    float screenOffset = screenFrame.size.height / 3;

    NSLog(@"Background frame: %f, %f, %f, %f", screenFrame.origin.x, screenFrame.origin.y, screenFrame.size.width, screenFrame.size.height);
    
    //CGSize size = screenFrame.
    _backgroundView = [[UIView alloc] initWithFrame:screenFrame];
    
    //topGraphView
    _homeGraphView = [[HomeGraphView alloc] initWithFrame:CGRectMake(screenFrame.origin.x, screenFrame.origin.y, screenFrame.size.width, screenFrame.size.height/3)];

    //buttonNavView
    _homeButtonNavView = [[HomeButtonNavView alloc] initWithFrame:CGRectMake(screenFrame.origin.x, screenFrame.origin.y + screenOffset, screenFrame.size.width, screenFrame.size.height/3)];
    [_homeButtonNavView.readingButton addTarget:self action:@selector(readingButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_homeButtonNavView.logButton addTarget:self action:@selector(logButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_homeButtonNavView.friendsButton addTarget:self action:@selector(friendsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_homeButtonNavView.exportButton addTarget:self action:@selector(exportButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    //homeReminderView
    _homeReminderView = [[HomeReminderView alloc] initWithFrame:CGRectMake(screenFrame.origin.x, screenFrame.origin.y + (screenOffset * 2), screenFrame.size.width, screenFrame.size.height/3)];
    //[_homeReminderView setBackgroundColor:[UIColor cyanColor]];
    
    [_backgroundView addSubview:_homeGraphView];
    [_backgroundView addSubview:_homeButtonNavView];
    [_backgroundView addSubview:_homeReminderView];
    [self setView:_backgroundView];

}

- (void)readingButtonPressed:(UIButton *)sender
{
    BPReadingViewController *bprvc = [[BPReadingViewController alloc] init];
    bprvc.managedObjectContext = self.managedObjectContext;
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [self.navigationController pushViewController:bprvc animated:NO];  //remember blocks are closures and therefore the view controller is in scope
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }];
    

    //[[self navigationController] pushViewController:bprvc animated:YES];
}

- (void)logButtonPressed:(UIButton *)sender
{
    BPLogViewController *bplvc = [[BPLogViewController alloc] init];
    bplvc.managedObjectContext = self.managedObjectContext;
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [self.navigationController pushViewController:bplvc animated:NO];  //remember blocks are closures and therefore the view controller is in scope
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }];
}

- (void)friendsButtonPressed:(UIButton *)sender
{
    
}

- (void)exportButtonPressed:(UIButton *)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
