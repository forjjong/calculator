//
//  Calculator.h
//  ObjC
//
//  Created by MF839-001 on 2016. 6. 14..
//  Copyright © 2016년 MF839-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property double accumulator;
// 누산기 메서드
-(void) clear;
// 산술 연산 메서스
-(void) add: (double) value;
-(void) subtract: (double) value;
-(void) multiply: (double) value;
-(void) divide: (double) value;

@end
