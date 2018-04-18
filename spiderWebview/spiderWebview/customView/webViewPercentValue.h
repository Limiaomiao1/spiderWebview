//
//  webViewPercentValue.h
//  spiderWebview
//
//  Created by 扶摇先生 on 2018/4/18.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface webViewPercentValue : NSObject
@property(nonatomic, strong) NSNumber *value;
@property(nonatomic, copy)   NSString *title;

- (instancetype)initWithValue:(NSNumber *)value title:(NSString *)title;

@end
