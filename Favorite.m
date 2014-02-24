//
//  Favorite.m
//  SimpleRSS
//
//  Created by shuichi.wada on 2/6/14.
//  Copyright (c) 2014 shuichi.wada. All rights reserved.
//

#import "Favorite.h"

@implementation Favorite

- (id) initWithTitle:(NSString *)title url:(NSURL *)url date:(NSDate *)date
{
    self = [super init];
    if (self){
        _title = title;
        _url = url;
        _date = date;
        return self;
    }
    return nil;
}

@end
