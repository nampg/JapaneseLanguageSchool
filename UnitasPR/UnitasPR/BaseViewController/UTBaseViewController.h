//
//  UTBaseViewController.h
//  UnitasPR
//
//  Created by ナム on 13/05/14.
//  Copyright (c) 2013年 ナム. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTBaseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnMenuInEachController;
@property (weak, nonatomic) IBOutlet UIView *mainViewInEachController;
@property (nonatomic) NSString *isInView;
@property (weak, nonatomic) IBOutlet UIButton *btnToHideMenu;
- (IBAction)btnGeneralPressed:(id)sender;
- (IBAction)btnEventsPressed:(id)sender;
- (IBAction)btnCourcePressed:(id)sender;
- (IBAction)btnLifePressed:(id)sender;
- (IBAction)btnMenuPressed:(id)sender;
- (IBAction)btnToHideMenuPressed:(id)sender;

@end
