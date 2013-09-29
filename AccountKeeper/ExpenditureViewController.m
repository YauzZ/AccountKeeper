//
//  ExpenditureViewController.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-29.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "ExpenditureViewController.h"
#import "AppDelegate.h"
#import "Expenditure.h"

@interface ExpenditureViewController ()

@property (strong) AppDelegate *myDelegate;
@property (strong) NSMutableArray *objects;

@end

@implementation ExpenditureViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
// 测试数据
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Expenditure" inManagedObjectContext:[self.myDelegate managedObjectContext]];
//    for (int i = 0; i < 10; i++) {
//        Expenditure *test = [[Expenditure alloc] initWithEntity:entity insertIntoManagedObjectContext:[self.myDelegate managedObjectContext]];
//        test.category = @"吃饭";
//        test.date = [NSDate date];
//        test.amount = [NSNumber numberWithInt:i];
//        [self.myDelegate saveContext];
//    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self updateData];
    [self.tableView reloadData];
}

// 查询操作
- (void)updateData
{
    //创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    //设置要检索哪种类型的实体对象 (Student)
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Expenditure" inManagedObjectContext:self.myDelegate.managedObjectContext];
    
    //设置请求实体
    [request setEntity:entity];
    
    //指定对结果的排序方式 (对data字段进行排序)
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date"ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    
    NSError *error = nil;
    //执行获取数据请求，返回数组
    NSMutableArray *mutableFetchResult = [[self.myDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    self.objects = mutableFetchResult;
    
    NSLog(@"The count of entry:%i",[self.objects count]);
    
    // 遍历所有取得的数据
    for (Expenditure *expend in self.objects) {
        NSLog(@"%@",expend);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Expenditure *expend = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = expend.category;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",expend.amount];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
