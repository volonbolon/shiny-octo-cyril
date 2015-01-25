//
//  FWKGridViewController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "FWKGridViewController.h"
#import "FWKGridDataSource.h"
#import "FWKGridCell.h"

@interface FWKGridViewController () <UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet FWKGridDataSource *gridDataSource;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *masterContainer;
@property (weak, nonatomic) IBOutlet UIView *detailContainer;
@property (strong) UIViewController *currentMasterViewController;
@property (strong) UIViewController *currentDetailViewController;

- (void)loadMasterAtIndexPath:(NSIndexPath *)indexPath;
@end

@implementation FWKGridViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    [self topLayoutGuide];
    
    NSArray *vvcc = [self viewControllers];
    [[self gridDataSource] setItems:vvcc];
    
    [[self collectionView] registerClass:[FWKGridCell class] forCellWithReuseIdentifier:kFWKGridCellIdentifier];

}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    NSIndexPath *selectedItemIndexPath = [[[self collectionView] indexPathsForSelectedItems] firstObject];
    
    if ( !selectedItemIndexPath && [[self viewControllers] count]>0 ) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [[self collectionView] selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        
        [self loadMasterAtIndexPath:indexPath];
        
    }
    
}

- (void)showDetailViewController:(UIViewController *)detailVC
{
    
    if ( ![[self currentDetailViewController] isEqual:detailVC] ) {
        
        [self addChildViewController:detailVC];
        [[self currentDetailViewController] willMoveToParentViewController:nil];
        [[self detailContainer] addSubview:[detailVC view]];
        CGRect detailContainerBounds = [[self detailContainer] bounds];
        [[detailVC view] setFrame:detailContainerBounds];
        [detailVC didMoveToParentViewController:self];
        [[[self currentDetailViewController] view] removeFromSuperview];
        [[self currentDetailViewController] removeFromParentViewController];
        [self setCurrentDetailViewController:detailVC];
        
    }
    
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self loadMasterAtIndexPath:indexPath];
    
}

- (void)loadMasterAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController *masterVC = [[self viewControllers] objectAtIndex:[indexPath row]];
    
    if ( ![masterVC isEqual:[self currentMasterViewController]] ) {
        
        [self addChildViewController:masterVC];
        [[self currentMasterViewController] willMoveToParentViewController:nil];
        [[self masterContainer] addSubview:[masterVC view]];
        [[masterVC view] setFrame:[[self masterContainer] bounds]];
        [masterVC didMoveToParentViewController:self];
        [[[self currentMasterViewController] view] removeFromSuperview];
        [[self currentMasterViewController] removeFromParentViewController];
        [self setCurrentMasterViewController:masterVC];
        
    }

}

@end
