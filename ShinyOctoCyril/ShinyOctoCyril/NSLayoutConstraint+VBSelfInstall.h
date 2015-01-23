//
//  NSLayoutConstraint+VBSelfInstall.h
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (VBSelfInstall)
/**
 *  Install the constraint that receive the message in the appropriate view
 *  The method walk the view hiearchy to find the common ancestor
 *  of the items related by the constraint.
 *
 * The constraint priority is set to `UILayoutPriorityRequired`
 *
 *  @return `YES` on success
 */
- (BOOL)vb_install;

/**
 *  Install the constraint in the appropriate view, like `-bsb_install`,
 *  but let the client configure the priority
 *
 *  @param priority Priority level used to install the constraint
 *
 *  @return `YES` on success
 */
- (BOOL)vb_install:(float)priority;

/**
 *  Walks the view hiearchy to find the commom ancestor
 *  where the constraint was installed, and remove it
 */
- (void)vb_remove;
@end
