//
//  FavoriteDataController.m
//  SimpleRSS
//
//  Created by shuichi.wada on 2/6/14.
//  Copyright (c) 2014 shuichi.wada. All rights reserved.
//

#import "FavoriteDataController.h"

@implementation FavoriteDataController

- (id)init
{
    if (self = [super init]) {
        return self;
    }
    return nil;
}

- (void)setFavoriteDataList:(NSMutableArray *)favoriteDataList
{
    if (_favoriteDataList != favoriteDataList) {
        _favoriteDataList = [favoriteDataList mutableCopy];
    }
}

- (NSUInteger)countOfFavoriteDataList
{
    return [self.favoriteDataList count];
}

- (Favorite *) objectInFavoriteDataListAtIndex:(NSUInteger)index
{
    return [self.favoriteDataList objectAtIndex:index];
}

- (void)addFavoriteDataWithFavorite:(Favorite *)favorite
{
    [self.favoriteDataList addObject:favorite];
}

@end
