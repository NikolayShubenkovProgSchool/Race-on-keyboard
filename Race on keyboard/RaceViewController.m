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


@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    [self.enterRaceTextField becomeFirstResponder];
    self.textView.textColor = [UIColor redColor];
    [self makeArrayFromString];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}



-(void)makeArrayFromString{
    NSString *text = @"One two three four";
    NSInteger lengthOfTextView = text.length;
    self.raceTextMutable = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i != lengthOfTextView; i++) {
        
        [self.raceTextMutable addObject:[text substringWithRange:NSMakeRange(i, 1)]];
        NSLog(@"%ld work", i);
    }
    // показывает массив в виде нормальной строик без лишних символов
    NSString * result = [[self.raceTextMutable valueForKey:@"description"] componentsJoinedByString:@""];
    //раскрашивает цвет букв и фона на определенном range
    self.now = [[NSMutableAttributedString alloc]initWithString:result];
    [self.now addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,5)];
    [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(4, 6)];
    self.textView.attributedText = self.now;
    NSLog(@"%@", result);
    
}

- (IBAction)touchOnenterRaceTextFieldEnded:(id)sender {

    NSLog(@"touch ended on keyboard %ld", self.countOfTouchOnKeyboard);
    
    // с помощью строки приведенной ниже, можно через if проверять текст в массиве и ставить цвет
    
    if ([self.enterRaceTextField.text isEqual:[self.textView.text substringWithRange:NSMakeRange(0+self.countOfTouchOnKeyboard, 1 + self.countOfTouchOnKeyboard)]]) {

        self.textView.textColor =[UIColor yellowColor];
        self.enterRaceTextField.text = @"";
        
    }
    self.countOfTouchOnKeyboard++;
}


@end
