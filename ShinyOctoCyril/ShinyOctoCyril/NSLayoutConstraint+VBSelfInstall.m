//
//  NSLayoutConstraint+VBSelfInstall.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "NSLayoutConstraint+VBSelfInstall.h"
#import "UIView+VBHierarchySupport.h"

@implementation NSLayoutConstraint (VBSelfInstall)
- (UIView *)nearesCommonAncestor
{
    
    UIView *firstView = [self firstItem];
    UIView *secondView = [self secondItem];
    
    UIView *view = [firstView vb_nearestCommonAncestorToView:secondView];
    
    return view;
    
}

- (BOOL)vb_install
{
    
    BOOL installed = NO;
    if ( [self secondItem] == nil ) {
        
        [[self firstItem] addConstraint:self];
        installed = YES;
        
    } else {
        
        UIView *view = [self nearesCommonAncestor];
        
        if ( view != nil ) {
            
            [view addConstraint:self];
            installed = YES;
        }
        
    }
    
    return installed;
    
}

- (BOOL)vb_install:(float)priority
{
    
    [self setPriority:priority];
    
    return [self vb_install];
    
}

- (void)vb_remove
{
    
    if ( [self secondItem] == nil ) {
        
        UIView *view = [self firstItem];
        [view removeConstraint:self];
        
    } else {
        
        UIView *view = [self nearesCommonAncestor];
        
        if ( view != nil ) {
            
            [view removeConstraint:self];
            
        }
        
    }
    
}

@end
