//
//  ViewController.m
//  Calculator
//
//  Created by MF839-001 on 2016. 6. 15..
//  Copyright © 2016년 MF839-001. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "InfoViewController.h"

@interface ViewController ()

@end


@implementation ViewController
{
    char op;
    int currentNumber;
    //int operandNumber;
    
    BOOL firstOperand, isNumberator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //operandNumber = 0;
    firstOperand = YES;
    isNumberator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//산술연산
- (IBAction)clickPlus:(id)sender {
    [self processOp:'+'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp:'-'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp:'*'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp:'/'];
}

//기타키
- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumberator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

- (IBAction)clickEqual:(id)sender {
    //if(operandNumber >= 1) {
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString:@" = "];
        [displayString appendString: [myCalculator.accumulator converToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumberator = YES;
        //operandNumber = 0;
        firstOperand = YES;
        [self setBtnEn:YES];
        [displayString setString:@""];
    }
}

- (IBAction)clickClear:(id)sender {
    isNumberator = YES;
    firstOperand = YES;
    //operandNumber = 0;
    currentNumber = 0;
    [self setBtnEn:YES];
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
}

//숫자키
- (IBAction)clickDigit:(id)sender {
    //UIButton *btn = (
    int digit = (int)((UIButton *)sender).tag;
   [self processDigit: digit];
}

//추가
- (void) processDigit:(int)digit{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    display.text = displayString;
}
- (void) processOp:(char)theOp{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" x ";
            break;
        case '/':
            opStr = @" % ";
            break;
    }
    
    [self storeFracPart];
    //operandNumber++;
    firstOperand = NO;
    //if (operandNumber >= 1) {
    [self setBtnEn:NO];
    //}
    isNumberator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
}

- (void) storeFracPart{
    //if (operandNumber == 0) {
    if (firstOperand) {
        if (isNumberator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumberator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        //firstOperand = YES;
    }
    
    currentNumber = 0;
}

-(void) setBtnEn:(BOOL)en {
    
    for (int i=0; i <self.myButtons.count; i++) {
        UIButton *btn = [self.myButtons objectAtIndex:i];
        btn.enabled = en;
    }
    //self.plusBtn.enabled = en;
    //self.minusBtn.enabled = en;
    //self.mulBtn.enabled = en;
    //self.divBtn.enabled = en;
}
//-(void) viewWillAppear:(BOOL)animated {
//    NSLog(@"viewWillAppear");
//}
//
//-(void) viewWillDisappear:(BOOL)animated {
//    NSLog(@"viewWillDisappear");
//}

- (IBAction)openInfoView:(id)sender {
    
    InfoViewController *infoViewContoller = [self.storyboard instantiateViewControllerWithIdentifier:@"infoview"];
    
    
    infoViewContoller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController: infoViewContoller
                       animated:YES
                     completion:nil];
}

- (IBAction)openNewView:(id)sender {
    [self performSegueWithIdentifier:@"blueview" sender:self];
}
@end
