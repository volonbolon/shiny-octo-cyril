//
//  FWKGridCell.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "FWKGridCell.h"
#import "NSLayoutConstraint+VBSelfInstall.h"

@implementation FWKGridCell
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if ( self ) {
        
        [[self contentView] setBackgroundColor:[UIColor whiteColor]];
        
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectZero];
        [l setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[self contentView] addSubview:l];
        _titleLabel = l;
        
        // label
        NSLayoutConstraint *tlxc = [NSLayoutConstraint constraintWithItem:l attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:[self contentView] attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
        [tlxc vb_install];
        
        NSLayoutConstraint *tlyc = [NSLayoutConstraint constraintWithItem:l attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:[self contentView] attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
        [tlyc vb_install];
        
    }
    
    return self;
    
}
@end
