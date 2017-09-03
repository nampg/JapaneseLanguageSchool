//
//  UTImagePageViewController.m
//  UnitasPR
//
//  Created by ナム on 13/05/19.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import "UTImagePageViewController.h"

@interface UTImagePageViewController ()

@end

@implementation UTImagePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init1{
    self = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"UTImagePageViewController1"];
    return self;
}

- (id)init2{
    self = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"UTImagePageViewController2"];
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

@end
