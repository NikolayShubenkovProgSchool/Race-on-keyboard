//
//  Race.m
//  Race on keyboard
//
//  Created by Semen on 13.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "Race.h"

@interface Race ()

@property (assign, nonatomic) NSInteger countOfTouchOnKeyboard;

@end

@implementation Race

-(void)test:(UITextView *)textView{
    textView.textColor = [UIColor purpleColor];
}

-(void)testNumberTwo:(UITextView *)textView{
    textView.backgroundColor = [UIColor yellowColor];
}

-(void)makeProgressBySlider:(UISlider *)slider and:(UITextView *)textView{
    if (slider.value == slider.maximumValue - 1) {
        textView.text = @"You win!";
    }
    [UIView animateWithDuration:1.0 animations:^{
        [slider setValue:self.countOfTouchOnKeyboard animated:YES];
    }];
}

@end
