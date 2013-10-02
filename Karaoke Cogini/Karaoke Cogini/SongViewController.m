//
//  SongViewController.m
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import "SongViewController.h"

@interface SongViewController ()

@end

@implementation SongViewController

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
    // Do any additional setup after loading the view from its nib.
    self.lbNumber.text = self.currentSong.number;
    self.lbName.text = self.currentSong.name;
    self.lbLyric.text = self.currentSong.lyric;
    self.lbAuthor.text = self.currentSong.author;
    
    [Parse setApplicationId:@"7Li0O77RK0SutdNLnG5UwpOrPUxpuI4I9Q4KXykT"
                  clientKey:@"qjsBnpM5DRKCgjFOFbT8G3VqunemRtg7Gq0bIYLw"];
}

- (IBAction)playClicked:(id)sender {
    
}

- (IBAction)likeClicked:(id)sender {
    PFObject *objectSong = [PFObject objectWithClassName:@"Song"];
    [objectSong setObject:self.currentSong.number forKey:@"songid"];
    [objectSong setObject:[PFUser currentUser].username forKey:@"userid"];
    [objectSong saveInBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_lbNumber release];
    [_lbAuthor release];
    [_lbLyric release];
    [_lbName release];
    [_btnLike release];
    [super dealloc];
}

@end
