//
//  Song.h
//  Karaoke Cogini
//
//  Created by Bach Vu on 9/27/13.
//  Copyright (c) 2013 Bach Vu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *lyric;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *keyword;

@end
