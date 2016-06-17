//
//  ThirdViewController.h
//  Calculator
//
//  Created by MF839-001 on 2016. 6. 17..
//  Copyright © 2016년 MF839-001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController {
    // delegate 를 사용하지 않을경우
    void(^changeMainBackColor) (UIColor*);
}



- (IBAction)changeColor:(id)sender;

// delegate 를 사용하지 않을경우
- (void) changeColorFunc:(void(^)(UIColor*))myFunc;

@end
