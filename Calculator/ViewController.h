//
//  ViewController.h
//  Calculator
//
//  Created by MF839-001 on 2016. 6. 15..
//  Copyright © 2016년 MF839-001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

@property (weak, nonatomic) IBOutlet UIButton *plusBtn;
@property (weak, nonatomic) IBOutlet UIButton *minusBtn;
@property (weak, nonatomic) IBOutlet UIButton *mulBtn;
@property (weak, nonatomic) IBOutlet UIButton *divBtn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myButtons;

- (IBAction)openInfoView:(id)sender;
- (IBAction)openNewView:(id)sender;

//산술연산키
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

//기타키
- (IBAction)clickOver:(id)sender;
- (IBAction)clickEqual:(id)sender;
- (IBAction)clickClear:(id)sender;

//숫자키
- (IBAction)clickDigit:(id)sender;

//추가
- (void) processDigit:(int)digit;
- (void) processOp:(char)theOp;
- (void) storeFracPart;
- (void) setBtnEn:(BOOL) en;

@end

