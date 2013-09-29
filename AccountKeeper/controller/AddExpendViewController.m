//
//  AddExpendViewController.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-29.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "AddExpendViewController.h"
#import "AppDelegate.h"
#import "Expenditure.h"

@interface AddExpendViewController ()

@property (strong) AppDelegate *myDelegate;

@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UIDatePicker *currentDate;
@property (weak, nonatomic) IBOutlet UITextField *category;

- (IBAction)save:(id)sender;

@end

@implementation AddExpendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    [self saveExpend];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveExpend
{
    Expenditure *expend = (Expenditure *)[NSEntityDescription insertNewObjectForEntityForName:@"Expenditure" inManagedObjectContext:self.myDelegate.managedObjectContext];
    expend.amount = [NSNumber numberWithDouble:[_amount.text doubleValue]];
    expend.category = _category.text;
    expend.date = [_currentDate date];
    
    NSError *error;
    
    //托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [self.myDelegate.managedObjectContext save:&error];
    
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
}
@end
