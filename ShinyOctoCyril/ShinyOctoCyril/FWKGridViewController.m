//
//  FWKGridViewController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/23/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "FWKGridViewController.h"

static NSString * const kFWKGridCellIdentifier = @"kGridCellIdentifier";

@interface FWKGridDataSource : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>
@end

@implementation FWKGridDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 4;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFWKGridCellIdentifier forIndexPath:indexPath];
    return cell;
    
}

@end

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
        NSLayoutConstraint *tlxc = [NSLayoutConstraint constraintWithItem:tl attribute:<#(NSLayoutAttribute)#> relatedBy:<#(NSLayoutRelation)#> toItem:<#(id)#> attribute:<#(NSLayoutAttribute)#> multiplier:<#(CGFloat)#> constant:<#(CGFloat)#>]
        
    }
    
    return self;
    
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
