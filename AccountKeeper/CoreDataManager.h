//
//  CoreDataManager.h
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-29.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CoreDataManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;

- (void)saveEntity:(id)entry;
- (void)deleteEntity:(id)entry;
- (NSMutableArray *)fetchDataWithEntity:(NSString *)entityName bySortDescriptors:(NSArray *)sortDescriptors;

+ (id)defaultInstance;

@end
