//
//  BPReadingViewController.h
//  Blood Pressure Game
//
//  Created by Derrick McCray on 12/31/13.
//  Copyright (c) 2013 Derrick McCray. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BPReadingView;

@interface BPReadingViewController : UIViewController

@property (strong, nonatomic) BPReadingView *bpReadingView;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
