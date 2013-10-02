//
//  Utils.h
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(NSString *) songLists;
+ (void) setSongLists:(NSMutableArray *) songs;
+ (NSMutableArray *) sharedSongLists;

@end
