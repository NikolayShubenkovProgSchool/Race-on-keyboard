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
    NSMutableArray *raceTextMutable = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i != lengthOfTextView; i++) {
        
        [raceTextMutable addObject:[text substringWithRange:NSMakeRange(i, 1)]];
        NSLog(@"%ld work", i);
    }
    // показывает массив в виде нормальной строик без лишних символов
    NSString * result = [[raceTextMutable valueForKey:@"description"] componentsJoinedByString:@""];
    NSMutableAttributedString *now = [[NSMutableAttributedString alloc]initWithString:result];
    [now addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,5)];
    [now addAttribute:NSBackgroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(4, 6)];
//    [now setTextColor:[UIColor blueColor]];
    self.textView.attributedText = now;
    NSLog(@"%@", result);
    
}

- (IBAction)touchOnenterRaceTextFieldEnded:(id)sender {
    
    NSLog(@"touch ended on keyboard %ld", self.countOfTouchOnKeyboard);
    // с помощью строки приведенной ниже, можно через if проверять текст в массиве и ставить цвет
    if ([self.enterRaceTextField.text isEqual:[self.textView.text substringWithRange:NSMakeRange(0, 1)]]) {
        self.textView.textColor =[UIColor yellowColor];
        
    }
    self.countOfTouchOnKeyboard++;
}


@end
