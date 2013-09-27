//
//  Income.h
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-27.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Accounts;

@interface Income : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * annotations;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Accounts *toAccount;

@end
