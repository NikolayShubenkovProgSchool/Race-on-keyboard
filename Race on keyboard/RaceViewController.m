//
//  RaceViewController.m
//  Race on keyboard
//
//  Created by Semen on 11.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "RaceViewController.h"
#import "Race.h"

@interface RaceViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *enterRaceTextField;
// @property (nonatomic) NSMutableArray *raceTextMutable;
// @property (nonatomic) NSMutableAttributedString *now;
// @property (nonatomic) NSRange range;
@property (weak, nonatomic) IBOutlet UISlider *progressRace;
@property (nonatomic) Race* raceProperty;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    self.raceProperty = [[Race alloc] init];
    [self.enterRaceTextField becomeFirstResponder];
    [self makeArrayFromString];
    self.progressRace.value = 0;
    
    // проверка создания класса Race]
    [self.raceProperty test:self.textView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - array with text to textField

-(void)makeArrayFromString{
    NSString *text = @"One two three four";
    self.progressRace.maximumValue = text.length;
    
    self.raceProperty.now = [[NSMutableAttributedString alloc]initWithString:text];
    
    self.textView.attributedText = self.raceProperty.now ;
    NSLog(@"%@", text);
    
}

#pragma mark - check and play

- (IBAction)touchOnEnterRaceTextFieldEnded:(id)sender {
//
    [self.raceProperty edittingLetter:self.progressRace and:self.textView :self.enterRaceTextField];

//    NSLog(@"touch ended on keyboard %ld", (long)self.raceProperty.countOfTouchOnKeyboard);
//    
//    // с помощью строки приведенной ниже, можно через if проверять текст в массиве и ставить цвет
//    self.range = NSMakeRange(0+self.raceProperty.countOfTouchOnKeyboard, 1);
//    
//    if (self.progressRace.value == self.progressRace.maximumValue) {
//        return;
//    }
//    
//    if ([self.enterRaceTextField.text isEqual:[self.textView.text substringWithRange:self.range]]) {
//        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:self.range];
//        self.textView.attributedText = self.now;
//        //        self.textView.textColor =[UIColor yellowColor];
//        self.enterRaceTextField.text = @"";
//        self.raceProperty.countOfTouchOnKeyboard++;
//        [self.raceProperty makeProgressBySlider:self.progressRace and:self.textView];
//    } else {
//        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:self.range];
//        self.textView.attributedText = self.now;
//        //        self.textView.textColor =[UIColor yellowColor];
//        self.enterRaceTextField.text = @"";
//    }
}


@end
