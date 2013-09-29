//
//  Expenditure.h
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-27.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Accounts;

@interface Expenditure : NSManagedObject

@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * subcategory;
@property (nonatomic, retain) NSString * annotations;
@property (nonatomic, retain) Accounts *fromAccount;

+ (void)saveExpend:(id)entry inManagedObjectContext:(NSManagedObjectContext *)context;
+ (void)deleteExpend:(id)entry inManagedObjectContext:(NSManagedObjectContext *)context;

@end
