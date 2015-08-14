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
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderOne;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderTwo;
@property (assign , nonatomic) NSInteger numberOfCar;

//проверка, чтобы не попались одинаковые машинки
@property (assign , nonatomic) NSInteger checkRepeatNumberOfCar;
@property (assign , nonatomic) NSInteger checkRepeatNumberOfCarTwice;
@property (assign, nonatomic) NSInteger checkAboutRepeat;

@property (nonatomic) Race* raceProperty;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    self.raceProperty = [[Race alloc] init];
    [self.enterRaceTextField becomeFirstResponder];
    self.progressRace.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0.7 alpha:0.03];
    [self setupMoreSlider];
    [self.raceProperty setUpTextInRace:self.textView AndMakeMaxValueOfSlider:self.progressRace];
    self.progressRace.value = 0;
    
}

-(void)setupSider:(UISlider *)slider{
    //проверка, чтобы не попались одинаковые машинки
    self.numberOfCar = arc4random_uniform(48) + 1;
    NSLog(@"random%ld", (long)self.numberOfCar);
    if (self.numberOfCar != self.checkRepeatNumberOfCar && self.numberOfCar != self.checkRepeatNumberOfCarTwice) {
        [slider setThumbImage:[UIImage imageNamed:[NSString stringWithFormat:@"car%ld.png", (long)self.numberOfCar]] forState:UIControlStateNormal];
        self.checkRepeatNumberOfCar = self.numberOfCar;
        if (self.checkAboutRepeat < 1) {
            self.checkAboutRepeat++;
            self.checkRepeatNumberOfCarTwice = self.numberOfCar;
        }
    }else{
        [self setupSider:slider];
    }
    slider.minimumTrackTintColor = [UIColor clearColor];
    slider.maximumTrackTintColor = [UIColor clearColor];
    slider.userInteractionEnabled = NO;
    slider.value = 0;
}

-(void)setupMoreSlider{
    
    NSArray *sliders = [[NSArray alloc] initWithObjects:self.progressRace, self.opponentSliderOne, self.opponentSliderTwo, nil];
    
    for (id n in sliders) {
        [self setupSider:n];
    }
    
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
