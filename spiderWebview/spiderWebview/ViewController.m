//
//  ViewController.m
//  spiderWebview
//
//  Created by 扶摇先生 on 2018/4/18.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import "ViewController.h"
#import "webViewPercentValue.h"
#import "spiderWebview.h"
@interface ViewController ()

@end

@implementation ViewController {
    UIButton *button;
    spiderWebview *view1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray <NSString *>*titleArr = @[@"打野",@"输出",@"经济",@"生存",@"推进"];
    NSMutableArray <webViewPercentValue *>*values = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i ++) {
        NSInteger u = arc4random()%500;
        float n = u/100.0f;
        NSNumber *num = [NSNumber numberWithFloat:n];
        webViewPercentValue *value = [[webViewPercentValue alloc] initWithValue:num title:titleArr[i]];
        [values addObject:value];
    }
    view1 = [[spiderWebview alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 400)];
    view1.values = values;


    button  = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 60, [UIScreen mainScreen].bounds.size.height - 64 - 44, 120, 44)];
    [button setTitle:@"show" forState:UIControlStateNormal];
    [button setTitle:@"dismiss" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    
//    [UIView animateWithDuration:0.5 animations:^{
//        [view drawNewRectWithColor:[UIColor purpleColor]];
//    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonClick {
    button.selected = button.selected ? false: true;
    if (button.selected) {
        [self.view addSubview:view1];
    }else {
        [view1 removeFromSuperview];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
