//
//  FavoriteViewController.h
//  SimpleRSS
//
//  Created by shuichi.wada on 2/6/14.
//  Copyright (c) 2014 shuichi.wada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@class Favorite;

@interface FavoriteViewController : UITableViewController

@property (nonatomic, strong)Favorite* favorite;

@end
