//
//  BPReadingView.h
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/14/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPReadingView : UIView <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) UITextField *readingInstantTextField;
@property (strong, nonatomic) UITextField *systolicTextField;
@property (strong, nonatomic) UITextField *diastolicTextField;
@property (strong, nonatomic) UITextField *heartRateTextField;
@property (strong, nonatomic) UITextField *weightTextField;
@property (strong, nonatomic) UITextView *commentTextArea;

@property (strong, nonatomic) UIViewController *parentViewController;

@end
