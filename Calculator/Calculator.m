//
//  Calculator.m
//  ObjC
//
//  Created by MF839-001 on 2016. 6. 14..
//  Copyright © 2016년 MF839-001. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(void) clear
{
    _accumulator = 0;
}

-(void) add:(double)value
{
    _accumulator += value;
}

-(void) subtract:(double)value
{
    _accumulator -= value;
}

-(void) multiply:(double)value
{
    _accumulator *=value;
}

-(void) divide:(double)value
{
    if (value != 0.0)
        _accumulator /= value;
    else
    {
        NSLog(@"Division by zero.");
        _accumulator = NAN;
    }
}
@end
