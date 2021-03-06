//
//  ViewController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/16/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "FWKGridViewController.h"

#import "OneMasterTableViewController.h"
#import "TwoViewController.h"

#import "FWKGridViewControllerDelegate.h"

@interface ViewController () <FWKGridViewControllerDelegate>
- (IBAction)presentGridController:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentGridController:(id)sender
{
    
    OneMasterTableViewController *omtvc = [[OneMasterTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UITabBarItem *oneTabBarItem = [[UITabBarItem alloc] initWithTitle:@"One" image:nil selectedImage:nil];
    
    [omtvc setTabBarItem:oneTabBarItem];
    
    TwoViewController *tvc = [[TwoViewController alloc] initWithNibName:NSStringFromClass([TwoViewController class]) bundle:nil];
    
    UITabBarItem *twoTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Two" image:nil selectedImage:nil];
    
    [tvc setTabBarItem:twoTabBarItem];
    
    FWKGridViewController *gvc = [[FWKGridViewController alloc] initWithNibName:NSStringFromClass([FWKGridViewController class]) bundle:nil];
    
    [gvc setDelegate:self];
    
    [gvc setViewControllers:@[omtvc, tvc]];
    
    [self presentViewController:gvc animated:YES completion:NULL];
    
}

#pragma mark - FWKGridViewControllerDelegate
- (BOOL)gridViewController:(FWKGridViewController *)gridViewController shouldSelectViewController:(UIViewController *)viewController
{
    
    return YES;
    
}

- (void)gridViewController:(FWKGridViewController *)gridViewController didSelectViewController:(UIViewController *)viewController
{
    
    NSLog(@"%@", viewController);
    
}
@end
