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
- (BOOL)gridViewController:(FWKGridViewController *)gridViewController shouldSelectViewController:(UIViewController *)viewController;
- (void)gridViewController:(FWKGridViewController *)gridViewController didSelectViewController:(UIViewController *)viewController;
@end
