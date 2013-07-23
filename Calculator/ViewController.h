//
//  ViewController.h
//  Calculator
//
//  Created by Patrick Schutz on 7/13/13.
//  Copyright (c) 2013 Patrick Schutz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)digitButtonPressed:(UIButton *)sender;

- (IBAction)enterPressed;
@property (weak, nonatomic) IBOutlet UILabel *calculatorDisplay;
@end
