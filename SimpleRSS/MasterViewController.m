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
    // 空の配列を用意
    self.items = [NSArray array];
    self.tableView.dataSource = self;
    [self getJson];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
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
    
    NSDictionary *item = [self.items objectAtIndex:indexPath.row];

    
    // テキストセット
    UILabel *titleLabel    = (UILabel *)[cell viewWithTag:3];
    UILabel *subtitleLabel = (UILabel *)[cell viewWithTag:4];
    titleLabel.text    = [item objectForKey:@"title"];
    subtitleLabel.text = [item objectForKey:@"body"];
    
    
    // 画像セット
    UIImageView *thumbnail = (UIImageView *)[cell viewWithTag:1];
    UIImageView *favicon   = (UIImageView *)[cell viewWithTag:2];
    
    // 記事画像
    NSString *imageURL = [NSString stringWithFormat:@"%@?size=80",[item objectForKey:@"image"]];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    
    // ファビコン画像
    NSString *faviconURL  = [NSString stringWithFormat:@"http://favicon.qfor.info/f/%@", [item objectForKey:@"url"]];
    UIImage *faviconImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:faviconURL]]];

    // 画像出力
    thumbnail.image = image;
    favicon.image = faviconImage;
    
    // セルごとに色を変換
    cell.backgroundColor = [UIColor colorWithHue:0.61 saturation:0.09 brightness:0.99 alpha:1.0];
    
    return cell;
}

//- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString *str = @"aaaa";
//    UIFont *font = [UIFont systemFontOfSize:12];
//    
//    CGSize size = CGSizeMake(label.with.size, 1000);
////    CGSize textSize = [str sizeWithFont:font constrainedToSize: line]
//    CGSize textSize = [str sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeCharacterWrap];
//    
//    float height = 50.0f;
//    float h = textSize.height - label.size.height;
//    
//    if (h > 0) {
//        height += h;
//    }
//
//    return height;
//    NSLog(@"hhhhh");
//}
//

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailView"]) {
        DetailViewController *detailViewController = (DetailViewController *)[segue destinationViewController];
        NSDictionary *item = [self.items objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        detailViewController.recipe = item;
    }
}

@end
