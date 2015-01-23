//
//  FWKGridViewController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "FWKGridViewController.h"
#import "NSLayoutConstraint+VBSelfInstall.h"

static NSString * const kFWKGridCellIdentifier = @"kGridCellIdentifier";

@interface FWKGridCell : UICollectionViewCell
@property (nonatomic, weak) UILabel *titleLabel;
@end

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

@interface FWKGridDataSource : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *items;
@end

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

@interface FWKGridViewController ()
@property (strong, nonatomic) IBOutlet FWKGridDataSource *gridDataSource;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation FWKGridViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    NSArray *items = @[@"one",@"two",@"three",@"four"];
    [[self gridDataSource] setItems:items];
    [[self collectionView] registerClass:[FWKGridCell class] forCellWithReuseIdentifier:kFWKGridCellIdentifier];

}

- (void)didReceiveMemoryWarning {
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

@end
