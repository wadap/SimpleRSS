//
//  MasterViewController.m
//  SimpleRSS
//
//  Created by shuichi.wada on 2014/01/28.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 空の配列を用意
    self.items = [NSArray array];
    self.tableView.dataSource = self;

    [self getJson];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    //    NSDictionary *item = [items objectAtIndex]
    cell.textLabel.text = @"aaaa bbb ccc";
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (IBAction)refreshRSS:(id)sender {
    NSLog(@"Start Loading");
    [self getJson];
}

- (void)getJson
{
    NSURL *url = [NSURL URLWithString:@"http://api.nanapi.jp/v1/recipeSearchDetails/?key=512f53ecbd959&format=json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        NSArray *result = [[jsonDictionary objectForKey:@"response"] objectForKey:@"recipes"];
        self.items = result;
        
        for (NSDictionary *dict in result) {
            NSString *title = [dict objectForKey:@"title"];
            NSLog(@"title: %@", title);
        }
    }];
    [self.tableView reloadData];
}

@end