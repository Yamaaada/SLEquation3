//
//  Equation.m
//  SLEquation
//
//  Created by 山田悠加 on 2013/10/24.
//  Copyright (c) 2013年 Haruka. All rights reserved.
//

#import "Equation.h"

@implementation EquationY

- (NSInteger)finishWithInteger:(NSInteger)a WithInteger:(NSInteger)b WithInteger:(NSInteger)c
{
    return (b - a) / (c - 1);
}
@end

@implementation EquationX

- (NSInteger)finishWithInteger:(NSInteger)a WithInteger:(NSInteger)b WithInteger:(NSInteger)c
{
    return a - (b - a) / (c - 1);
}

@end
