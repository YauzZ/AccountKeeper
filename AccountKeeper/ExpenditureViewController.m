//
//  ExpenditureViewController.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-29.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "ExpenditureViewController.h"
#import "CoreDataManager.h"
#import "Expenditure.h"
#import "AddExpendViewController.h"

@interface ExpenditureViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong) AppDelegate *myDelegate;
@property (strong) NSMutableArray *objects;

@property (assign) int selectedIndex;

@end

@implementation ExpenditureViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)addExpend
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    self.objects = [[CoreDataManager defaultInstance] fetchDataWithEntity:@"Expenditure" bySortDescriptors:@[sortDescriptor]];
    [_tableView reloadData];
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

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedIndex = indexPath.row;
    return indexPath;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        CoreDataManager *cdManager = [CoreDataManager defaultInstance];
        [cdManager deleteEntity:[_objects objectAtIndex:indexPath.row]];
        [_objects removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"SelectRow"]) {
        AddExpendViewController *viewController = segue.destinationViewController;
        NSLog(@"Selected Index.row is %d",_selectedIndex);
        viewController.expend = [_objects objectAtIndex:_selectedIndex];
    }
}


@end
