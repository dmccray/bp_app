//
//  BPLogViewController.h
//  Blood Pressure Game
//
//  Created by Derrick McCray on 1/3/14.
//  Copyright (c) 2014 Derrick McCray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface BPLogViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
