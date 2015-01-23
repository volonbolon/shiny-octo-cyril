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

@implementation FWKGridDataSource
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [[self items] count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FWKGridCell *cell = (FWKGridCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kFWKGridCellIdentifier forIndexPath:indexPath];
    NSString *i = [[self items] objectAtIndex:[indexPath row]];
    [[cell titleLabel] setText:i];
    return cell;
    
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}
@end
