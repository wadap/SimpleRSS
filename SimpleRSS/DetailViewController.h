//
//  DetailViewController.h
//  SimpleRSS
//
//  Created by shuichi.wada on 2014/01/28.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@class Favorite;

@interface DetailViewController : UIViewController  <UIApplicationDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) NSDictionary *recipe;
@property (strong, nonatomic) NSDictionary *recipeDetail;
@property (weak, nonatomic) IBOutlet UILabel *recipeTitle;
@property (weak, nonatomic) IBOutlet UITextView *recipeContent;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImage;
@property (weak, nonatomic) IBOutlet UILabel *recipeAuthor;
@property (weak, nonatomic) IBOutlet UILabel *recipeURL;
@property (strong ,nonatomic) Favorite *favorite;

- (IBAction)addFavorite:(id)sender;

@end
