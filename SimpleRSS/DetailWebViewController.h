//
//  DetailWebViewController.h
//  SimpleRSS
//
//  Created by shuichi.wada on 2014/01/31.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailWebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) NSString *url;

@end
