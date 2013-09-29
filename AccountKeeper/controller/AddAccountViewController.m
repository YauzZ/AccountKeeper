//
//  AddAccountViewController.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-29.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "AddAccountViewController.h"
#import "CoreDataManager.h"

@interface AddAccountViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *typeLabel;
@property (weak, nonatomic) IBOutlet UITextField *amount;
- (IBAction)tapBlankView:(id)sender;

- (IBAction)saveAccount:(id)sender;
@end

@implementation AddAccountViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (_account != nil) {
        _nameLabel.text = _account.name;
        _amount.text = [_account.amount description];
        _typeLabel.text = _account.type;
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.account = nil;
}

- (IBAction)tapBlankView:(id)sender
{
    [_nameLabel resignFirstResponder];
    [_typeLabel resignFirstResponder];
    [_amount resignFirstResponder];
}

- (IBAction)saveAccount:(id)sender
{
    CoreDataManager *cdManager = [CoreDataManager defaultInstance];
    
    if (_account == nil) {
        self.account = (Accounts *)[cdManager getEntityWithName:@"Account"];
    }
    
    _account.name = _nameLabel.text;
    _account.amount = [NSNumber numberWithDouble:[_amount.text doubleValue]];
    _account.type = _typeLabel.text;
    
    [cdManager saveEntity:_account];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
