//
//  ViewController.m
//  ShinyOctoCyril
//
//  Created by Ariel Rodriguez on 1/16/15.
//  Copyright (c) 2015 Ariel Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "FWKGridViewController.h"

@interface ViewController ()
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
    
    FWKGridViewController *gvc = [[FWKGridViewController alloc] initWithNibName:NSStringFromClass([FWKGridViewController class]) bundle:nil];
    [self presentViewController:gvc animated:YES completion:NULL];
    
}
@end
