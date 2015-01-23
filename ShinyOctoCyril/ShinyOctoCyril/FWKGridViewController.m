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

- (void)setViewControllers:(NSArray *)viewControllers
{
    
    
    
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
