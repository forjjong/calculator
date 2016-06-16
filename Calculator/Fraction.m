//
//  Fraction.m
//  ObjC
//
//  Created by MF839-001 on 2016. 6. 13..
//  Copyright © 2016년 MF839-001. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

- (void) print
{
    NSLog(@"%i/%i", _numerator, _denominator);
}

- (double) convertToNum {
    if (_denominator != 0)
        return (double) _numerator / _denominator;
    else
        return NAN;
}

-(void) setTo:(int)n over:(int)d
{
    _numerator = n;
    _denominator = d;
}

-(void) reduce
{
    int u = _numerator;
    int v = _denominator;
    int temp;
    
    while (v != 0)
    {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    _numerator /= u;
    _denominator /= u;
}

-(NSString *) converToString {
    if (_numerator == _denominator)
        if (_numerator == 0)
            return @"0";
        else
            return @"1";
    else if (_denominator == 1)
        return [NSString stringWithFormat:@"%i", _numerator];
    else
        return [NSString stringWithFormat:@"%i/%i", _numerator, _denominator];
}

-(Fraction *)add:(Fraction *)f {
    Fraction *result = [[Fraction alloc]init];
    
    result.numerator = (self.numerator * f.denominator) +
    (self.denominator * f.numerator);
    result.denominator = self.denominator * f.denominator;
    [result reduce];
    
    return result;
}

-(Fraction *)sub:(Fraction *)f {
    Fraction *result = [[Fraction alloc]init];
    
    result.numerator = (self.numerator * f.denominator) -
    (self.denominator * f.denominator);
    result.denominator = self.denominator * f.denominator;
    [result reduce];
    
    return result;
}

-(Fraction *)mul:(Fraction *)f {
    Fraction *result = [[Fraction alloc]init];
    
    result.numerator = self.numerator * f.numerator;
    result.denominator = self.denominator * f.denominator;
    [result reduce];
    
    return result;
}

-(Fraction *)div:(Fraction *)f {
    Fraction *result = [[Fraction alloc]init];
    
    result.numerator = self.numerator * f.denominator;
    result.denominator = self.denominator * f.numerator;
    [result reduce];
    
    return result;
}

@end
