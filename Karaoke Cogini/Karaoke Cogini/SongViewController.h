//
//  SongViewController.h
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"
#import <Parse/Parse.h>

@interface SongViewController : UIViewController

@property (strong, nonatomic) Song *currentSong;
@property (retain, nonatomic) IBOutlet UILabel *lbNumber;
@property (retain, nonatomic) IBOutlet UILabel *lbAuthor;
@property (retain, nonatomic) IBOutlet UILabel *lbLyric;
@property (retain, nonatomic) IBOutlet UILabel *lbName;
@property (retain, nonatomic) IBOutlet UIButton *btnLike;

- (IBAction)playClicked:(id)sender;
- (IBAction)likeClicked:(id)sender;

@end
