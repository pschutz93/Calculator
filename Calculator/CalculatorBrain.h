//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Patrick Schutz on 7/13/13.
//  Copyright (c) 2013 Patrick Schutz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
-(void) enterNumber:(double)number;
-(double) add;
-(double) subtract;
-(double) divide;
-(double) multiply;
-(void) clear;
@end
