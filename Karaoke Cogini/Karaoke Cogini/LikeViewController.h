//
//  LikeViewController.h
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"
#import "MainCell.h"
#import <Parse/Parse.h>
#import "Utils.h"
#import "SongViewController.h"

@interface LikeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tvLike;
@property (strong, nonatomic) NSMutableArray *likeSongs;

- (void)loadDatas;

@end
