### 链式编程思想：是将多个操作（多行代码）通过点号(.)链接在一起成为一句代码,使代码可读性好。a(1).b(2).c(3)

链式编程特点：方法的返回值是block,block必须有返回值（本身对象），block参数（需要操作的值）

代表：masonry框架。

例子:模仿masonry，写一个加法计算器，练习链式编程思想。

 * **首先我们来了解一下masonry**
 

```
UIView * redView =[[UIView alloc] init];
   UIView * redView =[[UIView alloc] init];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        //把所有的需要设置的内容在这里 使其框架高聚合
        //这个make.top.left.bottom.right.equalTo就是一个block 通过block()来调用
        make.top.left.bottom.right.equalTo(@10);
    }];

```

1. 首先我们来 试着写出 这样的形式的计算起来 `make.top.left.bottom.right.equalTo(@10)`
2. 首先我们先创建一个计算器的管理器类  写一个方法 就以加法 为例
  
   * 其余的方法同理
  
  
  ```
   .h文件 
 @property (nonatomic, assign)  int result;
- (CaculatorMaker *(^)(int num))add;


  .m文件实现
-( CaculatorMaker *(^)(int number))add{
    return ^(int number){
         self.result+= number;
         return self;
    };
}
外部的调用：
    CaculatorMaker *maker = [[CaculatorMaker alloc] init];
    int result = [maker.add(10).add(20).add(30).add(40) result];
    

```


##Block返回值和链式编程原理的讲解
> 
 因为 add(10)之后 还要使用.add(20) 所以不能返回int 一定要返回 CaculatorMaker 类型这样才能一直点下去
 
> CaculatorMaker *(^)(int number) 这个返回值是一个 返回值 CaculatorMaker  参数是：int 类型
> 
>   而且 刚好返回的是   相当于 这个返回值 和返回的代码块就是一个block的定义~~
 
> 所以外部调用的时候  add 相当于block   要想调用就直接  block（需要传递的参数）
   CaculatorMaker *(^)(int number)  = ^(int number){
    self.result+= number;
     return self;
      };
> 

** 但是现在还是有个问题  **
* 没有高聚合 没有把需要计算的代码放在一块 
* 而且每次每次都要使用创建一个类来计算  所以我们来创建一个分类方所有的类都可以计算

```
分类中
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
/**
 *  就相当于下面的例子
 */
 /*
[self loadData:^{
    //后执行
    NSLog(@"被回调了");
}];

//block 是作为参数的
-(void)loadData:(void(^)())finished{
    //先执行
    NSLog(@"执行耗时操作");
    //block回调
    finished();
}
*/
@end
```

* 外部的调用

```
外部的调用
   // block:使代码高聚合
 int result =  [NSObject makeCaculator:^(CaculatorMaker *maker) {
        maker.add(10).add(30);
        maker.add(20).add(40);
        maker.multy(2).division(10);
        maker.jian(19);
    }];
    NSLog(@"%d",result);
```

###总结

* 之前开发中比较习惯,把事情封装到一个方法中,
*  链式编程思想:把要做的事情封装到block,给外界提供一个返回这个Block的方法
*  链式编程思想方法特点:方法返回值必须是block,block参数:放需要操作的内容,block返回值:方法调用者

参考Demo:

