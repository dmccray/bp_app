//
//  BPReading.m
//  Blood Pressure Game
//
//  Created by Derrick McCray on 12/31/13.
//  Copyright (c) 2013 Derrick McCray. All rights reserved.
//

#import "BPReading.h"

@implementation BPReading
@dynamic entryTime;
@dynamic readingInstant;
@dynamic systolic;
@dynamic diastolic;
@dynamic heartRate;
@dynamic weight;
@dynamic comment;

- (NSString *)description
{
    return [NSString stringWithFormat:@"timestamp:%@ - systolic:%@ diastolic:%@, pulse:%@ weight:%@, comment:%@", self.readingInstant, self.systolic, self.diastolic, self.heartRate, self.weight, self.comment];
}

@end