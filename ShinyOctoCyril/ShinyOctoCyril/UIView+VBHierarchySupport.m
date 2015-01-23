//
//  UIView+VBHierarchySupport.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "UIView+VBHierarchySupport.h"

@implementation UIView (VBHierarchySupport)
- (NSArray *)vb_superviews
{
    
    NSMutableArray *superviews = [[NSMutableArray alloc] init];
    UIView *view = [self superview];
    while ( view != nil ) {
        
        [superviews addObject:view];
        view = [view superview];
        
    }
    
    return superviews;
    
}

- (BOOL)vb_isAncestorOfView:(UIView *)view
{
    
    BOOL isAncestor = [[view vb_superviews] containsObject:self];
    return isAncestor;
    
}

- (UIView *)vb_nearestCommonAncestorToView:(UIView *)view
{
    
    UIView *commonAncestor = nil;
    if ( [self isEqual:view] ) {
        
        commonAncestor = self;
        
    } else {
        
        if ( [self vb_isAncestorOfView:view] ) {
            
            commonAncestor = self;
            
        } else if ( [view vb_isAncestorOfView:self] ) {
            
            commonAncestor = view;
            
        } else {
            
            NSArray *ancestors = [self vb_superviews];
            NSArray *viewSuperviews = [view vb_superviews];
            for ( UIView *v in viewSuperviews ) {
                
                if ( [ancestors containsObject:v] ) {
                    
                    commonAncestor = v;
                    break;
                    
                }
                
            }
            
        }
        
    }
    
    return commonAncestor;
    
}
@end
