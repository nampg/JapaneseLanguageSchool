//
//  UTImageViewerViewController.h
//  UnitasPR
//
//  Created by ナム on 13/05/19.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UTScrollViewController.h"
@interface UTImageViewerViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewToSlideImage;


@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@property (nonatomic) NSNumber *numberOfCurrentScrollView;
@property (nonatomic) UTScrollViewController *scrollViewController1;
@property (nonatomic) UTScrollViewController *scrollViewController2;
@property (nonatomic) UTScrollViewController *scrollViewController3;
@property (nonatomic) UTScrollViewController *scrollViewController4;
@property (nonatomic) UTScrollViewController *scrollViewController5;
@property (weak, nonatomic) IBOutlet UIScrollView *TestScrollView;
@property (nonatomic) UIView *testView;

- (IBAction)btnNextPressed:(id)sender;
- (IBAction)btnBackPressed:(id)sender;
- (id)init;
@end
