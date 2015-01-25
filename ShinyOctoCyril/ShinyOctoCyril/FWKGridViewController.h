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
/**
 *  An array of view controllers that are going to be the masters
 *  in the grid. They should have a UITabBarItem associated.
 *  They also have to implement the `FWKControllerForGrid` protocol
 *  Is responsability of the master view controller ask the grid controller
 *  to load the appropriate detail view controller.
 */
@property (strong) NSArray *viewControllers;

/**
 *  Delegates can stop master controllers to be loaded in the grid. 
 *  The can aldo be notified if a master has been loaded. 
 *  Refer to `FWKGridViewControllerDelegate` for further detail.
 */
@property (weak) NSObject <FWKGridViewControllerDelegate> *delegate;

- (void)showDetailViewController:(UIViewController *)vc;
- (UIViewController *)selectedViewController;
@end
