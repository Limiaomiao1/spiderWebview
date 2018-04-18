//
//  webViewPercentValue.m
//  spiderWebview
//
//  Created by 扶摇先生 on 2018/4/18.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import "webViewPercentValue.h"

@implementation webViewPercentValue
- (instancetype)initWithValue:(NSNumber *)value title:(NSString *)title{
    self = [super init];
    if (self) {
        _value = value;
        _title = title;
    }
    return self;
}

@end
