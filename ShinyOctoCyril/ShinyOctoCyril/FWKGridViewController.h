//
//  FWKGridViewController.h
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FWKControllerForGrid <NSObject>
@required
- (UIViewController *)masterController;
- (UIViewController *)currentDetailViewController;
@end

@interface FWKGridViewController : UIViewController
- (void)setViewControllers:(NSArray *)viewControllers;
- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender;
@end
