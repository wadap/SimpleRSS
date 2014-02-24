//
//  FavoriteDataController.h
//  SimpleRSS
//
//  Created by shuichi.wada on 2/6/14.
//  Copyright (c) 2014 shuichi.wada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Favorite.h"

@class Favorite;

@interface FavoriteDataController : NSObject

@property (nonatomic, copy)NSMutableArray *favoriteDataList;
@property (nonatomic, strong) FavoriteDataController *dataController;

- (NSUInteger) countOfFavoriteDataList;
- (Favorite *) objectInFavoriteDataListAtIndex:(NSUInteger)index;
- (void)addFavoriteDataWithFavorite:(Favorite *)favorite;

@end
