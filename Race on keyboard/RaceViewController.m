//
//  RaceViewController.m
//  Race on keyboard
//
//  Created by Semen on 11.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "RaceViewController.h"
#import "Race.h"
#import "CarsChoiseAndColors.h"

@interface RaceViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *enterRaceTextField;
@property (weak, nonatomic) IBOutlet UISlider *progressRace;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderOne;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderTwo;

@property (nonatomic) Race* raceProperty;
@property (nonatomic) CarsChoiseAndColors* makeCar;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    self.raceProperty = [[Race alloc] init];
    self.makeCar = [[CarsChoiseAndColors alloc] init];
    [self.enterRaceTextField becomeFirstResponder];
    self.progressRace.backgroundColor = [UIColor colorWithRed:0 green:0.7 blue:0 alpha:0.03];
    [self setupMoreSlider];
    [self.raceProperty setUpTextInRace:self.textView AndMakeMaxValueOfSlider:self.progressRace];
    self.progressRace.value = 0;
    
}

-(void)setupSider:(UISlider *)slider{

    NSLog(@"setup");
    slider.tintColor = [UIColor redColor];
    slider.minimumTrackTintColor = [UIColor clearColor];
    slider.maximumTrackTintColor = [UIColor clearColor];
    slider.userInteractionEnabled = NO;
    slider.value = 0;
        [self.makeCar changeCarsColor:slider];
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
