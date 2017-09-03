//
//  UTEventsViewController.m
//  UnitasPR
//
//  Created by ナム on 13/05/14.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

//#import "UTEventsViewController.h"
#import "UTEventsViewController.h"

#import "PhotoViewController.h"


@interface UTEventsViewController ()

@end

@implementation UTEventsViewController
@synthesize customPopoverController = _customPopoverController;
@synthesize numberOfMaxImage = _numberOfMaxImage;

//@synthesize localCaptions = _localCaptions;
//@synthesize localImages = _localImages;
@synthesize numberOfCurrentMonth = _numberOfCurrentMonth;

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
    self.isInView = [NSString stringWithFormat:@"Events"];
    [self setNumberOfMaxImage:5];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
    [self setCustomPopoverController:nil];
    [super viewDidUnload];
    
}
- (IBAction)btnEventsEachGatsu:(id)sender {
    
    UIButton *btnSender = (UIButton*)sender;
    [self setNumberOfCurrentMonth:[NSNumber numberWithInt:btnSender.tag]];
//    UIButton *bttSender = (UIButton*)sender;
//    UTPopoverPageViewController *customPopOver = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"UTPopoverPageViewController"];
//
//    //UTPopoverPageViewController *customPopOver = [[UTPopoverPageViewController alloc] init];
//
////    [customPopOver setNumberOfImages:[NSNumber numberWithInt:10]];
////    [customPopOver setNumberOfMonth:[NSNumber numberWithInt:bttSender.tag]];
//
//
//
//    [customPopOver.view setFrame:CGRectMake(0, 0, 600, 420)];
//    _customPopoverController = [[UIPopoverController alloc] initWithContentViewController:customPopOver];
//    //[_customPopoverController setPopoverContentSize:customPopOver.view.frame.size];
//
//    [_customPopoverController presentPopoverFromRect:CGRectMake(100, 70, 1, 1) inView:bttSender.viewForBaselineLayout permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    
    
//    UTPageViewController *pageViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"UTPageViewController"];
//    [pageViewController setNumberOfMonth:[NSNumber numberWithInt:btnSender.tag]];
    
//    UTImageViewerViewController *imageViewerViewController = [[UTImageViewerViewController alloc] init];
//    
//    _customPopoverController = [[UIPopoverController alloc] initWithContentViewController:imageViewerViewController];
//    if (btnSender.tag != 1) {
//        [_customPopoverController setPopoverContentSize:CGSizeMake(600, 420) animated:YES];
//    }else{
//        [_customPopoverController setPopoverContentSize:CGSizeMake(420, 600) animated:YES];
//    }
//    
//    
//    [_customPopoverController presentPopoverFromRect:CGRectMake(100, 70, 1, 1) inView:btnSender.viewForBaselineLayout permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    
    PhotoViewController *pageZero;
    NSInteger minValue = _numberOfMaxImage * (_numberOfCurrentMonth.intValue-1);
    //int current = currentIndexOfMonth.intValue;
    pageZero = [PhotoViewController photoViewControllerForPageIndex:minValue];
    UTImagePageViewController *pageViewController;
    
    if (btnSender.tag == 1) {
        pageViewController = [[UTImagePageViewController alloc] init2];
        
    }else
        pageViewController = [[UTImagePageViewController alloc] init1];
    pageViewController.dataSource = self;
    
    [pageViewController setViewControllers:@[pageZero]
                                 direction:UIPageViewControllerNavigationDirectionForward
                                  animated:NO
                                completion:NULL];
//    UIButton *btnDissmissModalView = [[UIButton alloc] initWithFrame:CGRectMake(600, 50, 40, 40)];
//    [btnDissmissModalView setImage:[UIImage imageNamed:@"button_cancel.png"] forState:UIControlStateNormal];
//    [btnDissmissModalView addTarget:self action:@selector(cancelPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [pageViewController.view addSubview:btnDissmissModalView];
//    [pageViewController.view setBackgroundColor:[UIColor clearColor]];
    //[pageViewController.view setFrame:CGRectMake(0, 0, 420, 600)];
    
//    [self presentModalViewController:pageViewController animated:YES];
    
    _customPopoverController = [[UIPopoverController alloc] initWithContentViewController:pageViewController];
    
    [_customPopoverController presentPopoverFromRect:CGRectMake(100, 70, 1, 1) inView:btnSender.viewForBaselineLayout permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}



- (void)cancelPressed:(UIButton*)sender{
    [self dismissModalViewControllerAnimated:YES];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pvc viewControllerBeforeViewController:(PhotoViewController *)vc
{
    
    NSInteger minValue = _numberOfMaxImage * (_numberOfCurrentMonth.intValue-1);
    NSInteger maxValue = _numberOfMaxImage * _numberOfCurrentMonth.intValue -1;
    NSUInteger index = vc.pageIndex - 1;
    if (index >= minValue && index <= maxValue)
        return [PhotoViewController photoViewControllerForPageIndex:index];
    else
        return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pvc viewControllerAfterViewController:(PhotoViewController *)vc
{
    
    NSInteger minValue = _numberOfMaxImage * (_numberOfCurrentMonth.intValue-1);
    NSInteger maxValue = _numberOfMaxImage * _numberOfCurrentMonth.intValue -1;
    NSUInteger index = vc.pageIndex + 1;
    if (index >= minValue && index <= maxValue)
        return [PhotoViewController photoViewControllerForPageIndex:index];
    else
        return nil;
}

@end
