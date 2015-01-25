//
//  FWKGridViewControllerDelegate.h
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/25/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FWKGridViewController;

@protocol FWKGridViewControllerDelegate <NSObject>
@optional
/**
 *  Let the delegate control whether we should should the master
 *
 *  @param gridViewController Instance of the grid that wants to load the new controller as a master
 *  @param viewController     The controller proposed
 *
 *  @return Should the controller be loaded as Master?
 */
- (BOOL)gridViewController:(FWKGridViewController *)gridViewController shouldSelectViewController:(UIViewController *)viewController;

/**
 *  Notifies the delegate when a new controller has been loaded as a master
 *
 *  @param gridViewController Instance of the grid that loaded the master
 *  @param viewController     Master view controller
 */
- (void)gridViewController:(FWKGridViewController *)gridViewController didSelectViewController:(UIViewController *)viewController;
@end
