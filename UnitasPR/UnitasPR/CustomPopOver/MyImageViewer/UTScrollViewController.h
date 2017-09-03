//
//  UTScrollViewController.h
//  UnitasPR
//
//  Created by ナム on 13/05/19.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTScrollViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *uiScrollView;
@property (nonatomic) UIImageView *image;

- (id)init;
@end
