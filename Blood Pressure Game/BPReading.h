//
//  BPReading.h
//  Blood Pressure Game
//
//  Created by Derrick McCray on 12/31/13.
//  Copyright (c) 2013 Derrick McCray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPReading : NSManagedObject

@property (strong, nonatomic) NSDate    *readingInstant;
@property (strong, nonatomic) NSDate    *entryTime;
@property (strong, nonatomic) NSNumber  *systolic;
@property (strong, nonatomic) NSNumber  *diastolic;
@property (strong, nonatomic) NSNumber  *heartRate;
@property (strong, nonatomic) NSNumber  *weight;
@property (strong, nonatomic) NSString  *comment;

@end
