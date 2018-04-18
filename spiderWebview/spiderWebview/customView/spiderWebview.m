//
//  spiderWebview.m
//  spiderWebview
//
//  Created by 扶摇先生 on 2018/4/18.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import "spiderWebview.h"
#define PI 3.141592653f

@implementation spiderWebview {
    CGPoint point1;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        point1 = CGPointMake(200, 200);
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
//- (void)setValues:(NSArray<webViewPercentValue *> *)values {
//    _values = values;
//}
- (void)drawNewRectWithColor:(UIColor*)color {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    NSInteger count = self.values.count;
    for (NSInteger i = 0; i < count; i ++) {
        
        CGFloat ptX = (CGFloat) (point1.x + sin(i * 2 * PI / count) * 100.0f * [self.values[i].value floatValue]/count);
        CGFloat ptY = (CGFloat) (point1.y - cos(i * 2 * PI / count) * 100.0f * [self.values[i].value floatValue]/count);
        if (i == 0) {
            CGContextMoveToPoint(context, ptX, ptY);
        }else {
            CGContextAddLineToPoint(context, ptX, ptY);
        }
        NSLog(@"ptx = %f, pty = %f",ptX,ptY);
    }
    CGContextClosePath(context);// 先闭合再设置透明 再填充色
    CGContextSetAlpha(context, 0.5f);
    CGContextFillPath(context);
    
    CGContextStrokePath(context);
    
    for (NSInteger i = 0; i < count; i++) {
        
        CGFloat ptX = (CGFloat) (point1.x + 100.0f * sin(i * 2 * PI / count));
        CGFloat ptY = (CGFloat) (point1.y - 100.0f * cos(i * 2 * PI / count));
        
//        if (i == 0) {
//            CGContextMoveToPoint(context, ptX, ptY);
//        } else {
//            CGContextAddLineToPoint(context, ptX, ptY);
//        }
        
        //绘制标题
        NSString *title = [NSString stringWithFormat:@"%@ %.2f",self.values[i].title,[self.values[i].value floatValue]];
        CGFloat realx = 0;
        CGFloat realy = 0;
        
        //重新计算坐标
        //TODO 计算算法日后完善
        if (ptX < point1.x) {
            realx = ptX - 40;
        } else if (ptX > point1.x) {
            realx = ptX - 2;
        } else {
            realx = ptX - 22;
        }
        
        if (ptY > point1.y) {
            realy = ptY - 5;
        } else if (ptY < point1.y) {
            realy = ptY - 15;
        } else {
            realy = ptY - 3;
        }
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        //文字
        UIFont *font = [UIFont fontWithName:@"Arial" size:11];
        
        //调整X轴坐标位置
        //        [title drawInRect:CGRectMake(realx, realy, 44, 11)
        //                 withFont:font
        //            lineBreakMode:NSLineBreakByWordWrapping
        //                alignment:NSTextAlignmentCenter];
        
        CGRect textRect= CGRectMake(realx, realy, 44, 11);
        UIFont *textFont= font; //设置字体
        NSMutableParagraphStyle *textStyle=[[NSMutableParagraphStyle alloc]init];//段落样式
        textStyle.alignment=NSTextAlignmentCenter;
        textStyle.lineBreakMode = NSLineBreakByWordWrapping;
        //绘制字体
        [title drawInRect:textRect withAttributes:@{NSFontAttributeName:textFont,NSParagraphStyleAttributeName:textStyle}];
        
        CGContextSetFillColorWithColor(context, color.CGColor);
    }

}
- (void)drawRect:(CGRect)rect {
    
#pragma mark -- 绘制底部蜘蛛网
    /*
     
     */
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    NSInteger count = self.values.count;
    for (NSInteger j = count; j > 0; j --) {
        for (NSInteger i = 0; i < count ; i ++) {
            CGFloat ptX = (CGFloat) (point1.x + sin(i * 2 * PI / count) * 100.0f * j / count);
            CGFloat ptY = (CGFloat) (point1.y - cos(i * 2 * PI / count) * 100.0f * j / count);
            
            if (i == 0) {
                CGContextMoveToPoint(context, ptX, ptY);
            }else {
                CGContextAddLineToPoint(context, ptX, ptY);
            }
        }
        CGContextClosePath(context);// 先闭合再设置透明 再填充色
        //        CGContextSetAlpha(context, 0.5f);
        //        CGContextFillPath(context);
        
        CGContextStrokePath(context);
        //        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        
        
    }
    for (NSInteger i = 0; i < count; i ++) {
        
        CGFloat ptX = (CGFloat) (point1.x + sin(i * 2 * PI / count) * 100.0f );
        CGFloat ptY = (CGFloat) (point1.y - cos(i * 2 * PI / count) * 100.0f );
        //        NSLog(@"ptx = %f, pty = %f",ptX,ptY);
        
        CGContextMoveToPoint(context, point1.x, point1.y);
        CGContextAddLineToPoint(context, ptX, ptY);
        CGContextClosePath(context);
        CGContextStrokePath(context);
        
        //        CGContextSetAlpha(context, 1);
    }
    [self drawNewRectWithColor:[UIColor purpleColor]];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
