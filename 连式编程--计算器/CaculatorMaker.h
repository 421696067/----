//
//  CaculatorMaker.h
//  连式编程--计算器
//
//  Created by 李攀祥 on 16/4/9.
//  Copyright © 2016年 李攀祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorMaker : NSObject
@property(nonatomic,assign)int result;


-(CaculatorMaker * (^)(int number))add;

-(CaculatorMaker * (^)(int number))jian;

-(CaculatorMaker * (^)(int number))multy;

-(CaculatorMaker * (^)(int number))division;


@end
