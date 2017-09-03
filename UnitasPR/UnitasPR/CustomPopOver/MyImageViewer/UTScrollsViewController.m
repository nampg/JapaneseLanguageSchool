//
//  UTScrollsViewController.m
//  TestPageViewControllerImageViewer
//
//  Created by ナム on 13/05/18.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import "UTScrollsViewController.h"

@interface UTScrollsViewController ()

@end

@implementation UTScrollsViewController
@synthesize image = _image;
@synthesize sizeImage = _sizeImage;
@synthesize rectImage = _rectImage;
@synthesize imageName = _imageName;
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
    
    //UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:_rectImage];
	scroll.backgroundColor = [UIColor blackColor];
	scroll.delegate = self;
	_image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageName]];
	//scroll.contentSize = _image.frame.size;
    scroll.contentSize = _sizeImage;
	[scroll addSubview:_image];
	
	scroll.minimumZoomScale = scroll.frame.size.width / _image.frame.size.width;
	scroll.maximumZoomScale = 2.0;
	[scroll setZoomScale:scroll.minimumZoomScale];
    
	self.view = scroll;
    [self.view setBackgroundColor:[UIColor clearColor]];
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
	
	return frameToCenter;
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    _image.frame = [self centeredFrameForScrollView:scrollView andUIView:_image];;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return _image;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
