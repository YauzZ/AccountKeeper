//
//  FirstViewController.m
//  AccountKeeper
//
//  Created by Colin Yang Hong on 13-9-27.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem.title = @"返回";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
