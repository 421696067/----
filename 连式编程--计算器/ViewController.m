//
//  ViewController.m
//  连式编程--计算器
//
//  Created by 李攀祥 on 16/4/9.
//  Copyright © 2016年 李攀祥. All rights reserved.
//

#import "ViewController.h"
#import "CaculatorMaker.h"
#import "NSObject+Caculator.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int result =  [NSObject makeCaculator:^(CaculatorMaker *maker) {
        maker.add(10).add(30);
        maker.add(20).add(40);
        maker.multy(2).division(10);
        maker.jian(19);
    }];
    NSLog(@"%d",result);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
