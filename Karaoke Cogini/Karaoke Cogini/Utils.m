//
//  Utils.m
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import "Utils.h"

@implementation Utils

static NSString* SONG_LISTS = @"SONG_LISTS";
static NSMutableArray* songLists = nil;

+ (NSMutableArray *) sharedSongLists {
    if (!songLists) {
        songLists = [[NSMutableArray alloc] init];
    }
    return songLists;
}

+ (void) setSongLists:(NSMutableArray *) songs {
    if (!songLists) {
        songLists = [[NSMutableArray alloc] init];
    }
    songLists = songs;
}

+ (NSString *)songLists {
    return SONG_LISTS;
}

@end
