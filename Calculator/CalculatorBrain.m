//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Patrick Schutz on 7/13/13.
//  Copyright (c) 2013 Patrick Schutz. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (strong,nonatomic)NSMutableArray *brainStack;
enum Operation{
    Add,Subtract, Divide, Multiply
};
@end
@implementation CalculatorBrain


-(void)enterNumber:(double)number{
    [self pushOperand:number];
}
-(NSMutableArray *)brainStack{
    if(_brainStack==nil){
        _brainStack=[[NSMutableArray alloc]init];
    }
    return _brainStack;
}
-(void)pushOperand:(double)operand{
    [self.brainStack addObject:@(operand)];
}
-(double)popOperand{
    NSNumber *operand=[self.brainStack lastObject];
    if(operand)[self.brainStack removeLastObject];
    return [operand doubleValue];
}
-(double)performOperation:(int)operation{
    double result=0;
    double rightOperand=[self popOperand];
    double leftOperand=[self popOperand];
    switch(operation){
        case 0:
            result=leftOperand+rightOperand;
            break;
        case 1:
            result=leftOperand-rightOperand;
            break;
        case 2:
            result=leftOperand/rightOperand;
            break;
        case 3:
            result=leftOperand*rightOperand;
    }
    [self pushOperand:result];
    return result;
}
-(double)add{
    enum Operation operator=Add;
    return [self performOperation:operator];
}
-(double)subtract{
    enum Operation operator=Subtract;
    return [self performOperation:operator];
}
-(double)divide{
    enum Operation operator=Divide;
    return [self performOperation:operator];
}
-(double)multiply{
    enum Operation operator=Multiply;
    return [self performOperation:operator];
}
-(void)clear{
    _brainStack=nil;
}
@end

