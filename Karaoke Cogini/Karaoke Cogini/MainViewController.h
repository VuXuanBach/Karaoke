//
//  MainViewController.h
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
#import "MainCell.h"
#import "Song.h"
#import "SongViewController.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) NSMutableArray *songs;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property (retain, nonatomic) IBOutlet UITableView *mainTableView;
@property (retain, nonatomic) IBOutlet UISearchBar *sbSearchSong;
@property (strong, nonatomic) UIView *disableViewOverlay;

@end
