//
//  Fraction.h
//  ObjC
//
//  Created by MF839-001 on 2016. 6. 13..
//  Copyright © 2016년 MF839-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator, denominator;
-(void) print;
-(double) convertToNum;
-(void) setTo:(int)n over:(int)d;
-(void) reduce;
-(NSString *) converToString;

-(Fraction *)add:(Fraction *)f;
-(Fraction *)mul:(Fraction *)f;
-(Fraction *)sub:(Fraction *)f;
-(Fraction *)div:(Fraction *)f;
@end
