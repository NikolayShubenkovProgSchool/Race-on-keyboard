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

@property (nonatomic) Race* raceProperty;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    self.raceProperty = [[Race alloc] init];
    [self.enterRaceTextField becomeFirstResponder];
    [self setupMoreSlider];
    [self.raceProperty setUpTextInRace:self.textView AndMakeMaxValueOfSlider:self.progressRace];
    self.progressRace.value = 0;
    
}

-(void)setupSider:(UISlider *)slider{
    [slider setThumbImage:[UIImage imageNamed:[NSString stringWithFormat:@"car%d.png", arc4random_uniform(48) + 1]] forState:UIControlStateNormal];
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
