//
//  NSObject+Caculator.m
//  连式编程--计算器
//
//  Created by 李攀祥 on 16/4/9.
//  Copyright © 2016年 李攀祥. All rights reserved.
//

#import "NSObject+Caculator.h"
#import "CaculatorMaker.h"
@implementation NSObject (Caculator)

//设置一个返回值为int 接受 最终的结果
//在这里面创建  CaculatorMaker计算类 在通过block参数传出去 就不需要把其暴露在外面了
//如果这个方法被调用 就先创建  CaculatorMaker * make 然后在 回调传进来的block
//callBack(make)把make传出去 然后在通过make设置make.add(10).add(20)
+(int)makeCaculator: (void(^)(CaculatorMaker * make))callBack{
    CaculatorMaker * make =[[CaculatorMaker alloc] init];
    callBack(make);
    return make.result;
}
@end
