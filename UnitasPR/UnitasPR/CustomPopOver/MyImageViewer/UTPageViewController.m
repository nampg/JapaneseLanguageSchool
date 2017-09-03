//
//  UTPageViewController.m
//  TestPageViewControllerImageViewer
//
//  Created by ナム on 13/05/18.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import "UTPageViewController.h"
#import "UTScrollsViewController.h"
@interface UTPageViewController ()
@property NSMutableArray *pages;
@end

@implementation UTPageViewController
@synthesize pages = _pages;
@synthesize numberOfMonth = _numberOfMonth;
@synthesize sizeImage = _sizeImage;
@synthesize rectImage = _rectImage;
@synthesize numberOfCurrentPage = _numberOfCurrentPage;

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
    
    if (_numberOfMonth.intValue != 1) {
        _sizeImage = CGSizeMake(600, 420);
        _rectImage = CGRectMake(0, 0, 600, 420);
    }else{
        _sizeImage = CGSizeMake(420, 600);
        _rectImage = CGRectMake(0, 0, 420, 600);
    }
    
    [self setNumberOfCurrentPage:[NSNumber numberWithInt:0]];
    
    [self createPages];
    self.dataSource = self;
    //[self setViewControllers:_pages direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self setViewControllers:[NSArray arrayWithObject:[self.pages objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:true completion:nil];
    
}


-(void) createPages{
    
    self.pages = [[NSMutableArray alloc]initWithCapacity:_numberOfMonth.intValue];
    
    for (int i = 1; i <= 10; i++) {
        UTScrollsViewController *scrollView = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"UTScrollsViewController"];
        [scrollView setRectImage:_rectImage];
        [scrollView setSizeImage:_sizeImage];
        [scrollView setImageName:[NSString stringWithFormat:@"event-%d-%d.jpg",_numberOfMonth.intValue,i]];
        
        //[scrollView.view setFrame:_rectImage];
        [self.pages addObject:scrollView];
        
    }
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    UTScrollsViewController * view = nil;
    
    if (_numberOfCurrentPage.intValue != 9){
        view = [_pages objectAtIndex:_numberOfCurrentPage.intValue+1];
        
        [self setNumberOfCurrentPage:[NSNumber numberWithInt:_numberOfCurrentPage.intValue+1]];
//        for (int i = 0; i < 9; i++) {
//            if ([self.pages objectAtIndex:i] == viewController){
//                view = [self.pages objectAtIndex:i+1];
//                break;
//            }
//        }
    }
    return view;
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    UTScrollsViewController * view = nil;
    
    if (_numberOfCurrentPage.intValue != 0){
        view = [_pages objectAtIndex:_numberOfCurrentPage.intValue-1];
        
        [self setNumberOfCurrentPage:[NSNumber numberWithInt:_numberOfCurrentPage.intValue-1]];
//        for (int i = 9; i > 0 ; i--) {
//            if ([self.pages objectAtIndex:i] == viewController){
//                view = [self.pages objectAtIndex:i-1];
//                break;
//            }
//        }
        
    }
    return view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
