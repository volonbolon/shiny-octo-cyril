//
//  TwoViewController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/25/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "TwoViewController.h"
#import "DetailViewController.h"
#import "FWKGridViewController.h"
#import "UIViewController+GridController.h"

@interface TwoViewController ()
@property (strong) UIViewController *selectedViewController;
@end

@implementation TwoViewController

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    DetailViewController *odvc = [[DetailViewController alloc] initWithNibName:NSStringFromClass([DetailViewController class]) bundle:nil];
    [odvc setTitle:@"Orange"];
    [[odvc view] setBackgroundColor:[UIColor orangeColor]];
    
    FWKGridViewController *gvc = [self gridViewController];
    
    [gvc showDetailViewController:odvc];
    
    [self setSelectedViewController:odvc];
    
}

#pragma mark - FWKControllerForGrid
- (UIViewController *)currentDetailViewController
{
    
    return [self selectedViewController];
    
}
@end
