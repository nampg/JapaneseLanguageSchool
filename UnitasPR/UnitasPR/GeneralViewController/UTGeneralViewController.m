//
//  UTGeneralViewController.m
//  UnitasPR
//
//  Created by ナム on 13/05/14.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import "UTGeneralViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface UTGeneralViewController ()

@end

@implementation UTGeneralViewController
@synthesize uiScrollViewSlideImageGeneral = _uiScrollViewSlideImageGeneral;
@synthesize currentPoint = _currentPoint;
@synthesize isOrientation = _isOrientation;
@synthesize uiViewToCorner1 = _uiViewToCorner1;
@synthesize uiViewToCorner2 = _uiViewToCorner2;

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
    _currentPoint = [NSNumber numberWithInt:1];
    _isOrientation = [NSNumber numberWithInt:0];// 0 = 1--->3           1 = 1<----3
	// Do any additional setup after loading the view.
    self.isInView = [NSString stringWithFormat:@"General"];
    _uiViewToCorner1.layer.cornerRadius = 20;
    _uiViewToCorner1.layer.masksToBounds = YES;
    
    _uiViewToCorner2.layer.cornerRadius = 20;
    _uiViewToCorner2.layer.masksToBounds = YES;
//    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:nil];
//    
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSURL *baseURL = [NSURL fileURLWithPath:path];
//    
//    
//    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
//    [_uiWebViewSlideImageGenenral loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];

    UIImage *image1 = [UIImage imageNamed:@"general13.png"];
    UIImage *image2 = [UIImage imageNamed:@"general2.png"];
    UIImage *image3 = [UIImage imageNamed:@"general3.png"];
    
    NSArray *images = [[NSArray alloc] initWithObjects:image1,image2,image3,nil];
    
    // Now create a UIScrollView to hold the UIImageViews
    //_uiScrollViewSlideImageGeneral = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,1024,768)];
    
    _uiScrollViewSlideImageGeneral.pagingEnabled = YES;
    
    //[_uiScrollViewSlideImageGeneral setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
    
    int numberOfViews = 3;
    for (int i = 0; i < numberOfViews; i++) {
        CGFloat xOrigin = i * 920;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin,0,920,150)];
        [imageView setImage:[images objectAtIndex:i]];
        [_uiScrollViewSlideImageGeneral addSubview:imageView];
     
    }
    
    // Set the contentSize equal to the size of the UIImageView
    // scrollView.contentSize = imageView.scrollview.size;
    _uiScrollViewSlideImageGeneral.contentSize = CGSizeMake(numberOfViews * 920, 150);
    
    
    // Finally, add the UIScrollView to the controller's view
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timerSlideImageInGeneralView) userInfo:nil repeats:YES];
    
    
}

- (void)timerSlideImageInGeneralView{
    if ([_currentPoint isEqualToNumber:[NSNumber numberWithInt:1]]) {
        [_uiScrollViewSlideImageGeneral setContentOffset:CGPointMake(920, 0) animated:YES];
        _currentPoint = [NSNumber numberWithInt:2];
        _isOrientation = [NSNumber numberWithInt:0];
    }else if([_currentPoint isEqualToNumber:[NSNumber numberWithInt:2]]){
        if ([_isOrientation isEqualToNumber:[NSNumber numberWithInt:0]]) {
            [_uiScrollViewSlideImageGeneral setContentOffset:CGPointMake(1840, 0) animated:YES];
            _currentPoint = [NSNumber numberWithInt:3];
        }else{
            [_uiScrollViewSlideImageGeneral setContentOffset:CGPointMake(0, 0) animated:YES];
            _currentPoint = [NSNumber numberWithInt:1];
        }
        
    }else{
        [_uiScrollViewSlideImageGeneral setContentOffset:CGPointMake(920, 0) animated:YES];
        _currentPoint = [NSNumber numberWithInt:2];
        _isOrientation = [NSNumber numberWithInt:1];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewDidUnload {
    //[self setUiScrollViewImageInGeneral:nil];
    //[self setUiWebViewSlideImageGenenral:nil];
    [self setUiScrollViewSlideImageGeneral:nil];
    [self setCurrentPoint:nil];
    [self setUiViewToCorner1:nil];
    [self setUiViewToCorner2:nil];
    [super viewDidUnload];
}
@end
