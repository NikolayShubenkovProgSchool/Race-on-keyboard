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

@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    [self.enterRaceTextField becomeFirstResponder];
    self.textView.textColor = [UIColor redColor];
    [self makeArrayFromTextView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}



-(void)makeArrayFromTextView{
    
    NSInteger lengthOfTextView = self.textView.text.length;
    NSMutableArray *raceTextMutable = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i != lengthOfTextView; i++) {
        [raceTextMutable addObject:[self.textView.text substringWithRange:NSMakeRange(i, 1)]];
        
        // с помощью строки приведенной ниже, можно через if проверять текст в массиве и ставить цвет
        // попробовать через текстфилд с плэйсхолдером и пробелами, тогда цвет можно будет увести
        
        if ([[self.textView.text substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"i"]) {
            self.textView.textColor = [UIColor blueColor];
        }
        NSLog(@"%ld work", i);
    }
    
    NSString * result = [[raceTextMutable valueForKey:@"description"] componentsJoinedByString:@""];
    self.textView.text = result;
    
    NSLog(@"%@", result);
    
    NSLog(@"%@", raceTextMutable);
}




@end
