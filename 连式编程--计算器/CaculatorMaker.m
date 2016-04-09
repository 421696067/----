
//
//  CaculatorMaker.m
//  连式编程--计算器
//
//  Created by 李攀祥 on 16/4/9.
//  Copyright © 2016年 李攀祥. All rights reserved.
//

#import "CaculatorMaker.h"

@interface CaculatorMaker()
@end

@implementation CaculatorMaker
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.result=0;
    }
    return self;
}

//因为 add(10)之后 还要使用.add(20) 所以不能返回int 一定要返回 CaculatorMaker * 类型这样才能一直点下去
//  CaculatorMaker *(^)(int number) 这个返回值是一个 返回值 CaculatorMaker * 参数是：int 类型
/**    而且 刚好返回的是   相当于 这个返回值 和返回的代码块就是一个block的定义~~
  *    所以外部调用的时候  add 相当于block   要想调用就直接  block（需要传递的参数）
       CaculatorMaker *(^)(int number)  = ^(int number){
                                          self.result+= number;
                                          return self;
                                          };
 */

-( CaculatorMaker *(^)(int number))add{
    return ^(int number){
         self.result+= number;
         return self;
    };
}

-(CaculatorMaker * (^)(int number))jian
{
    return ^(int number){
        self.result-= number;
        return self;
    };

}

-(CaculatorMaker * (^)(int number))multy{
    return ^(int number){
        self.result*= number;
        return self;
    };

}


-(CaculatorMaker * (^)(int number))division{
    return ^(int number){
        self.result/= number;
        return self;
    };
}

@end
