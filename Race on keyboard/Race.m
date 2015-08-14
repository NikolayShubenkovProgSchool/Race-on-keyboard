//
//  Race.m
//  Race on keyboard
//
//  Created by Semen on 13.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "Race.h"

@interface Race ()

@property (nonatomic) NSRange                   range;
@property (nonatomic) NSMutableAttributedString *now;
@property (assign, nonatomic) NSInteger         countOfTouchOnKeyboard;

@end

@implementation Race

#pragma mark - setup tex in race

-(void)setUpTextInRace:(UITextView *)textView AndMakeMaxValueOfSlider:(UISlider *)slider{
    
    // добавляем текст в игру, надо создать класс "text"]
    NSString *text = @"One two three four";
    slider.maximumValue = text.length;
    self.now = [[NSMutableAttributedString alloc]initWithString:text];
    textView.attributedText = self.now ;
    
    NSLog(@"%@", text);
    
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
    self.range = NSMakeRange(0+self.countOfTouchOnKeyboard, 1);
    
    if (slider.value == slider.maximumValue) {
        return;
    }
    
    if ([textField.text isEqual:[textView.text substringWithRange:self.range]]) {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:self.range];
        textView.attributedText = self.now;
        textField.text = @"";
        self.countOfTouchOnKeyboard++;
        [self makeProgressBySlider:slider and:textView];
    } else {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:self.range];
        textView.attributedText = self.now;
        textField.text = @"";
    }
}


@end
