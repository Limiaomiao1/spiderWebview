//
//  spiderWebview.h
//  spiderWebview
//
//  Created by 扶摇先生 on 2018/4/18.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "webViewPercentValue.h"
@interface spiderWebview : UIView

@property(nonatomic, strong) NSArray <webViewPercentValue *>*values;

- (void)drawNewRectWithColor:(UIColor*)color;

@end
