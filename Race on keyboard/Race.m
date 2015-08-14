//
//  Race.m
//  Race on keyboard
//
//  Created by Semen on 13.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "Race.h"

@interface Race ()

@property (nonatomic) NSRange range;



@end

@implementation Race

#pragma mark - testing class

-(void)test:(UITextView *)textView{
    textView.textColor = [UIColor purpleColor];
}

-(void)testNumberTwo:(UITextView *)textView{
    textView.backgroundColor = [UIColor yellowColor];
}

#pragma mark - slider progress count

-(void)makeProgressBySlider:(UISlider *)slider and:(UITextView *)textView{
    if (slider.value == slider.maximumValue - 1) {
        textView.text = @"You win!";
    }
    [UIView animateWithDuration:1.0 animations:^{
        [slider setValue:self.countOfTouchOnKeyboard animated:YES];
    }];
}

-(void)edittingLetter:(UISlider *)slider and:(UITextView *)textView :(UITextField *)textField{
    
    NSLog(@"touch ended on keyboard %ld", (long)self.countOfTouchOnKeyboard);
    
    // с помощью строки приведенной ниже, можно через if проверять текст в массиве и ставить цвет
    self.range = NSMakeRange(0+self.countOfTouchOnKeyboard, 1);
    
    if (slider.value == slider.maximumValue) {
        return;
    }
    
    if ([textField.text isEqual:[textView.text substringWithRange:self.range]]) {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:self.range];
        textView.attributedText = self.now;
        //        self.textView.textColor =[UIColor yellowColor];
        textField.text = @"";
        self.countOfTouchOnKeyboard++;
        [self makeProgressBySlider:slider and:textView];
    } else {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:self.range];
        textView.attributedText = self.now;
        //        self.textView.textColor =[UIColor yellowColor];
        textField.text = @"";
    }
}




@end
