//
//  AddExpendViewController.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-29.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "AddExpendViewController.h"
#import "AppDelegate.h"

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

- (void)viewWillAppear:(BOOL)animated
{
    if (_expend != nil) {
        _amount.text = [_expend.amount description];
        _currentDate.date = _expend.date;
        _category.text = _expend.category;
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.expend = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    if (_expend == nil) {
        self.expend = (Expenditure *)[NSEntityDescription insertNewObjectForEntityForName:@"Expenditure" inManagedObjectContext:_myDelegate.managedObjectContext];
    }
    
    _expend.amount = [NSNumber numberWithDouble:[_amount.text doubleValue]];
    _expend.category = _category.text;
    _expend.date = _currentDate.date;
    
    [Expenditure saveExpend:_expend inManagedObjectContext:self.myDelegate.managedObjectContext];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
