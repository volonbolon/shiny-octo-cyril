//
//  OneMasterTableViewController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/25/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "OneMasterTableViewController.h"

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
@end

@implementation OneMasterTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    Item *red = [[Item alloc] initWithName:@"Red" color:[UIColor redColor]];
    Item *blue = [[Item alloc] initWithName:@"Blue" color:[UIColor blueColor]];
    Item *purple = [[Item alloc] initWithName:@"Purple" color:[UIColor purpleColor]];
    Item *green = [[Item alloc] initWithName:@"Green" color:[UIColor greenColor]];
    
    [[self tableView] registerClass:[UITableView class] forCellReuseIdentifier:kOneMasterCellIdentifier];
    
    [self setItems:@[red,blue,purple,green]];
    
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - FWKControllerForGrid
- (UIViewController *)currentDetailViewController
{

    return nil;
    
}

@end
