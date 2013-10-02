//
//  MainViewController.m
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    self.disableViewOverlay = [[UIView alloc]
                               initWithFrame:CGRectMake(0.0f,44.0f,320.0f,548.0f)];
    self.disableViewOverlay.backgroundColor=[UIColor blackColor];
    self.disableViewOverlay.alpha = 0;
    
    [self readContent];
}

- (void) readContent {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"vol41"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSArray *lines = [content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    self.songs = [[NSMutableArray alloc] init];
    self.searchResults = [[NSMutableArray alloc] init];
    Song *song = [[Song alloc] init];
    int count = 0;
    
    for (NSString *line in lines) {
        NSScanner *scanner = [NSScanner scannerWithString:line];
        if ([scanner scanInteger:NULL] && [scanner isAtEnd]) {
            song = [[Song alloc] init];
            song.number = line;
            [self.songs addObject:song];
            count = 1;
        } else if (count == 1) {
            song.name = line;
            count++;
        } else if (count == 2) {
            song.lyric = line;
            count++;
        } else {
            song.author = [[song.author stringByAppendingString:@" - "] stringByAppendingString:line];
            count++;
        }
    }
    [self.searchResults addObjectsFromArray:self.songs];
    [self.mainTableView reloadData];
    
    [Utils setSongLists:self.songs];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
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
    
    
    Song *song = [self.searchResults objectAtIndex:indexPath.row];
    cell.lbNumber.text = song.number;
    cell.lbName.text = song.name;
    
    // Return the cell
    return cell;
}



- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.searchResults = [[NSMutableArray alloc] init];
    for (Song *song in self.songs) {
        if ([song.number rangeOfString:searchBar.text].location != NSNotFound || [song.name rangeOfString:searchBar.text options:NSCaseInsensitiveSearch].location != NSNotFound) {
            [self.searchResults addObject:song];
        }
    }
    [self.mainTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SongViewController *songVC = [[SongViewController alloc] init];

    Song *song = [self.searchResults objectAtIndex:indexPath.row];
    songVC.currentSong = song;
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:songVC animated:YES];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self searchBar:searchBar activate:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = @"";
    [self searchBar:searchBar activate:NO];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {	
    [self searchBar:searchBar activate:NO];
    
    self.searchResults = [[NSMutableArray alloc] init];
    for (Song *song in self.songs) {
        if ([song.number rangeOfString:searchBar.text].location != NSNotFound || [song.name rangeOfString:searchBar.text options:NSCaseInsensitiveSearch].location != NSNotFound) {
            [self.searchResults addObject:song];
        }
    }
    [self.mainTableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar activate:(BOOL) active{
    self.mainTableView.allowsSelection = !active;
    self.mainTableView.scrollEnabled = !active;
    if (!active) {
        [self.disableViewOverlay removeFromSuperview];
        [searchBar resignFirstResponder];
    } else {
        self.disableViewOverlay.alpha = 0;
        [self.view addSubview:self.disableViewOverlay];
		
        [UIView beginAnimations:@"FadeIn" context:nil];
        [UIView setAnimationDuration:0.5];
        self.disableViewOverlay.alpha = 0.6;
        [UIView commitAnimations];
		
        // probably not needed if you have a details view since you
        // will go there on selection
        NSIndexPath *selected = [self.mainTableView
                                 indexPathForSelectedRow];
        if (selected) {
            [self.mainTableView deselectRowAtIndexPath:selected
                                             animated:NO];
        }
    }
    [searchBar setShowsCancelButton:active animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.sbSearchSong isFirstResponder] && [touch view] != self.sbSearchSong) {
        [self searchBar:self.sbSearchSong activate:NO];
        [self.sbSearchSong resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mainTableView release];
    [_sbSearchSong release];
    [super dealloc];
}
@end
