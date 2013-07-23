//
//  ViewController.m
//  Calculator
//
//  Created by Patrick Schutz on 7/13/13.
//  Copyright (c) 2013 Patrick Schutz. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
@property (strong, nonatomic) CalculatorBrain *brain;

@end

@implementation ViewController{
    BOOL enteringNumber;
}
- (IBAction)addButtonTapped:(UIButton *)sender {
    [self autoEnter];
    [self displayResult: [self.brain add]];
}
- (IBAction)subtractButtonTapped:(UIButton *)sender {
    [self autoEnter];
    [self displayResult:[self.brain subtract]];
}
-(void) autoEnter{
    if(enteringNumber)
        [self enterPressed];
}

-(void) displayResult:(double)result{
    NSString *resultString=[NSString stringWithFormat:@"%g",result];
    self.calculatorDisplay.text=resultString;
}

-(CalculatorBrain *)brain{
    if(_brain==nil){
        _brain=[[CalculatorBrain alloc]init];
    }
    return _brain;
}

- (void) appendDigit: (NSString *)digit{
    self.calculatorDisplay.text=[self.calculatorDisplay.text stringByAppendingString:digit];
}
- (void) displayDigit:(NSString *)digit{
    self.calculatorDisplay.text=digit;
    enteringNumber=YES;
}
- (IBAction)digitButtonPressed:(UIButton *)sender {
    
    NSString *numberValue=sender.currentTitle;
    if(enteringNumber){
        [self appendDigit:numberValue];
    }
    else{
        [self displayDigit:numberValue];
    }
    
    
}
- (IBAction)divideButtonPressed:(UIButton *)sender {
    [self autoEnter];
    [self displayResult:[self.brain divide]];
}
- (IBAction)multiplyButtonPressed:(UIButton *)sender {
    [self autoEnter];
    [self displayResult:[self.brain multiply]];
}

- (IBAction)enterPressed {
    [self.brain enterNumber: [self.calculatorDisplay.text doubleValue]];
    enteringNumber=NO;
}

- (IBAction)clear {
    [self.brain clear];
    self.calculatorDisplay.text=@"";
}

@end
