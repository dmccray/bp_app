//
//  BPReadingViewController.h
//  Blood Pressure Game
//
//  Created by Derrick McCray on 12/31/13.
//  Copyright (c) 2013 Derrick McCray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPReadingViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *systolicTextField;
@property (strong, nonatomic) UITextField *diastolicTextField;
@property (strong, nonatomic) UITextField *heartRateTextField;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
