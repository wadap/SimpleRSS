//
//  MasterViewController.h
//  SimpleRSS
//
//  Created by shuichi.wada on 2014/01/28.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController <UIApplicationDelegate>
// buttonをタップしたときのアクションをキャッチ
- (IBAction)refreshRSS:(id)sender;

@property(strong, nonatomic) NSMutableArray *rows;
@property(strong, nonatomic) NSArray *items;

// JSON
- (void)getJson;

@end
