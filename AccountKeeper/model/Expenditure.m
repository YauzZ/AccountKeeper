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

@end
