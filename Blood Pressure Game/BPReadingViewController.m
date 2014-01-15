//
//  BPReadingViewController.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 12/31/13.
//  Copyright (c) 2013 Derrick McCray. All rights reserved.
//

#import "BPReadingViewController.h"
#import "BPReadingView.h"
#import "BPReading.h"

@interface BPReadingViewController ()

@end

@implementation BPReadingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"BP Reading View"];
    }
    return self;
}

- (void)loadView
{
    _bpReadingView = [[BPReadingView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _bpReadingView.parentViewController = self;
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonPressed:)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = saveButton;
   
    [self setView:_bpReadingView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)saveButtonPressed:(UIButton *)sender
{
    //Should do some validation first. I believe that happens in another delagate method.
    BPReading *bpr = [[BPReading alloc] initWithEntity:[NSEntityDescription entityForName:@"BPReading" inManagedObjectContext:_managedObjectContext] insertIntoManagedObjectContext:_managedObjectContext];

    bpr.entryTime = [NSDate date];
    bpr.systolic = [NSNumber numberWithInt:_bpReadingView.systolicTextField.text.intValue];
    bpr.diastolic = [NSNumber numberWithInt:_bpReadingView.diastolicTextField.text.intValue];
    bpr.heartRate = [NSNumber numberWithInt:_bpReadingView.heartRateTextField.text.intValue];
    bpr.weight = [NSNumber numberWithInt:_bpReadingView.weightTextField.text.intValue];

    bpr.readingInstant = [NSDate date]; //need to update to pull from input text field or picker
    bpr.comment = @"need to implement"; // need to implement
    
    NSLog(@"%@", bpr);
    
    NSError *error;
    [_managedObjectContext save:&error];
    
    _bpReadingView.systolicTextField.text = nil;
    _bpReadingView.diastolicTextField.text = nil;
    _bpReadingView.heartRateTextField.text = nil;
    _bpReadingView.weightTextField.text = nil;
    _bpReadingView.readingInstantTextField.text = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    _bpReadingView.commentTextArea.text = nil;
    
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    [UIView animateWithDuration:0.50
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [self.navigationController popToRootViewControllerAnimated:YES];  //remember blocks are closures and therefore the view controller is in scope
                         [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO];
                         }];
}

@end
