//
//  Calculator.m
//  ObjC
//
//  Created by MF839-001 on 2016. 6. 14..
//  Copyright © 2016년 MF839-001. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize operand1, operand2, accumulator;

-(id) init {
    self = [super init];
    
    if (self) {
        operand1 = [[Fraction alloc]init];
        operand2 = [[Fraction alloc]init];
        accumulator = [[Fraction alloc]init];
    }
    
    return self;
}

-(void) clear
{
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}

-(Fraction *) performOperation:(char)op {
    Fraction *result;
    
    switch (op)
    {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 sub: operand2];
            break;
        case '*':
            result = [operand1 mul: operand2];
            break;
        case '/':
            result = [operand1 div: operand2];
            break;
    }
    
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}

@end
