//
//  FailedBankInfo.h
//  FailedBankCD
//
//  Created by ShiYu on 13-12-23.
//  Copyright (c) 2013年 Gionee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FailedBankDetails;

@interface FailedBankInfo : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) FailedBankDetails *details;

@end
