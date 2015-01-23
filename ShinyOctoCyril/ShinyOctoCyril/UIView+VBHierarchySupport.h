//
//  UIView+VBHierarchySupport.h
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VBHierarchySupport)
/**
 @returns array with all the superviews of the view that calls it
 */
- (NSArray *)vb_superviews;

/**
 @param a view
 @return BOOL is the view that we are passing as a param a superview of the view from where we call this method?
 */
- (BOOL)vb_isAncestorOfView:(UIView *)view;

/**
 @return the closest ancestor for both, the view we pass as a param and the one we message with this method
 */
- (UIView *)vb_nearestCommonAncestorToView:(UIView *)view;
@end
