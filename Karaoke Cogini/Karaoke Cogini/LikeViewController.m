//
//  LikeViewController.m
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import "LikeViewController.h"

@interface LikeViewController ()

@end

@implementation LikeViewController

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
    [Parse setApplicationId:@"7Li0O77RK0SutdNLnG5UwpOrPUxpuI4I9Q4KXykT"
                  clientKey:@"qjsBnpM5DRKCgjFOFbT8G3VqunemRtg7Gq0bIYLw"];
}

- (void)loadDatas {
    self.likeSongs = [[NSMutableArray alloc] init];
    NSMutableArray *songs = [Utils sharedSongLists];
    PFQuery *query = [PFQuery queryWithClassName:@"Song"];
    [query whereKey:@"userid" equalTo:[PFUser currentUser].username];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *o in objects) {
                for (Song *s in songs) {
                    NSString *str = [o objectForKey:@"songid"];
                    if ([s.number isEqualToString:str]) {
                        [self.likeSongs addObject:s];
                        [self.tvLike reloadData];
                    }
                }
            }
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.likeSongs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Setup cell identifier
    static NSString *cellIdentifier = @"mainCell";
    MainCell *cell = (MainCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"MainCell" owner:nil options:nil];
        
        for (id currentObj in topLevelObjects) {
            cell = (MainCell *) currentObj;
            break;
        }
    }
    
    Song *song = [self.likeSongs objectAtIndex:indexPath.row];
    cell.lbNumber.text = song.number;
    cell.lbName.text = song.name;
    
    // Return the cell
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SongViewController *songVC = [[SongViewController alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        songVC.btnLike.hidden = YES;
    });
    
    Song *song = [self.likeSongs objectAtIndex:indexPath.row];
    songVC.currentSong = song;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:songVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tvLike release];
    [super dealloc];
}
@end
