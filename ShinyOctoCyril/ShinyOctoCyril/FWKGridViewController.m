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
#import "NSLayoutConstraint+VBSelfInstall.h"

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
        [[detailVC view] setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self adjustConstraints:[detailVC view] containerView:[self detailContainer]];
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

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self loadMasterAtIndexPath:indexPath];
    
}

- (void)loadMasterAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController *masterVC = [[self viewControllers] objectAtIndex:[indexPath row]];
    
    BOOL shouldSelectViewController = YES;
    if ( [[self delegate] respondsToSelector:@selector(gridViewController:shouldSelectViewController:)] ) {
        
        shouldSelectViewController = [[self delegate] gridViewController:self shouldSelectViewController:masterVC];
        
    }
    
    if ( ![masterVC isEqual:[self currentMasterViewController]] && shouldSelectViewController ) {
        
        [self addChildViewController:masterVC];
        [[self currentMasterViewController] willMoveToParentViewController:nil];
        [[self masterContainer] addSubview:[masterVC view]];
        [[masterVC view] setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self adjustConstraints:[masterVC view] containerView:[self masterContainer]];
        [masterVC didMoveToParentViewController:self];
        [[[self currentMasterViewController] view] removeFromSuperview];
        [[self currentMasterViewController] removeFromParentViewController];
        [self setCurrentMasterViewController:masterVC];
        
        if ( [[self delegate] respondsToSelector:@selector(gridViewController:didSelectViewController:)] ) {
            
            [[self delegate] gridViewController:self didSelectViewController:masterVC];
            
        }
        
    }

}

- (void)adjustConstraints:(UIView *)view containerView:(UIView *)containerView
{
    
    NSLayoutConstraint *tpc = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
    [tpc vb_install];
    
    NSLayoutConstraint *lc = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
    [lc vb_install];
    
    NSLayoutConstraint *wc = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f];
    [wc vb_install];
    
    NSLayoutConstraint *hc = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f];
    [hc vb_install];
    
}

- (UIViewController *)selectedViewController
{
    
    return [self currentMasterViewController];
    
}

@end
