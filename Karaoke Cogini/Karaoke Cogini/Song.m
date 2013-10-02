//
//  Song.m
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import "Song.h"

@implementation Song

- (id) init {
    self = [super init];
    if (self) {
        self.number = @"";
        self.name = @"";
        self.lyric = @"";
        self.author = @"";
        self.keyword = @"";
    }
    return self;
}

@end
