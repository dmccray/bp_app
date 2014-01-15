//
//  BPReadingView.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/14/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import "BPReadingView.h"

//Constants
const float LEFTMARGIN = 50.0f;
const float FIELDWIDTH = 100.0f;
const float FIELDHEIGHT = 40.0f;
const float HORZBUFFER = 125.0f;
const float VERTBUFFER = 75.0f;
const float VERTBUFFER2 = 65.0f;
const float LABELVERTBUFFER = 30.0f;
const float LABELHORZBUFFER = 5.0f;

@interface BPReadingView ()
@property NSDate *edittableReadingInstant;
@end

@implementation BPReadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       //[self setBackgroundColor:[UIColor grayColor]];
        
        _edittableReadingInstant = [NSDate date];
        _readingInstantTextField = [[UITextField alloc] initWithFrame:CGRectMake(LABELHORZBUFFER, 70, 175, 20)];
        _readingInstantTextField.enabled = NO;
        _readingInstantTextField.borderStyle = UITextBorderStyleRoundedRect;
        _readingInstantTextField.placeholder = @"systolic mm/hh...";
        _readingInstantTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _readingInstantTextField.returnKeyType = UIReturnKeyNext;
        _readingInstantTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _readingInstantTextField.text = [NSDateFormatter localizedStringFromDate:_edittableReadingInstant dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
        _readingInstantTextField.delegate = self;
        
        UIButton *editReadingInstantButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [editReadingInstantButton setFrame:CGRectMake(180, 70, 50, 20)];
        [editReadingInstantButton setTitle:@"Edit" forState:UIControlStateNormal];
        [editReadingInstantButton addTarget:self action:@selector(editReadingInstantPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        _systolicTextField = [[UITextField alloc] initWithFrame:CGRectMake(LEFTMARGIN, 70 + VERTBUFFER, FIELDWIDTH, FIELDHEIGHT)];
        _systolicTextField.borderStyle = UITextBorderStyleRoundedRect;
        _systolicTextField.placeholder = @"systolic mm/hh...";
        _systolicTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _systolicTextField.returnKeyType = UIReturnKeyDone;
        _systolicTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _systolicTextField.delegate = self;
        
        UILabel *systolicLabel =[[UILabel alloc] initWithFrame:CGRectMake(LEFTMARGIN + LABELHORZBUFFER, (70 + VERTBUFFER) - LABELVERTBUFFER, FIELDWIDTH, FIELDHEIGHT)];
        //systolicLabel.font = [UIFont systemFontOfSize:12.0];
        systolicLabel.text = @"Systolic:";
        
        UILabel *slashLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTMARGIN + HORZBUFFER - 18, 70 + VERTBUFFER, 25, FIELDHEIGHT)];
        slashLabel.font = [UIFont systemFontOfSize:30.0];
        slashLabel.text = @"/";
        
        _diastolicTextField = [[UITextField alloc] initWithFrame:CGRectMake(LEFTMARGIN + HORZBUFFER, 70 + VERTBUFFER, FIELDWIDTH, FIELDHEIGHT)];
        _diastolicTextField.borderStyle = UITextBorderStyleRoundedRect;
        _diastolicTextField.placeholder = @"diastolic mm/hh..";
        _diastolicTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _diastolicTextField.returnKeyType = UIReturnKeyDone;
        _diastolicTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
        _diastolicTextField.delegate = self;
        
        UILabel *diastolicLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTMARGIN + HORZBUFFER + LABELHORZBUFFER, (70 + VERTBUFFER) - LABELVERTBUFFER, FIELDWIDTH, FIELDHEIGHT)];
        //diastolicLabel.font = [UIFont systemFontOfSize:12.0];
        diastolicLabel.text = @"Diastolic:";
        
        UILabel *heartRateLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTMARGIN + LABELHORZBUFFER, 75 + (VERTBUFFER2 * 2), FIELDWIDTH, FIELDHEIGHT)];
        //heartRateLabel.font = [UIFont systemFontOfSize:12.0];
        heartRateLabel.text = @"Pulse:";
        
        _heartRateTextField = [[UITextField alloc] initWithFrame:CGRectMake(LEFTMARGIN + HORZBUFFER, 75 + (VERTBUFFER2 * 2), FIELDWIDTH, FIELDHEIGHT)];
        _heartRateTextField.borderStyle = UITextBorderStyleRoundedRect;
        _heartRateTextField.placeholder = @"bpm";
        _heartRateTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _heartRateTextField.returnKeyType = UIReturnKeyDone;
        _heartRateTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
        _heartRateTextField.delegate = self;
        
        UILabel *weightLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTMARGIN + LABELHORZBUFFER, 70 + (VERTBUFFER2 * 3), FIELDWIDTH, FIELDHEIGHT)];
        //weightLabel.font = [UIFont systemFontOfSize:12.0];
        weightLabel.text = @"Weight:";
        
        _weightTextField = [[UITextField alloc] initWithFrame:CGRectMake(LEFTMARGIN + HORZBUFFER, 70 + (VERTBUFFER2 * 3), FIELDWIDTH, FIELDHEIGHT)];
        _weightTextField.borderStyle = UITextBorderStyleRoundedRect;
        _weightTextField.placeholder = @"lbs";
        _weightTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _weightTextField.returnKeyType = UIReturnKeyDone;
        _weightTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
        _weightTextField.delegate = self;
        
        _commentTextArea = [[UITextView alloc] initWithFrame:CGRectMake(LABELHORZBUFFER, 70 + (VERTBUFFER2 * 4), FIELDWIDTH * 4, FIELDHEIGHT * 2)];
        _commentTextArea.keyboardType = UIKeyboardAppearanceDefault;
        _commentTextArea.returnKeyType = UIReturnKeyDone;
        _commentTextArea.delegate = self;
        
        UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
        [tapBackground setNumberOfTapsRequired:1];
        [self addGestureRecognizer:tapBackground];
        
        
        [self addSubview:_readingInstantTextField];
        [self addSubview:editReadingInstantButton];
        
        [self addSubview:systolicLabel];
        [self addSubview:_systolicTextField];
        [self addSubview:slashLabel];
        [self addSubview:diastolicLabel];
        [self addSubview:_diastolicTextField];
        [self addSubview:heartRateLabel];
        [self addSubview:_heartRateTextField];
        [self addSubview:weightLabel];
        [self addSubview:_weightTextField];
        //[self addSubview:_commentTextArea];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (void)dismissKeyboard:(id)sender
{
    //[self endEditing:YES];
    [_commentTextArea resignFirstResponder];
    

}

- (void)editReadingInstantPressed:(UIButton *)sender
{

       //  _readingInstantTextField.enabled = YES;
       
       UIViewController *datePickerViewController = [[UIViewController alloc] init];
       UIView *datePickerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
       UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(5, 70, 175, 20)];
       UIButton *submitNewReadingInstantButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
       [datePickerView addSubview:datePicker];
       [datePickerViewController setView:datePickerView];
    
       [submitNewReadingInstantButton setFrame:CGRectMake(60,350,200,44)];
       [submitNewReadingInstantButton setTitle:@"Submit New Date/Time" forState:UIControlStateNormal];
       //[editReadingInstantButton addTarget:self action:@selector(editReadingInstantPressed:) forControlEvents:UIControlEventTouchUpInside];
    
       NSLog(@"editReadingInstantPressed sender:%@", sender.titleLabel.text);
    
       [self.parentViewController.navigationController pushViewController:datePickerViewController animated:YES];
    
//       [UIView animateWithDuration:0.75
//                        animations:^{
//                            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//                            [self.parentViewController.navigationController pushViewController:datePickerViewController animated:NO];
//                            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.parentViewController.navigationController.view cache:NO];
//                                    }];
       
  
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
