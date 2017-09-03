//
//  UTEventsViewController.h
//  UnitasPR
//
//  Created by ナム on 13/05/14.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UTBaseViewController.h"
#import "UTImagePageViewController.h"

@interface UTEventsViewController : UTBaseViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPopoverController *customPopoverController;
@property (nonatomic) NSInteger numberOfMaxImage;
//@property (nonatomic) NSArray *localCaptions;
//@property (nonatomic) NSArray *localImages;

@property (nonatomic) NSNumber *numberOfCurrentMonth;
- (IBAction)btnEventsEachGatsu:(id)sender;

//- (NSUInteger)getIndexOfImage:(NSUInteger)currentMonth currentIndex:(NSUInteger) currentIndex isNext:(BOOL) isNext;

//- (NSNumber*)getIndexOfImageInPopOver:(NSNumber*)currentMonth currentIndex:(NSNumber*) currentIndex isNext:(BOOL) isNext;
@end
