//
//  UTBaseViewController.m
//  UnitasPR
//
//  Created by ナム on 13/05/14.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import "UTBaseViewController.h"
#import "UTEventsViewController.h"
#import "UTCourceViewController.h"
#import "UTLifeViewController.h"
#import "UTGeneralViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface UTBaseViewController ()

@end

@implementation UTBaseViewController
@synthesize mainViewInEachController = _mainViewInEachController;
@synthesize isInView = _isInView;
@synthesize btnMenuInEachController = _btnMenuInEachController;
@synthesize btnToHideMenu = _btnToHideMenu;
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
    _isInView = [NSString stringWithFormat:@"Events"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnGeneralPressed:(id)sender {
    
    if (![_isInView isEqualToString:@"General"]){
        UTGeneralViewController *generalViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"GenerallViewController"];
        [self.navigationController pushViewController:generalViewController animated:YES];
//        [UIView  beginAnimations:nil context:NULL];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//        [UIView setAnimationDuration:0.75];
//        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO];
//        [self.navigationController pushViewController:generalViewController animated:YES];
//        [UIView commitAnimations];
        
    }else{
        [self slideViewToHideMenu];
    }
    
}

- (IBAction)btnEventsPressed:(id)sender {
    if (![_isInView isEqualToString:@"Events"]) {
        
        UTEventsViewController *eventsViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"EventsViewController"];
        [self.navigationController pushViewController:eventsViewController animated:YES];

    }else{
        [self slideViewToHideMenu];
    }
    
}

- (IBAction)btnCourcePressed:(id)sender {
    if (![_isInView isEqualToString:@"Cource"]){
        UTEventsViewController *courceViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"CourceViewController"];
        [self.navigationController pushViewController:courceViewController animated:YES];
    }else{
        [self slideViewToHideMenu];
    }
    
}

- (IBAction)btnLifePressed:(id)sender {
    if (![_isInView isEqualToString:@"Life"]){
        UTEventsViewController *lifeViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"LifeViewController"];
        [self.navigationController pushViewController:lifeViewController animated:YES];
    }else{
        [self slideViewToHideMenu];
    }
    
}

- (IBAction)btnMenuPressed:(id)sender {
    
    if (_btnMenuInEachController.tag == 0) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [_mainViewInEachController setFrame:CGRectMake(190, 0, _mainViewInEachController.frame.size.width, _mainViewInEachController.frame.size.height)];
        [UIView commitAnimations];
        [_btnMenuInEachController setTag:1];
        [_btnToHideMenu setHidden:NO];
    }else{
        [self slideViewToHideMenu];
    }
}

- (IBAction)btnToHideMenuPressed:(id)sender {
    [self slideViewToHideMenu];
}

- (void)slideViewToHideMenu{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [_mainViewInEachController setFrame:CGRectMake(0, 0, _mainViewInEachController.frame.size.width, _mainViewInEachController.frame.size.height)];
    [UIView commitAnimations];
    [_btnMenuInEachController setTag:0];
    [_btnToHideMenu setHidden:YES];
}

- (void)viewDidUnload {
    [self setMainViewInEachController:nil];
    [self setIsInView:nil];
    [self setBtnMenuInEachController:nil];
    [self setBtnToHideMenu:nil];
    [super viewDidUnload];
}
@end
