//
//  Expenditure.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-27.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "Expenditure.h"
#import "Accounts.h"


@implementation Expenditure

@dynamic amount;
@dynamic date;
@dynamic category;
@dynamic subcategory;
@dynamic annotations;
@dynamic fromAccount;

- (NSString *)description
{
    return [NSString stringWithFormat:@"expend %0.2f by %@ at %@",[self.amount doubleValue],self.category,self.date];
}


+ (void)deleteExpend:(id)entry inManagedObjectContext:(NSManagedObjectContext *)context
{
    [context deleteObject:entry];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
}

+ (void)saveExpend:(id)entry inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSError *error;
    
    //托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [context save:&error];
    
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
}

@end
