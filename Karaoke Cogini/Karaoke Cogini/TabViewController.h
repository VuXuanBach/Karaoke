//
//  TabViewController.h
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "LikeViewController.h"

@interface TabViewController : UITabBarController <UITabBarDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) MainViewController *mainVC;
@property (strong, nonatomic) LikeViewController *likedVC;

@end
