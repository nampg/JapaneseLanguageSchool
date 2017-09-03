//
//  UTScrollViewController.m
//  UnitasPR
//
//  Created by ナム on 13/05/19.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import "UTScrollViewController.h"

@interface UTScrollViewController ()

@end

@implementation UTScrollViewController
@synthesize uiScrollView = _uiScrollView;
@synthesize image = _image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init{
    self = [self initWithNibName:@"UTScrollViewController" bundle:nil];
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"event-2-3.jpg"]];
    [_uiScrollView addSubview:_image];
    _uiScrollView.contentSize = _image.frame.size;
    //    _scrollView1.contentSize = _scrollView1.frame.size;
    _uiScrollView.minimumZoomScale = _uiScrollView.frame.size.width / _image.frame.size.width;
	_uiScrollView.maximumZoomScale = 2.0;
	[_uiScrollView setZoomScale:_uiScrollView.minimumZoomScale];
    [_uiScrollView setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setUiScrollView:nil];
    [self setImage:nil];
    [super viewDidUnload];
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    _image.frame = [self centeredFrameForScrollView:_uiScrollView andUIView:_image];
    
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"_image = %@",_image);
    return _image;
	
    
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
