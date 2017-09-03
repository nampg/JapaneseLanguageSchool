//
//  UTScrollsViewController.h
//  TestPageViewControllerImageViewer
//
//  Created by ナム on 13/05/18.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTScrollsViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic)UIImageView *image;
@property (nonatomic)CGSize sizeImage;
@property (nonatomic)CGRect rectImage;
@property (nonatomic)NSString *imageName;
@end
