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
    // Do any additional setup after loading the view.
}



-(void)makeArrayFromString{
    NSString *text = @"One two three four";
    NSInteger lengthOfTextView = text.length;
    NSMutableArray *raceTextMutable = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i != lengthOfTextView; i++) {
//        [raceTextMutable addObject:[self.textView.text substringWithRange:NSMakeRange(i, 1)]];
        [raceTextMutable addObject:[text substringWithRange:NSMakeRange(i, 1)]];
     
        NSLog(@"%ld work", i);
    }
    // с помощью строки приведенной ниже, можно через if проверять текст в массиве и ставить цвет
    // попробовать через текстфилд с плэйсхолдером и пробелами, тогда цвет можно будет увести

    
    NSString * result = [[raceTextMutable valueForKey:@"description"] componentsJoinedByString:@""];
    self.textView.text = result;
    
    NSLog(@"%@", result);
    
    NSLog(@"%@", raceTextMutable);
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
