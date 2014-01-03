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
@property (nonatomic) NSNumber          *systolic;
@property (nonatomic) NSNumber          *diastolic;
@property (nonatomic) NSNumber          *heartRate;
@property (nonatomic) NSNumber          *weight; 
@property (strong, nonatomic) NSString  *comment;

@end
