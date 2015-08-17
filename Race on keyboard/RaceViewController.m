//
//  RaceViewController.m
//  Race on keyboard
//
//  Created by Semen on 11.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "RaceViewController.h"
#import "Race.h"
#import "CarsCollection.h"
#import "CarSelect.h"
#import "YouWinYouLoseViewController.h"

@interface RaceViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *enterRaceTextField;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderOne;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderTwo;
@property (weak, nonatomic) IBOutlet UISlider *playerProgressRaceSlider;

@property (nonatomic) Race* raceProperty;
@property (nonatomic) CarsCollection* makeCar;

@end

@implementation RaceViewController

#pragma mark - setup

- (IBAction)restart:(id)sender {
    [self setup];
}

-(void)setup{
    self.raceProperty = [[Race alloc] init];
    self.makeCar = [[CarsCollection alloc] init];
    [self.enterRaceTextField becomeFirstResponder];
    self.playerProgressRaceSlider.backgroundColor = [UIColor colorWithRed:0 green:0.7 blue:0 alpha:0.03];

    [self setupMoreSlider];
    [self.raceProperty setUpTextInRace:self.textView AndMakeMaxValueOfSlider:self.playerProgressRaceSlider];
    self.playerProgressRaceSlider.value = 0;
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
}

-(void)setupSider:(UISlider *)slider{

    NSLog(@"setup");
    slider.minimumTrackTintColor = [UIColor clearColor];
    slider.maximumTrackTintColor = [UIColor clearColor];
    slider.userInteractionEnabled = NO;
    slider.value = 0;
    

}

-(void)playerSliderSetup{
    
    CarSelect* car = [CarSelect new];
    [self.playerProgressRaceSlider setThumbImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ ", [car loadFromFile]]] forState:UIControlStateNormal];
    NSLog(@"машинка игрока установлена");
    [self setupSider:self.playerProgressRaceSlider];
}

-(void)setupMoreSlider{
//    CarSelect* car = [CarSelect new];
//    [self.playerProgressRaceSlider setThumbImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ ", [car loadFromFile]]] forState:UIControlStateNormal];
//    NSLog(@"машинка игрока установлена");
//    [self setupSider:self.playerProgressRaceSlider];
    [self playerSliderSetup];
    
    NSArray *sliders = [[NSArray alloc] initWithObjects: self.opponentSliderOne, self.opponentSliderTwo, nil];

    for (id n in sliders) {
        [self setupSider:n];
        [self.makeCar changeCarsColor:n];
        NSLog(@"бот настроен");

    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - check and play

- (IBAction)touchOnEnterRaceTextFieldEnded:(id)sender {
    
    [self.raceProperty edittingLetter:self.playerProgressRaceSlider and:self.textView :self.enterRaceTextField];
    if (self.playerProgressRaceSlider.value == self.playerProgressRaceSlider.maximumValue) {
       [self performSelector:@selector(youWin)
                  withObject:nil
                  afterDelay:0.5];
    }

}

-(void)youWin{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YouWinYouLoseViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"YouWinYouLoseViewController"];
    [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:rvc animated:NO completion:nil];
}


@end
