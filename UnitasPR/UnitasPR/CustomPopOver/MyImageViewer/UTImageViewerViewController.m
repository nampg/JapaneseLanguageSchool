//
//  UTImageViewerViewController.m
//  UnitasPR
//
//  Created by ナム on 13/05/19.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import "UTImageViewerViewController.h"


@interface UTImageViewerViewController ()

@end

@implementation UTImageViewerViewController
@synthesize viewToSlideImage = _viewToSlideImage;

@synthesize scrollViewController1 = _scrollViewController1;
@synthesize scrollViewController2 = _scrollViewController2;
@synthesize scrollViewController3 = _scrollViewController3;
@synthesize scrollViewController4 = _scrollViewController4;
@synthesize scrollViewController5 = _scrollViewController5;

@synthesize TestScrollView = _TestScrollView;
@synthesize testView = _testView;

@synthesize btnNext = _btnNext;
@synthesize btnBack = _btnBack;

@synthesize numberOfCurrentScrollView = _numberOfCurrentScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)btnNextPressed:(id)sender {
    if ([_numberOfCurrentScrollView isEqualToNumber:[NSNumber numberWithInt:5]]) {
        
    }else{
        [self setNumberOfCurrentScrollView:[NSNumber numberWithInt:_numberOfCurrentScrollView.intValue+1]];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        [_viewToSlideImage setFrame:CGRectMake(_viewToSlideImage.frame.origin.x - 600, 0, _viewToSlideImage.frame.size.width, _viewToSlideImage.frame.size.height)];
        [UIView commitAnimations];
    }
    
}

- (IBAction)btnBackPressed:(id)sender {
    if ([_numberOfCurrentScrollView isEqualToNumber:[NSNumber numberWithInt:1]]) {
        
    }else{
        [self setNumberOfCurrentScrollView:[NSNumber numberWithInt:_numberOfCurrentScrollView.intValue-1]];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        [_viewToSlideImage setFrame:CGRectMake(_viewToSlideImage.frame.origin.x + 600, 0, _viewToSlideImage.frame.size.width, _viewToSlideImage.frame.size.height)];
        [UIView commitAnimations];
    }
    
}

- (id)init{
    self = [self initWithNibName:@"UTImageViewerViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setNumberOfCurrentScrollView:[NSNumber numberWithInt:1]];
    
//    _scrollViewController1 = [[UTScrollViewController alloc] init];
//    [_scrollViewController1.view setFrame:CGRectMake(600, 0, 600, 420)];
//    [_viewToSlideImage addSubview:_scrollViewController1.view];
//    
//    _scrollViewController2 = [[UTScrollViewController alloc] init];
//    [_scrollViewController2.view setFrame:CGRectMake(0, 0, 600, 420)];
//    [_viewToSlideImage addSubview:_scrollViewController2.view];
//    
//    NSLog(@"%@", _scrollViewController2.uiScrollView.viewForBaselineLayout);
//    
//    _scrollViewController3 = [[UTScrollViewController alloc] init];
//    [_scrollViewController3.view setFrame:CGRectMake(1200, 0, 600, 420)];
//    [_viewToSlideImage addSubview:_scrollViewController3.view];
//    
//    _scrollViewController4 = [[UTScrollViewController alloc] init];
//    [_scrollViewController4.view setFrame:CGRectMake(1800, 0, 600, 420)];
//    [_viewToSlideImage addSubview:_scrollViewController4.view];
//    
//    _scrollViewController5 = [[UTScrollViewController alloc] init];
//    [_scrollViewController5.view setFrame:CGRectMake(2400, 0, 600, 420)];
//    [_viewToSlideImage addSubview:_scrollViewController5.view];
    

    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"event-2-3.jpg"]];
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"event-2-3.jpg"]];
    [image2 setFrame:CGRectMake(image.frame.size.width, 0, image2.frame.size.width, image2.frame.size.height)];
    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1200, 420)];
    [_testView addSubview:image];
    [_testView addSubview:image2];
    [_TestScrollView addSubview:_testView];
    _TestScrollView.contentSize = image.frame.size;
    //    _scrollView1.contentSize = _scrollView1.frame.size;
    _TestScrollView.minimumZoomScale = _TestScrollView.frame.size.width / image.frame.size.width;
	_TestScrollView.maximumZoomScale = 2.0;
	[_TestScrollView setZoomScale:_TestScrollView.minimumZoomScale];
    [_TestScrollView setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [self setBtnBack:nil];
    [self setBtnNext:nil];
    [self setViewToSlideImage:nil];
    [self setScrollViewController1:nil];

    [self setTestScrollView:nil];
    [super viewDidUnload];
}


#pragma mark UIScrollViewDelegate

//- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
//    _image.frame = [self centeredFrameForScrollView:_uiScrollView andUIView:_image];
//    
//    
//}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return _testView;
	
    
}


- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
	CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    }
    else {
        frameToCenter.origin.x = 0;
    }
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
	NSLog(@"xx: %f,%f", frameToCenter.origin.x, frameToCenter.origin.y);
	return frameToCenter;
}

@end
