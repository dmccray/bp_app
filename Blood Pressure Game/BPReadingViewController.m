//
//  BPReadingViewController.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 12/31/13.
//  Copyright (c) 2013 Derrick McCray. All rights reserved.
//

#import "BPReadingViewController.h"
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[self view] setBackgroundColor:[UIColor grayColor]];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setFrame:CGRectMake(60,350,200,44)];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submitButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.systolicTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 75, 100, 44)];
    self.systolicTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.systolicTextField.placeholder = @"systolic mm/hh...";
    self.systolicTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.systolicTextField.returnKeyType = UIReturnKeyNext;
    self.systolicTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.systolicTextField.delegate = self;
    
    UILabel *systolicLabel =[[UILabel alloc] initWithFrame:CGRectMake(60, 25, 200, 44)];
    systolicLabel.text = @"Enter Systolic Value:";
    
    self.diastolicTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 175, 100, 44)];
    self.diastolicTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.diastolicTextField.placeholder = @"diastolic mm/hh..";
    self.diastolicTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.diastolicTextField.returnKeyType = UIReturnKeyNext;
    self.diastolicTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    self.diastolicTextField.delegate = self;
    
    UILabel *diastolicLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 125, 200, 44)];
    diastolicLabel.text = @"Enter Diastolic Value:";
    
    self.heartRateTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 275, 100, 44)];
    self.heartRateTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.heartRateTextField.placeholder = @"hr";
    self.heartRateTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.heartRateTextField.returnKeyType = UIReturnKeyDone;
    self.heartRateTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    self.heartRateTextField.delegate = self;
    
    UILabel *heartRateLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 225, 200, 44)];
    heartRateLabel.text = @"Enter Heart Rate:";
    
    [self.view addSubview:systolicLabel];
    [self.view addSubview:self.systolicTextField];
    [self.view addSubview:diastolicLabel];
    [self.view addSubview:self.diastolicTextField];
    [self.view addSubview:heartRateLabel];
    [self.view addSubview:self.heartRateTextField];
    [self.view addSubview:submitButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void)submitButton:(UIButton *)sender
{
    //Should do some validation first. I believe that happens in another delagate method.
    BPReading *bpr = [[BPReading alloc] initWithEntity:[NSEntityDescription entityForName:@"BPReading" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    
    bpr.systolic = [NSNumber numberWithInt:self.systolicTextField.text.intValue];
    bpr.diastolic = [NSNumber numberWithInt:self.diastolicTextField.text.intValue];
    bpr.heartRate = [NSNumber numberWithInt:self.heartRateTextField.text.intValue];
    bpr.readingInstant = [NSDate date];
    
    NSLog(@"%@", bpr);
    
    NSError *error;
    [self.managedObjectContext save:&error];
    
    self.systolicTextField.text = @"";
    self.diastolicTextField.text = @"";
    self.heartRateTextField.text = @"";
}

@end
