//
//  CoreDataManager.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-29.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "CoreDataManager.h"
#import "AppDelegate.h"

static id sharedInstance = nil;

@implementation CoreDataManager

+ (id)defaultInstance
{
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return sharedInstance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (NSManagedObjectContext *)context
{
    if (_context == nil) {
        AppDelegate *myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _context = myDelegate.managedObjectContext;
    }
    return _context;
}

- (void)deleteEntity:(id)entity
{
    [_context deleteObject:entity];
    
    NSError *error;
    if (![_context save:&error]) {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
}

- (void)saveEntity:(id)entity
{
    NSError *error;
    
    //托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [_context save:&error];
    
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
}

- (NSMutableArray *)fetchDataWithEntity:(NSString *)entityName bySortDescriptors:(NSArray *)sortDescriptors
{
    //创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    //设置要检索哪种类型的实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.context];
    
    //设置请求实体
    [request setEntity:entity];
    
    //指定对结果的排序方式
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error = nil;
    //执行获取数据请求，返回数组
    NSMutableArray *mutableFetchResult = [[self.context executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
        return nil;
    }
    
    NSLog(@"The count of entity:%i",[mutableFetchResult count]);
    return mutableFetchResult;
}

@end
