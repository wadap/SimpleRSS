//
//  Favorite.h
//  SimpleRSS
//
//  Created by shuichi.wada on 2/6/14.
//  Copyright (c) 2014 shuichi.wada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Favorite : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, strong) NSDate *date;

- (id) initWithTitle:(NSString *)title url:(NSURL *) url date:(NSDate *)date;

@end
