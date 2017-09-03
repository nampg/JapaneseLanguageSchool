//
//  UTPageViewController.h
//  TestPageViewControllerImageViewer
//
//  Created by ナム on 13/05/18.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTPageViewController : UIPageViewController <UIPageViewControllerDataSource>
@property (nonatomic) NSNumber *numberOfMonth;
@property (nonatomic)CGSize sizeImage;
@property (nonatomic)CGRect rectImage;
@property (nonatomic)NSNumber *numberOfCurrentPage;
@end
