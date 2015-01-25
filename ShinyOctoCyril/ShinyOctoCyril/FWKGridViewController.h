//
//  FWKGridViewController.h
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FWKGridViewController : UIViewController
- (void)setViewControllers:(NSArray *)viewControllers;
- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender;
@end
