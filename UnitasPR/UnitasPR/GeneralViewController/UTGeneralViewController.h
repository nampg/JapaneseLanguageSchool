//
//  UTGeneralViewController.h
//  UnitasPR
//
//  Created by ナム on 13/05/14.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UTBaseViewController.h"
@interface UTGeneralViewController : UTBaseViewController <UIScrollViewDelegate>
//@property (weak, nonatomic) IBOutlet UIScrollView *uiScrollViewImageInGeneral;

@property (weak, nonatomic) IBOutlet UIScrollView *uiScrollViewSlideImageGeneral;
@property (nonatomic) NSNumber *currentPoint;
@property (nonatomic) NSNumber *isOrientation;
@property (weak, nonatomic) IBOutlet UIView *uiViewToCorner1;
@property (weak, nonatomic) IBOutlet UIView *uiViewToCorner2;

@end
