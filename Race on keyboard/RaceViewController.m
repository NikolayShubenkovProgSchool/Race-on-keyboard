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
@property (weak, nonatomic) IBOutlet UISlider *progressRace;
@property (nonatomic) Race* raceProperty;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    
    self.raceProperty = [[Race alloc] init];
    [self.enterRaceTextField becomeFirstResponder];
    [self.raceProperty setUpTextInRace:self.textView AndMakeMaxValueOfSlider:self.progressRace];
    [self.progressRace setThumbImage:[UIImage imageNamed:@"car8.png"] forState:UIControlStateNormal];
    self.progressRace.value = 0;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setup];
}

#pragma mark - check and play

- (IBAction)touchOnEnterRaceTextFieldEnded:(id)sender {
    
    [self.raceProperty edittingLetter:self.progressRace and:self.textView :self.enterRaceTextField];

}


@end
