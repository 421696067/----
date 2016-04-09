//
//  NSObject+Caculator.h
//  连式编程--计算器
//
//  Created by 李攀祥 on 16/4/9.
//  Copyright © 2016年 李攀祥. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CaculatorMaker;
@interface NSObject (Caculator)

+(int)makeCaculator: (void(^)(CaculatorMaker * make))callBack;
@end
