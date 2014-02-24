//
//  DetailViewController.m
//  SimpleRSS
//
//  Created by shuichi.wada on 2014/01/28.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailWebViewController.h"
#import "Favorite.h"
#import "FavoriteDataController.h"
#import "FavoriteViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

// ここで新しいrecipeを取得してきてちゃんと表示する処理をいれる
- (void)getNewItem
{
    NSURL *url = [NSURL URLWithString:@"http://api.nanapi.jp/v1/recipeLookupDetails/?key=512f53ecbd959&recipe_id=3&format=json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *result = [[jsonDictionary objectForKey:@"response"] objectForKey:@"recipe"];
        self.recipeDetail = result;
    }];
}

- (void)configureView
{
    [self getNewItem];
    
    // Update the user interface for the detail item.
    self.recipeTitle.text   = [self.recipe objectForKey:@"title"];
    self.recipeContent.text = [self.recipe objectForKey:@"body"];

    self.recipeURL.text     = @"http://nanapi.jp/3/";

    // 画像URLをcdnへ変更
    NSString *resizedImageURL = [NSString stringWithFormat:@"%@?size=200",[self.recipe objectForKey:@"image"]];

    NSURL *imageURL    = [NSURL URLWithString:resizedImageURL];
    NSData *imageData  = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image     = [UIImage imageWithData:imageData];
    self.recipeImage.image = image;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailWebView"]) {
        DetailWebViewController *detailWebViewController = (DetailWebViewController *)[segue destinationViewController];
        NSString *url = [self.recipe objectForKey:@"url"];
        detailWebViewController.url = url;
    }
    
    if ([segue.identifier isEqualToString:@"Favorite"]) {
        NSLog(@"move to favorite");
        NSString *title = [self.recipe objectForKey:@"title"];
        NSString *url   = [self.recipe objectForKey:@"url"];
        NSDate *today = [NSDate date];
        Favorite *favorite = [[Favorite alloc] initWithTitle:title url:[NSURL URLWithString:url] date:today];
        FavoriteViewController *favoriteViewController = (FavoriteViewController *)[segue destinationViewController];
        favoriteViewController.favorite = favorite;
    }
}


@end
