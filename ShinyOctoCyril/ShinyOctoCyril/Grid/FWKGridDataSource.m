//
//  FWKGridDataSource.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "FWKGridDataSource.h"
#import "FWKGridCell.h"

NSString *const kFWKGridCellIdentifier = @"kGridCellIdentifier";

@interface FWKGridDataSource ()

@end

@implementation FWKGridDataSource
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSInteger numberOfItemsInSection = [[self items] count];
    return numberOfItemsInSection;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FWKGridCell *cell = (FWKGridCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kFWKGridCellIdentifier forIndexPath:indexPath];
    
    UIViewController *vc = [[self items] objectAtIndex:[indexPath row]];
    UITabBarItem *tbi = [vc tabBarItem];
    NSString *title = [tbi title];
    
    [[cell titleLabel] setText:title];
    return cell;
    
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}
@end
