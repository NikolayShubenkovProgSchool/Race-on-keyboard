//
//  RaceViewController.m
//  Race on keyboard
//
//  Created by Semen on 11.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "RaceViewController.h"

@interface RaceViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *enterRaceTextField;
@property (assign, nonatomic) NSInteger countOfTouchOnKeyboard;
@property (nonatomic) NSMutableArray *raceTextMutable;
@property (nonatomic) NSMutableAttributedString *now;
@property (nonatomic) NSRange range;
@property (weak, nonatomic) IBOutlet UISlider *progressRace;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    [self.enterRaceTextField becomeFirstResponder];
    self.textView.textColor = [UIColor redColor];
    [self makeArrayFromString];
    self.progressRace.value = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - slider progress count

-(void)makeProgressBySlider{
    if (self.progressRace.value == self.progressRace.maximumValue - 1) {
                self.textView.text = @"You win!";
    }
    [UIView animateWithDuration:1.0 animations:^{
        [self.progressRace setValue:self.countOfTouchOnKeyboard animated:YES];
    }];
}

#pragma mark - array with text to textField

-(void)makeArrayFromString{
    NSString *text = @"One two three four";
    self.progressRace.maximumValue = text.length;
    self.raceTextMutable = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i != text.length; i++) {
        
        [self.raceTextMutable addObject:[text substringWithRange:NSMakeRange(i, 1)]];
        NSLog(@"%ld work", (long)i);
    }
    // показывает массив в виде нормальной строик без лишних символов
    NSString * result = [[self.raceTextMutable valueForKey:@"description"] componentsJoinedByString:@""];
    
    self.now = [[NSMutableAttributedString alloc]initWithString:result];
    
    self.textView.attributedText = self.now;
    NSLog(@"%@", result);
    
}

#pragma mark - check and play

- (IBAction)touchOnEnterRaceTextFieldEnded:(id)sender {
    
    NSLog(@"touch ended on keyboard %ld", (long)self.countOfTouchOnKeyboard);
    
    // с помощью строки приведенной ниже, можно через if проверять текст в массиве и ставить цвет
    self.range = NSMakeRange(0+self.countOfTouchOnKeyboard, 1);
    
    if (self.progressRace.value == self.progressRace.maximumValue) {
        return;
    }
    
    if ([self.enterRaceTextField.text isEqual:[self.textView.text substringWithRange:self.range]]) {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:self.range];
        self.textView.attributedText = self.now;
        //        self.textView.textColor =[UIColor yellowColor];
        self.enterRaceTextField.text = @"";
        self.countOfTouchOnKeyboard++;
        [self makeProgressBySlider];
    } else {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:self.range];
        self.textView.attributedText = self.now;
        //        self.textView.textColor =[UIColor yellowColor];
        self.enterRaceTextField.text = @"";
    }
}


@end
