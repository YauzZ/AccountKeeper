//
//  AddIncomeViewController.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-29.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "AddIncomeViewController.h"
#import "CoreDataManager.h"

@interface AddIncomeViewController ()

- (IBAction)tapBlankView:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *annotation;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *amount;
- (IBAction)saveIncome:(id)sender;

@end

@implementation AddIncomeViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    if (_income != nil) {
        _titleLabel.text = _income.title;
        _amount.text = [_income.amount description];
        _datePicker.date = _income.date;
        _annotation.text = _income.annotations;
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.income = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveIncome:(id)sender
{
    CoreDataManager *cdManager = [CoreDataManager defaultInstance];
    
    if (_income == nil) {
        self.income = (Income *)[cdManager getEntityWithName:@"Income"];
    }
    
    _income.amount = [NSNumber numberWithDouble:[_amount.text doubleValue]];
    _income.title = _titleLabel.text;
    _income.date = _datePicker.date;
    _income.annotations = _annotation.text;
    
    [cdManager saveEntity:_income];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)tapBlankView:(id)sender
{
    [_titleLabel resignFirstResponder];
    [_amount resignFirstResponder];
    [_annotation resignFirstResponder];
}
@end
