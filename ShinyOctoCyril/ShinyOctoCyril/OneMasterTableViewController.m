//
//  OneMasterTableViewController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/25/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "OneMasterTableViewController.h"
#import "UIViewController+GridController.h"
#import "FWKGridViewController.h"
#import "DetailViewController.h"

static NSString *const kOneMasterCellIdentifier = @"oneMasterCellIdentifier";

@interface Item : NSObject
@property (strong) NSString *name;
@property (strong) UIColor *color;
@end

@implementation Item
- (instancetype)initWithName:(NSString *)name color:(UIColor *)color
{
    
    self = [super init];
    
    if ( self ) {
        
        _name = name;
        _color = color;
        
    }
    
    return self;
    
}
@end

@interface OneMasterTableViewController ()
@property (nonatomic, strong) NSArray *items;
@property (strong) UIViewController *selectedViewController;
@end

@implementation OneMasterTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    Item *red = [[Item alloc] initWithName:@"Red" color:[UIColor redColor]];
    Item *blue = [[Item alloc] initWithName:@"Blue" color:[UIColor blueColor]];
    Item *purple = [[Item alloc] initWithName:@"Purple" color:[UIColor purpleColor]];
    Item *green = [[Item alloc] initWithName:@"Green" color:[UIColor greenColor]];
    
    [[self tableView] registerClass:[UITableViewCell class] forCellReuseIdentifier:kOneMasterCellIdentifier];
    
    [[self tableView] setTableFooterView:[UIView new]];
    
    [self setItems:@[red,blue,purple,green]];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
    NSIndexPath *selectedIndexPath = [[self tableView] indexPathForSelectedRow];
    if ( selectedIndexPath ) {
        
        [self loadDetailViewControllerAtIndexPath:selectedIndexPath];
        
    } else {
        
        selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [[self tableView] selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        [self loadDetailViewControllerAtIndexPath:selectedIndexPath];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[self items] count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Item *item = [[self items] objectAtIndex:[indexPath row]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kOneMasterCellIdentifier forIndexPath:indexPath];
    
    [[cell textLabel] setText:[item name]];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self loadDetailViewControllerAtIndexPath:indexPath];
    
}

#pragma mark - FWKControllerForGrid
- (UIViewController *)currentDetailViewController
{

    return [self selectedViewController];
    
}

- (void)loadDetailViewControllerAtIndexPath:(NSIndexPath *)indexPath
{
    
    Item *i = [[self items] objectAtIndex:[indexPath row]];
    
    DetailViewController *odvc = [[DetailViewController alloc] initWithNibName:NSStringFromClass([DetailViewController class]) bundle:nil];
    [odvc setTitle:[i name]];
    [[odvc view] setBackgroundColor:[i color]];
    
    FWKGridViewController *gvc = [self gridViewController];
    
    [gvc showDetailViewController:odvc];
    
    [self setSelectedViewController:odvc];
    
}

@end
