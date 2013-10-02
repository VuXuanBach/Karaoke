//
//  TabViewController.m
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import "TabViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    [self.mainVC setTitle:@"Main"];
    UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:self.mainVC];
    
    self.likedVC = [[LikeViewController alloc] initWithNibName:@"LikeViewController" bundle:nil];
    [self.likedVC setTitle:@"Like"];
    UINavigationController *likedNC = [[UINavigationController alloc] initWithRootViewController:self.likedVC];
    
    [self setViewControllers:@[mainNC, likedNC]];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if ([[item title] isEqualToString:@"Like"]) {
        [self.likedVC loadDatas];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
