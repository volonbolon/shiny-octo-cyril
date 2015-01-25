//
//  UIViewController+GridController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/25/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "UIViewController+GridController.h"
#import "FWKGridViewController.h"

@implementation UIViewController (GridController)

- (FWKGridViewController *)gridViewController
{
    
    UIViewController *gvc = self;
    
    while ( nil != gvc ) {
        
        if ( [gvc isMemberOfClass:[FWKGridViewController class]] ) {
            
            break;
            
        } else {
            
            gvc = [gvc parentViewController];
            
        }
        
    }
    
    return (FWKGridViewController *)gvc;
    
}

@end
