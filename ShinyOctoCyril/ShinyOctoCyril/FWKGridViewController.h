//
//  FWKGridViewController.h
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FWKGridViewControllerDelegate.h"

@interface FWKGridViewController : UIViewController
@property (strong) NSArray *viewControllers;
@property (weak) NSObject <FWKGridViewControllerDelegate> *delegate;

- (void)showDetailViewController:(UIViewController *)vc;
- (UIViewController *)selectedViewController;
@end
