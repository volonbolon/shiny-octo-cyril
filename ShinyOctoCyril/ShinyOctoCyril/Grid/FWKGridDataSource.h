//
//  FWKGridDataSource.h
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const kFWKGridCellIdentifier;

@interface FWKGridDataSource : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>
/**
 *  Array of UIControllers. We extract the UITabBarItem, and with that, we build 
 *  the cell content
 */
@property (strong) NSArray *items;
@end
